#!/usr/bin/env bash
# v0.2; GNU GPL
# Written by Kyle Pott
# Download a log file and check if it has changed.
# If it has changed then send an email.
# Pre-reqs: access SSH access, ssmtp installed and configured
log_file=error_log

# rename the source file
# if the source file does not exist a warning is displayed, but the script will keep processing just fine.
create_file(){
  if [ ! -f $log_file ]; then
    touch error_log
  fi
  cp error_log error_log_source
}

# download the file.  This can be done regularly be scheduling this script as a cron job
# as a security precaution the log file should not be available over the open internet.
# You can use an .htaccess file to make sure open internet access is restricted.
# In order to fully automate the authentication process you can follow this guide: liuxproblem.org/art_9.html
scp_file(){
 scp ${user}@${remote_host}:${remote_file} ${local_file}
}

# comparison logic
# https://stackoverflow.com/questions/8139885/shellscript-action-if-two-files-are-different
compare_file(){
  if ! cmp error_log error_log_source > /dev/null 2>&1; then
    # email logic
    echo "new login detected $(date)" | ssmtp ${email_address}
  fi
}

# print example usage
usage(){
# sample colors to use
red="tput setaf 1"
green="tput setaf 2"
yellow="tput setaf 3"
reset="tput sgr0"

# change output color to green
$green

echo "
    Usage: $0 [-u] [-r] [-f] [-l] [-e]

    Example: ./logwatcher.sh -u my_user -r my_server.my_domain.com -f /path/to/remote/file -l /path/to/local/file -e myself@me.com
    "

# switch back to default output color
$reset
}

#################
# Script Begins #
#################
while getopts ":u:r:f:l:e:" opt; do
  case ${opt} in
    u ) # user
        user=${OPTARG}
        ;;
    r ) # remote host
        remote_host=${OPTARG}
        ;;
    f ) # remote file
        remote_file=${OPTARG}
        ;;
    l ) # local file
        local_file=${OPTARG}
        ;;
    e ) # email address
        email_address=${OPTARG}
        ;;
        # help if -h or no opts passed
    h | ?) usage
      ;;
  esac
done

# discard unidentified args from arg list
shift "$((OPTIND-1))"

# ensure all opts are set
if [[ -z "${user}" || -z "${remote_host}" || -z "${remote_file}" || -z "${local_file}" || -z "${email_address}" ]]; then
  usage
else
  create_file
  scp_file
  compare_file
fi
