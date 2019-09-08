#!/usr/bin/env /usr/bin/perl5

use utf8;
use Encode qw/encode decode/;

while (<>) {
    $_ = decode('EUC-JP', $_);
    /\S/ || next;
    /^\s*;/ && next;

    /^\s*>/ && next;
    /^\s*#/ && next;

    /^[0-9a-zA-Z\^\!\@\#\$\%\^\&\*\(\)\-\+\=]+$/ && next;
    
    chomp;

    ($yomi, $tangobu) = split(/\s/,$_);

    next if ($yomi =~ /.+[a-z]$/);

    @tangos = split(/\//, $tangobu);

    foreach $tango (@tangos) {
	$tango =~ s/(;.+)$//;

	$tango =~ /\S/ || next;
	
	$outl = "$yomi\t$tango\t名詞";
	printf encode('UTF-8', $outl . "\n");
    }


    
}
