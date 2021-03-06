package Bugzilla::Markdown::GFM::SyntaxExtensionList;
use strict;
use warnings;

use Data::Printer;

sub SETUP {
    my ($class, $FFI) = @_;

    $FFI->custom_type(
        markdown_syntax_extension_list_t => {
            native_type    => 'opaque',
            native_to_perl => sub {
                bless \$_[0], $class if $_[0];
            },
            perl_to_native => sub { ${ $_[0] } },
        }
    );
}

1;