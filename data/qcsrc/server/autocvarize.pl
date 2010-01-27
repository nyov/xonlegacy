#!/usr/bin/perl
# this tool generates JUST the autocvar declarations for cvars
use strict;
use warnings;

my @files = @ARGV;

my %cvars = ();
my %old = ();

sub found($$$)
{
	my ($name, $type, $force) = @_;
	$old{$name} = 1
		if $force;
	if(exists $cvars{$name} and $type ne $cvars{$name})
	{
		warn "cvar $name used with different types";
		if($force)
		{
			$cvars{$name} = $type;
		}
		else
		{
			undef $cvars{$name}
				unless $old{$name};
		}
		next;
	}
	else
	{
		$cvars{$name} = $type;
	}
}

for my $f(@files)
{
	print STDERR "In file $f\n";
	open my $fh, "<", $f;
	while(<$fh>)
	{
		chomp;
		if(/^\/\/#NO AUTOCVARS START/ .. /^\/\/#NO AUTOCVARS END/)
		{
			next;
		}
		s/\/\/.*//;
		if(/^float autocvar_(.*);$/)
		{
			found $1, 'cvar', 1;
			next;
		}
		if(/^string autocvar_(.*);$/)
		{
			found $1, 'cvar_string', 1;
			next;
		}
		if(/^#define autocvar_(.*) cvar("\1")$/)
		{
			found $1, 'cvar', 1;
			next;
		}
		if(/^#define autocvar_(.*) cvar_string("\1")$/)
		{
			found $1, 'cvar_string', 1;
			next;
		}
		while(/\b(cvar|cvar_string)\s*\(\s*"([^"]+)"\s*\)/g)
		{
			found $2, $1, 0;
		}
	}
}

for my $name(sort keys %cvars)
{
	my $type = $cvars{$name};
	next if $old{$name};
	if($type eq 'unknown')
	{
		print "// cannot declare $name, it is used with different types\n";
	}
	if($type eq 'cvar')
	{
		print "float autocvar_$name;\n";
	}
	if($type eq 'cvar_string')
	{
		print "string autocvar_$name;\n";
	}
}

for my $f(@files)
{
	print STDERR "In file $f\n";
	open my $fh, "<", $f;
	my $out = "";
	while(<$fh>)
	{
		chomp;
		if(/^\/\/#NO AUTOCVARS START/ .. /^\/\/#NO AUTOCVARS END/)
		{
			$out .= "$_\n";
			next;
		}
		if(/^float autocvar_(.*);$/)
		{
			$out .= "$_\n";
			next;
		}
		if(/^string autocvar_(.*);$/)
		{
			$out .= "$_\n";
			next;
		}
		if(/^#define autocvar_(.*) cvar("\1")$/)
		{
			$out .= "$_\n";
			next;
		}
		if(/^#define autocvar_(.*) cvar_string("\1")$/)
		{
			$out .= "$_\n";
			next;
		}
		s{\b(cvar|cvar_string)\s*\(\s*"([^"]+)"\s*\)}{
			my ($type, $name) = ($1, $2);
			my $realtype = $cvars{$name};
			my $r = $&;
			if(defined $realtype)
			{
				#$r = "$realtype(\"$name\")";
				$r = "autocvar_$name";
				if($type eq 'cvar' && $realtype eq 'cvar_string')
				{
					$r = "stof($r)";
				}
				if($type eq 'cvar_string' && $realtype eq 'cvar')
				{
					$r = "ftos($r)";
				}
			}
			$r;
		}ge;
		$out .= "$_\n";
	}
	close $fh;
	open $fh, ">", $f;
	print $fh $out;
	close $fh;
}
