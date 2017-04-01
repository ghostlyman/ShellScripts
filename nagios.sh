#!/usr/bin/env bash
#
# Nagios Installation Scripts
#


yum -y install mod_fcgid links perl-Data-Dumper xinetd

rpm -Uvh "https://labs.consol.de/repo/stable/rhel7/i386/labs-consol-stable.rhel7.noarch.rpm"


#disabled selinux
#vim /etc/selinux/config


cd /etc/yum.repos.d/

touch epel.repo
cat > epel.repo << EOF
[EPEL7]
name="Extra Packages for Enterprise Linux 7 - x86_64"
baseurl=http://cobbler-nyc.fwmrm.net/cobbler/repo_mirror/EPEL7
enabled=1
gpgcheck=0
EOF




touch freewheel-rhel7-tools.internal.repo
cat > freewheel-rhel7-tools.internal.repo << EOF
[freewheel-rhel7-tools]
name="Red Hat Enterprise Linux 7 Vendor FreeWheel (x86_64)"
baseurl=http://cobbler.fwmrm.net/cobbler/repo_mirror/freewheel-rhel7-tools
priority=10
enabled=1
gpgcheck=0

[freewheel-test]
name="Red Hat Enterprise Linux 7 Vendor FreeWheel (x86_64) - Test"
baseurl=http://cobbler.fwmrm.net/cobbler/repo_mirror/freewheel-test
enabled=0
gpgcheck=0
EOF


touch labs-consol-stable.repo
echo '[labs_consol_stable]' >> labs-consol-stable.repo
echo 'name=labs_consol_stable' >> labs-consol-stable.repo
echo 'baseurl=http://labs.consol.de/repo/stable/rhel7/$basearch' >> labs-consol-stable.repo
echo 'type=yum' >> labs-consol-stable.repo
echo 'enabled=1' >> labs-consol-stable.repo
echo 'gpgcheck=0' >> labs-consol-stable.repo
echo 'gpgkey=http://labs.consol.de/repo/stable/RPM-GPG-KEY' >> labs-consol-stable.repo



touch local.repo
cat > local.repo << EOF
[centos-7]
name="Cent OS 7 Server (x86_64)"
baseurl=http://cobbler-nyc.fwmrm.net/cobbler/repo_mirror/centos-7
enabled=1
gpgcheck=0

[centos-7-updates]
name="Cent OS 7 updates (x86_64)"
baseurl=http://cobbler-nyc.fwmrm.net/cobbler/repo_mirror/centos-7-updates
enabled=1
gpgcheck=0
EOF




# Thruk authorization

cat > /etc/thruk/cgi.cfg << EOF
#################################################################
#
# CGI.CFG - Sample CGI Configuration File
#
#################################################################

# CONTEXT-SENSITIVE HELP
# This option determines whether or not a context-sensitive
# help icon will be displayed for most of the CGIs.
# Values: 0 = disables context-sensitive help
#         1 = enables context-sensitive help

show_context_help=0

# AUTHENTICATION USAGE
# This option controls whether or not the CGIs will use any
# authentication when displaying host and service information, as
# well as committing commands for processing.
#
# Read the HTML documentation to learn how the authorization works!
#
# NOTE: It is a really *bad* idea to disable authorization, unless
# you plan on removing the command CGI (cmd.cgi)!  Failure to do
# so will leave you wide open to kiddies messing with Thruk and
# possibly hitting you with a denial of service attack by filling up
# your drive by continuously writing to your command file!
#
# Setting this value to 0 will cause the CGIs to *not* use
# authentication (bad idea), while any other value will make them
# use the authentication functions (the default).

use_authentication=1




# x509 CERT AUTHENTICATION
# When enabled, this option allows you to use x509 cert (SSL)
# authentication in the CGIs.  This is an advanced option and should
# not be enabled unless you know what you're doing.

use_ssl_authentication=0




# DEFAULT USER
# Setting this variable will define a default user name that can
# access pages without authentication.  This allows people within a
# secure domain (i.e., behind a firewall) to see the current status
# without authenticating.  You may want to use this to avoid basic
# authentication if you are not using a secure server since basic
# authentication transmits passwords in the clear.
#
# Important:  Do not define a default username unless you are
# running a secure web server and are sure that everyone who has
# access to the CGIs has been authenticated in some manner!  If you
# define this variable, anyone who has not authenticated to the web
# server will inherit all rights you assign to this user!

default_user_name=



# SYSTEM/PROCESS INFORMATION ACCESS
# This option is a comma-delimited list of all usernames that
# have access to viewing the process information as
# provided by the Extended Information CGI (extinfo.cgi).  By
# default, *no one* has access to this unless you choose to
# not use authorization.  You may use an asterisk (*) to
# authorize any user who has authenticated to the web server.
# Alternatively you can specify contactgroups too

authorized_for_system_information=thrukadmin
authorized_contactgroup_for_system_information=


# CONFIGURATION INFORMATION ACCESS
# This option is a comma-delimited list of all usernames that
# can view ALL configuration information (hosts, commands, etc).
# By default, users can only view configuration information
# for the hosts and services they are contacts for. You may use
# an asterisk (*) to authorize any user who has authenticated
# to the web server.
# Alternatively you can specify contactgroups too

authorized_for_configuration_information=eng,nagiosadmin,ops,thrukadmin
authorized_contactgroup_for_configuration_information=


# SYSTEM/PROCESS COMMAND ACCESS
# This option is a comma-delimited list of all usernames that
# can issue shutdown and restart commands via the
# command CGI (cmd.cgi).  Users in this list can also change
# the program mode to active or standby. By default, *no one*
# has access to this unless you choose to not use authorization.
# You may use an asterisk (*) to authorize any user who has
# authenticated to the web server.
# Alternatively you can specify contactgroups too

authorized_for_system_commands=thrukadmin
authorized_contactgroup_for_system_commands=


# GLOBAL HOST/SERVICE VIEW ACCESS
# These two options are comma-delimited lists of all usernames that
# can view information for all hosts and services that are being
# monitored.  By default, users can only view information
# for hosts or services that they are contacts for (unless you
# you choose to not use authorization). You may use an asterisk (*)
# to authorize any user who has authenticated to the web server.
# Alternatively you can specify contactgroups too

authorized_for_all_services=eng,nagiosadmin,ops,thrukadmin,sa-ops
authorized_contactgroup_for_all_services=

authorized_for_all_hosts=eng,nagiosadmin,ops,thrukadmin,sa-ops
authorized_contactgroup_for_all_hosts=


# GLOBAL HOST/SERVICE COMMAND ACCESS
# These two options are comma-delimited lists of all usernames that
# can issue host or service related commands via the command
# CGI (cmd.cgi) for all hosts and services that are being monitored.
# By default, users can only issue commands for hosts or services
# that they are contacts for (unless you you choose to not use
# authorization).  You may use an asterisk (*) to authorize any
# user who has authenticated to the web server.
# Alternatively you can specify contactgroups too

authorized_for_all_service_commands=nagiosadmin,ops,thrukadmin
authorized_contactgroup_for_all_service_commands=

authorized_for_all_host_commands=nagiosadmin,ops,thrukadmin
authorized_contactgroup_for_all_host_commands=

# READ-ONLY USERS
# A comma-delimited list of usernames that have read-only rights in
# the CGIs.  This will block any service or host commands normally shown
# on the extinfo CGI pages.  It will also block comments from being shown
# to read-only users.
# Alternatively you can specify contactgroups too

authorized_for_read_only=sa-ops
authorized_contactgroup_for_read_only=

# REFRESH RATE
# This option allows you to specify the refresh rate in seconds
# of various CGIs (status, statusmap, extinfo, and outages).

refresh_rate=90



# ESCAPE HTML TAGS
# This option determines whether HTML tags in host and service
# status output is escaped in the web interface.  If enabled,
# your plugin output will not be able to contain clickable links.

escape_html_tags=1


# URL TARGET FRAMES
# These options determine the target frames in which notes and
# action URLs will open.

action_url_target=_blank
notes_url_target=_blank


# LOCK AUTHOR NAMES OPTION
# This option determines whether users can change the author name
# when submitting comments, scheduling downtime.  If disabled, the
# author names will be locked into their contact name, as defined in your Monitoring.
# Values: 0 = allow editing author names
#         1 = lock author names (disallow editing)

lock_author_names=1


# SOUND OPTIONS
# These options allow you to specify an optional audio file
# that should be played in your browser window when there are
# problems on the network.  The audio files are used only in
# the status CGI.  Only the sound for the most critical problem
# will be played.  Order of importance (higher to lower) is as
# follows: unreachable hosts, down hosts, critical services,
# warning services, and unknown services. If there are no
# visible problems, the sound file optionally specified by
# 'normal_sound' variable will be played.
#
# <varname>=<sound_file>
#
# Note: All audio files use relative paths from /thruk/cgi-bin/status.cgi
# and must be accessible by web

host_unreachable_sound=../media/critical.wav
host_down_sound=../media/critical.wav
service_critical_sound=../media/critical.wav
service_warning_sound=../media/warning.wav
service_unknown_sound=../media/unknown.wav
#normal_sound=../media/ok.wav
EOF




wget download.thruk.org/pkg/v2.08/rhel7/x86_64/thruk-2.08-1.rhel7.x86_64.rpm
wget download.thruk.org/pkg/v2.08/rhel7/x86_64/thruk-base-2.08-1.rhel7.x86_64.rpm
wget download.thruk.org/pkg/v2.08/rhel7/x86_64/thruk-plugin-reporting-2.08-1.rhel7.x86_64.rpm
wget download.thruk.org/pkg/v2.08/rhel7/x86_64/libthruk-2.08-1.rhel7.x86_64.rpm

scp ghostlyman@jp.vpn.xurick.com:/tmp/libthruk-2.08-1.rhel7.x86_64.rpm ./
scp ghostlyman@jp.vpn.xurick.com:/tmp/thruk-2.08-1.rhel7.x86_64.rpm ./
scp ghostlyman@jp.vpn.xurick.com:/tmp/thruk-base-2.08-1.rhel7.x86_64.rpm ./
scp ghostlyman@jp.vpn.xurick.com:/tmp/thruk-plugin-reporting-2.08-1.rhel7.x86_64.rpm ./
