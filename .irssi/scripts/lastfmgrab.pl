#!/usr/bin/perl -w
# lastfmgrab
# Grabs your last listened to track from last.fm
# INCLUDES
use strict;
use XML::RSS;
use LWP::Simple;

use vars qw($VERSION %IRSSI);
use Irssi;

$VERSION = '1.01';
%IRSSI = (
    authors     => 'nosmo',
    contact     => 'nosmo@netsoc.tcd.ie',
    name        => 'lastfmgrab',
    description => 'Allows the last track ' .
                   'displayed on last.fm' .
                   'to be displayed via IRSSI',
    license     => 'Public Domain',
          );
# Declare variables
my $content;
my $site;
     
my $arg = "luigii249";
$site = "http://ws.audioscrobbler.com/1.0/user/$arg/recenttracks.rss";

#create new instance of XML::RSS
my $rss = new XML::RSS;

# argument is a URL
$content = get($site);

# parse the RSS content displayed
$rss->parse($content);
                                                      	   
my $item =  @{$rss->{'items'}}[0];

sub showsong {
	my $rss = new XML::RSS;
        $content = get($site);
	$rss->parse($content);
	my $item =  @{$rss->{'items'}}[0];

	my ($data, $server, $witem) = @_;
	if ($witem && ($witem->{type} eq "CHANNEL" ||
			$witem->{type} eq "QUERY")) {
		$item->{'title'} =~ s/\x{2013}/-/;
		Irssi::print($item->{'title'});
		$witem->command("ACTION $witem->{name} - $item->{'title'}");
	}
}

Irssi::command_bind('lastsong', 'showsong');
