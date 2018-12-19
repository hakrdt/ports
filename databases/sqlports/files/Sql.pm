#! /usr/bin/perl
# $OpenBSD: Sql.pm,v 1.1 2018/12/18 19:09:26 espie Exp $
#
# Copyright (c) 2018 Marc Espie <espie@openbsd.org>
#
# Permission to use, copy, modify, and distribute this software for any
# purpose with or without fee is hereby granted, provided that the above
# copyright notice and this permission notice appear in all copies.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
# WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
# MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
# ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
# WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
# ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
# OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.

# This does implement objects for an Sql Tree.

use strict;
use warnings;

package Sql::Object;
sub new
{
	my ($class, $name) = @_;
	bless {name => $name}, $class;
}

sub indent
{
	my ($self, $string, $plus) = @_;
	$self->{level} //= 0;
	return ' 'x(($self->{level}+$plus)).$string;
}

sub name
{
	my $self = shift;
	return $self->{name};
}

sub drop
{
	my $self = shift;
	return "DROP ".$self->type." IF EXISTS ".$self->name;
}

sub dump
{
	my $self = shift;
	print $self->stringize, "\n";
}

sub add
{
	my $self = shift;
	for my $o (@_) {
		push(@{$self->{$o->category}}, $o);
	}
	return $self;
}

package Sql::Create;
our @ISA = qw(Sql::Object);

sub stringize
{
	my $self = shift;
	return "CREATE ".$self->type." ".$self->name." ".
	    join("\n", $self->contents);
}

sub sort
{
	my $self = shift;

	$self->{columns} = [ sort {$a->name cmp $b->name} @{$self->{columns}}];
	return $self;
}

package Sql::Create::Table;
our @ISA = qw(Sql::Create);

sub type
{
	"TABLE"
}

sub contents
{
	my $self = shift;
	my @c;
	for my $col (@{$self->{columns}}) {
		push(@c, $col->stringize);
	}
	if (defined $self->{constraints}) {
		my @d = ();
		for my $cons (@{$self->{constraints}}) {
			push(@d, $cons->name);
		}
		push(@c, "UNIQUE(".join(", ", @d). ")");
	}
	return "(". join(', ', @c).")";
}

package Sql::Create::View;
our @ISA = qw(Sql::Create);
sub type
{
	"VIEW"
}

sub new
{
	my ($class, $name) = @_;
	bless {name => $name, select => Sql::Select->new}, $class;
}


sub contents
{
	my $self = shift;
	my @parts = ("AS");

	$self->{select}{level} = ($self->{level}//0)+4;

	return ("AS", $self->{select}->contents);
}

sub add
{
	my $self = shift;
	$self->{select}->add(@_);
	return $self;
}

sub sort
{
	my $self = shift;
	$self->{select}->sort;
	return $self;
}

package Sql::Select;
our @ISA = qw(Sql::Create);


sub contents
{
	my $self = shift;

	my @parts = ();
	# compute the joins
	my $joins = {};
	
	for my $c (@{$self->{columns}}) {
		$joins->{$c->{join}} = $c->{join};

	}

	# figure out used tables
	my $tables = {};
	$tables->{$self->origin}++;

	for my $j (values %$joins) {
		$tables->{$j->name}++;
	}

	my $alias = "T0001";
	for my $j (values %$joins) {
		if ($tables->{$j->name} == 1) {
			delete $j->{alias};
		} else {
			$j->{alias} = $alias++;
		}
	}

	push(@parts, $self->indent("SELECT", 0));
	for my $c (@{$self->{columns}}) {
		push(@parts, $self->indent($c->stringize, 4));

	}
	push(@parts, $self->indent("FROM ".$self->origin, 0));
	for my $j  (values %$joins) {
		push(@parts, $self->indent($j->join_part, 4));
		my @p = $j->on_part($self);
		if (@p > 0) {
			push(@parts, $self->indent("ON ".join(" AND", @p), 8));
		}
	}
	if (defined $self->{group}) {
		push(@parts, $self->indent("GROUP BY ".
		    join(", ", @{$self->{group}}), 4));
	}
	if (defined $self->{order}) {
		push(@parts, $self->indent("ORDER BY ".
		    join(", ", @{$self->{order}}), 4));
	}
	return @parts;
}

sub origin
{
	my $self = shift;
	return $self->{origin}[0]->name;
}

package Sql::Origin;
our @ISA = qw(Sql::Object);
sub category
{
	"origin"
}

package Sql::Order;
our @ISA = qw(Sql::Object);
sub category
{
	"order"
}

package Sql::Group;
our @ISA = qw(Sql::Object);
sub category
{
	"group"
}

package Sql::Column;
our @ISA = qw(Sql::Object);
sub category
{
	"columns"
}

sub new
{
	my ($class, $name) = @_;
	bless {name => $name}, $class;
}

sub notnull
{
	my $self = shift;
	$self->{notnull} = 1;
	return $self;
}

sub null
{
	my $self = shift;
	delete $self->{notnull};
	return $self;
}

sub unique
{
	my $self = shift;
	$self->{unique} = 1;
	return $self;
}

sub stringize
{
	my $self = shift;
	my @c = ($self->name, $self->type);
	if ($self->{notnull}) {
		push(@c, "NOT NULL");
	}
	if ($self->{unique}) {
		push(@c, "UNIQUE");
	}
	if ($self->{references}) {
		push(@c, "REFERENCES $self->{references}{table}($self->{references}{field})");
	}
	return join(" ", @c);
}

package Sql::Column::Integer;
our @ISA = qw(Sql::Column);

sub type
{
	"INTEGER"
}

sub references
{
	my ($self, $table, $field) = @_;
	$self->{references}{table} = $table;
	$self->{references}{field} = $field;
	return $self->notnull;
}

package Sql::Column::View;
our @ISA = qw(Sql::Column);

sub stringize
{
	my $self = shift;

	return $self->{join}->alias.".".$self->name." AS ".$self->name;
}

sub join
{
	my ($self, $j) = @_;
	$self->{join} = $j;
	return $self;
}


package Sql::Column::Text;
our @ISA = qw(Sql::Column);
sub type
{
	"TEXT";
}

package Sql::Column::Key;
our @ISA = qw(Sql::Column::Integer);
sub type
{
	"INTEGER PRIMARY KEY AUTOINCREMENT"
}

package Sql::Constraint;
our @ISA = qw(Sql::Object);

sub category
{
	"constraints"
}

package Sql::Join;
our @ISA = qw(Sql::Object);
sub category
{
	"joins"
}

sub join_part
{
	my $self = shift;
	my $s = "JOIN ".$self->name;
	if (defined $self->{alias}) {
		$s .= " ".$self->{alias};
	}
	if ($self->{left}) {
		$s = "LEFT ".$s;
	}
	return $s;
}

sub alias
{
	my $self = shift;
	return $self->{alias} // $self->{name};
}

sub on_part
{
	my ($self, $view) = @_;
	return map {$_->equation($self, $view)} @{$self->{equals}};

}

sub left
{
	my $self = shift;
	$self->{left} = 1;
	return $self;
}

package Sql::Equal;
our @ISA = qw(Sql::Object);

sub new
{
	my ($class, $a, $b) = @_;
	bless {a => $a, b => $b}, $class;
}

sub category
{
	"equals"
}

sub equation
{
	my ($self, $join, $view) = @_;

	return $join->alias.".".$self->{a}."=".$view->origin.".".$self->{b};
}

1;