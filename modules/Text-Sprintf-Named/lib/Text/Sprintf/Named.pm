package Text::Sprintf::Named;

use warnings;
use strict;

use Carp;

=head1 NAME

Text::Sprintf::Named - sprintf-like function with named conversions

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

    use Text::Sprintf::Named;

    my $formatter =
        Text::Sprintf::Named->new(
            {fmt => "Hello %(name)s! Today is %(day)s!"
        );

    # Returns "Hello Ayeleth! Today is Sunday!"
    $formmater->format({'name' => "Ayeleth", 'day' => "Sunday"});

    # Returns "Hello John! Today is Thursday!"
    $formatter->format({'name' => "John", 'day' => "Thursday"});

=head1 DESCRIPTION

Text::Sprintf::Named provides a sprintf equivalent with named conversions.
Named conversions are sprintf field specifiers (like C<"%s"> or C<"%4d>")
only they are associated with the key of an associative array of
parameters. So for example C<"%(name)s"> will emit the C<'name'> parameter
as a string, and C<"%(num)4d"> will emit the C<'num'> parameter 
as a variable with a width of 4.

=head1 FUNCTIONS

=head2 my $formatter = Text::Sprintf::Named->new({fmt => $format})

Creates a new object which formats according to the C<$format> format.

=cut

sub new
{
    my $class = shift;

    my $self = {};
    bless $self, $class;

    $self->_init(@_);

    return $self;
}

sub _init
{
    my ($self, $args) = @_;

    my $fmt = $args->{fmt} or
        confess "The 'fmt format was not specified for Text::Sprintf::Named.";
    $self->_fmt($fmt);

    return 0;
}

sub _fmt
{
    my $self = shift;

    if (@_)
    {
        $self->{_fmt} = shift;
    }

    return $self->{_fmt};
}

=head2 $formatter->format({args => \%bindings})

Returns the formatting string as formatted using the named parameters
pointed to by C<args>.

=cut

sub format
{
    my $self = shift;

    my $args = shift || { args => {}};

    my $format = $self->_fmt;

    $format =~ s{%%}{%}g;

    return $format;
}

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 AUTHOR

Shlomi Fish, C<< <shlomif at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-text-sprintf-named at rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Text::Sprintf::Named>.
I will be notified, and then you'll automatically be notified of progress on
your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Text::Sprintf::Named

You can also look for information at:

=over 4

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Text::Sprintf::Named>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Text::Sprintf::Named>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Text::Sprintf::Named>

=item * Search CPAN

L<http://search.cpan.org/dist/Text::Sprintf::Named>

=back

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2006 Shlomi Fish, all rights reserved.

This program is released under the following license: MIT X11. 

(Note that the module's meta-data specifies it's distributed under the BSD 
license, which is the closest option to the MIT X11 license.)

=cut

1; # End of Text::Sprintf::Named
