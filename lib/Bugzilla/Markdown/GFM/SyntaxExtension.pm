package Bugzilla::Markdown::GFM::SyntaxExtension;
use strict;
use warnings;

use Data::Printer;

sub SETUP {
    my ($class, $FFI) = @_;

    $FFI->custom_type(
        markdown_syntax_extension_t => {
            native_type    => 'opaque',
            native_to_perl => sub {
                bless \$_[0], $class if $_[0];
            },
            perl_to_native => sub { ${ $_[0] } },
        }
    );
    $FFI->attach(
        [ cmark_find_syntax_extension => 'find' ],
        [ 'string' ] => 'markdown_syntax_extension_t',
        sub {
            my $c_func = shift;
            return $c_func->($_[1]);
        }
    );
}

1;