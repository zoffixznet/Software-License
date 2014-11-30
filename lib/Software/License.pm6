use Software::License::Apache_2_0;
use Software::License::Artistic_2_0;
use Software::License::BSD;
use Software::License::FreeBSD;
use Software::License::GPL3;
use Software::License::MIT;

class Software::License
{
    method full_text (Str:D $license_name, Str:D $holder, Int:D $year=DateTime.new(time).year)
    {
        my $license;

        if $license_name eq 'Apache2'
        {
            $license = Software::License::Apache_2_0.new;
        }
        elsif $license_name eq 'Artistic2'
        {
            $license = Software::License::Artistic_2_0.new;
        }
        elsif $license_name eq 'BSD'
        {
            $license = Software::License::BSD.new;
        }
        elsif $license_name eq 'FreeBSD'
        {
            $license = Software::License::FreeBSD.new;
        }
        elsif $license_name eq 'GPL3'
        {
            $license = Software::License::GPL3.new;
        }
        elsif $license_name eq 'MIT'
        {
            $license = Software::License::MIT.new;
        }
        else
        {
            die "$license_name not recognized";
        }
        return join "\n\n", preamble($holder, $year), '    ' ~ $license.long_name, $license.full_text($holder, $year);
    }

    sub preamble (Str:D $holder, Int:D $year)
    {
        return "This software is Copyright (c) $year by $holder.\n\nThis is free software, licensed under:";
    }
}

=begin pod

=head1 NAME

Software::License - a Perl 6 module for creating free software licenses.

=head2 SYNOPSIS

    use Software::License;

    my $license = Software::License.new;
    my $freebsd_text_2014 = $license.fulltext('FreeBSD', 'David Farrell'); # defaults to current year
    my $mit_text_2009 = $license.fulltext('FreeBSD', 'David Farrell', 2009); # can provide year as an arg

=head2 DESCRIPTION

Software::License is a Perl 6 module for minting free software license texts. The module recognizes the following licenses:

=item Apache2 - the Apache 2.0 license

=item Artistic2 - the Artistic 2.0 license

=item BSD - the BSD license

=item FreeBSD - the two clause BSD license

=item GPL3 - GPL 3 license 2007

=item MIT - the MIT license

=head2 AUTHOR

David Farrell

=head2 LICENSE

FreeBSD - see LICENSE

=end pod
