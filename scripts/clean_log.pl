#
# Remove the error lines such as:
#    [rtsp @ 0x7f47681faa80] RTP: PT=60: bad cseq 44c0 expected=7e7c
#    [h264 @ 0x7f476821db90] concealing 12874 DC, 12874 AC, 12874 MV errors in P frame
#

use strict;
use warnings;

my $log = 'moonfire_jlpoole_2020May27_050128PDT.log';
my $content;
{
    local $/;
    open(IN,$log) or die "Could not open $log";
    $content = <IN>;
    close(IN);
}
$content =~ s/\[rtsp.*?\n//g;
$content =~ s/\[h264.*?\n//g; 

my $new_log = "Reduced_".$log;
open(OUT,"+>$new_log") or die "Could not open outpue $new_log";
print OUT $content;
close(OUT);
