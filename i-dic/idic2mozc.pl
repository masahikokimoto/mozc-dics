#!/usr/bin/env /usr/bin/perl5

use utf8;
use Encode qw/encode decode/;

while (<>) {
    $_ = decode('EUC-JP', $_);
    /\S/ || next;

    ($yomi, $tango) = split(/\t/,$_);

    unless ($yomi =~ /\s/) {
	printf encode('UTF-8', "$yomi\t$tango\t人名\n");
	next;
    }

    @yomis = split(/\s/, $yomi);
    @tangos = split(/\s/, $tango);

    for ($i = 0; $i <= $#yomis; $i ++) {
	$yomis[$i] =~ /\S/ || next;
	$tangos[$i] =~ /\S/ || next;
	printf encode('UTF-8', "$yomis[$i]\t$tangos[$i]\t人名\n");
    }

    $yomi =~ s/\s+//g;
    $tango =~ s/\s+//g;
    printf encode('UTF-8', "$yomi\t$tango\t人名\n");
}
