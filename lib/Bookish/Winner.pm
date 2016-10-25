package Bookish::Winner;
use 5.10.1;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(tokens);

sub tokens {
    my @words = @_;

    my %seen;

    # map each word to it's lowercase so our sequences are case insensative
    for my $word ( map { lc $_ } @words ) {

        # break each word down to a list of sequences using positive lookahead
        for my $seq ( $word =~ /(?=(.{4}))/gc ) {
            push @{ $seen{$seq} //= [] }, $word;
        }
    }

    for my $seq ( keys %seen ) {

        # filter out duplicate words
        if ( @{ $seen{$seq} } > 1 ) {
            delete $seen{$seq};
            next;
        }

        # unwrap the arrayref for what's left
        $seen{$seq} = $seen{$seq}->[0];
    }

    # return the list sorted by sequence
    return map { $_ => $seen{$_} } sort keys %seen;
}

1;
__END__
