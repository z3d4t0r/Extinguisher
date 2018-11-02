#!/usr/bin/env perl
use strict;
use warnings;
use Browser::Open qw( open_browser );
use WWW::Mechanize;
use JSON;
use Time::HiRes;
use Term::ANSIColor;

sub clear{
        print "\033[2J";
        print "\033[0;0H";
}

sub back{
        print "Going Back To Main Menu...\n";
        sleep(1);
        clear();
        menu();
}

sub quit{
        print color "bold red";
        print "Goodbye...\n";
        sleep(1);
        print color "reset";
        clear();
        exit(0);
}

sub banner{
print color "bold red";
print q"
     ------------..
       ''........$$$$.
        /'.' $;$   '$$.
       !./'..$;$..  '$$
       !'.$;;;;;;;$. $$
       ' $;;;;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$
         $;; ;;;;;;$ $$.
         $;; ;;;;;;$ '$$
         $;; ;;;;;;$
         $;; ;;;;;;$
         $;;;;;;;;;$
         dp;;;;;;;;$
          '$$$$$$$'
";
print color "bold green";
print q"
..................................
!       The Extinguisher         !
!        made by zedator         !
!................................!
";
print color "reset";
}

sub p_search{
        clear();
        while( 1 ){
                banner();
                print "\n";
                print "PEOPLE SEARCH\n";
                print "\n";
                print "{1}Pipl.com                | Lookup by name\n";
                print "{2}Spokeo.com              | Search Public Records\n";
                print "{3}Namechk.com             | Search Username\n";
                print "{4}Grabify.link            | IP Grabber\n";
                print "{5}Email.addresssearch.com | Search Email\n";
                print "{6}Back                    | Back To Main Menu\n";
                print "\n";
                print "-> ";
                my $site = <STDIN>;
                chomp($site);
                if($site eq "1"){
                        my $url = 'http://pipl.com';
                        print "Opening $url\n";
                        sleep(1);
                        open_browser($url);
                        clear();
                }
                if($site eq "2"){
                        my $url = 'http://spokeo.com';
                        print "Opening $url\n";
                        sleep(1);
                        open_browser($url);
                        clear();
                }
                if($site eq "3"){
                        my $url = 'http://namechk.com';
                        print "Opening $url\n";
                        sleep(1);
                        open_browser($url);
                        clear();
                }
                if($site eq "4"){
                        my $url = 'http://grabify.link.com';
                        print "Opening $url\n";
                        sleep(1);
                        open_browser($url);
                        clear();

                }
                if($site eq "5"){
                        my $url = 'http://email.addresssearch.com';
                        print "Opening $url\n";
                        sleep(1);
                        open_browser($url);
                        clear();

                }
                if($site eq "6"){
                        back();
                }
        }
}

sub ip_geo{
        clear();
        while( 1 ){
                banner();
                print "\n";
                print "IP GEOLOCATION\n";
                print "\n";
                print "ENTER IP ";
                my $ip = <STDIN>;
                chomp($ip);
                my $GET=WWW::Mechanize->new();
                        $GET->get("http://ip-api.com/json/$ip");
                        my $json = $GET->content();

                my $info = decode_json($json);

                print "Status        ", $info->{'status'}, "\n";
                print "IP            ", $info->{'query'}, "\n";
                print "City          ", $info->{'city'}, "\n";
                print "Zip Code      ", $info->{'zip'}, "\n";
                print "Timezone      ", $info->{'timezone'}, "\n";
                print "Region        ", $info->{'region'}, "\n";
                print "Region Name   ", $info->{'regionName'}, "\n";
                print "Country Code  ", $info->{'countryCode'}, "\n";
                print "Country       ", $info->{'country'}, "\n";
                print "ISP           ", $info->{'isp'}, "\n";
                print "AS Number/Name", $info->{'as'}, "\n";
                print "Latitude      ", $info->{'lat'}, "\n";
                print "Longitude     ", $info->{'lon'}, "\n";
                print "\n";
                print "{1}Write | Write To A File\n";
                print "{2}Back  | Back To Main Menu\n";
                my $back = <STDIN>;
                chomp($back);
                if($back eq "1"){
                        print "Write to? (file.txt): ";
                        my $write = <STDIN>;
                        
                        open(FILE, ">$write");
                        print FILE "Status         : $info->{'status'}\n";
                        print FILE "IP             : $info->{'query'}\n";
                        print FILE "City           : $info->{'city'}\n";
                        print FILE "Zip Code       : $info->{'zip'}\n";
                        print FILE "Timezone       : $info->{'timezone'}\n";
                        print FILE "Region         : $info->{'region'}\n";
                        print FILE "Region Name    : $info->{'regionName'}\n";
                        print FILE "Country Code   : $info->{'countryCode'}\n";
                        print FILE "Country        : $info->{'country'}\n";
                        print FILE "ISP            : $info->{'isp'}\n";
                        print FILE "AS Number/Name : $info->{'as'}\n";
                        print FILE "Latitide       : $info->{'lat'}\n";
                        print FILE "Longitude      : $info->{'lon'}\n";
                        close(FILE);
                        sleep(1);
                        print "Successfully Written To $write\n";
                        sleep(1);
                        back();
                }
                if($back eq "2"){
                        back();
                }
        }
}

sub dox{
        clear();
        while( 1 ){
                banner();
                print "\n";
                print "DOX AUTOMATION\n";
                print "\n";
                print "First Name: ";
                my $f = <STDIN>;
                print "Middle Name: ";
                my $m = <STDIN>;
                print "Last Name: ";
                my $l = <STDIN>;
                print "IP: ";
                my $ip = <STDIN>;
                print "ISP: ";
                my $isp = <STDIN>;
                print "City: ";
                my $city = <STDIN>;
                print "State: ";
                my $state = <STDIN>;
                print "Country: ";
                my $country = <STDIN>;
                print "Phone: ";
                my $phone = <STDIN>;
                print "Address: ";
                my $address = <STDIN>;
                print "Save To? (dox.txt): ";
                my $file_name = <STDIN>;
                chomp($file_name);
                
                print "Writing to $file_name\n";
                sleep(1);
                open(FILE, ">$file_name");
                print FILE "First Name:  $f";
                print FILE "Middle Name: $m";
                print FILE "Last Name:   $l";
                print FILE "IP:          $ip";
                print FILE "ISP:         $isp";
                print FILE "City:        $city";
                print FILE "State:       $state";
                print FILE "Country:     $country";
                print FILE "Phone:       $phone";
                print FILE "Address:     $address";
                close(FILE);
                sleep(1);
                print "Successfully written to $file_name\n";
                sleep(1);
                back();
        }
}

sub menu{
        clear();
        while( 1 ){
                banner();
                print "\n";
                print color "bold white";
                print "{1}People Search  | Search For Victim Info\n";
                print "{2}IP Geolocation | Geolocate Victims IP\n";
                print "{3}Dox Writer     | Write Dox To A File\n";
                print "{4}Quit           | Quit The Extinguisher\n";
                print "\n";
                print color "bold green";
                print "-> ";
                print color "reset";
                my $opt = <STDIN>;
                chomp($opt);
                if($opt eq "1"){
                        p_search();
                }
                if($opt eq "2"){
                        ip_geo();
                }
                if($opt eq "3"){
                        dox();
                }               
                if($opt eq "4"){
                        quit();
                }
                if($opt > "4"){
                        clear();
                        sleep(1);
                        print "You Entered An Invalid Option...\n";
                        sleep(1);
                        clear();
                        back();
                }
                else{
                        menu();
                }
        }
}
menu();
