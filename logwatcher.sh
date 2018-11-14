#!/bin/bash
# v.1; GNU GPL
# Written by Kyle Pott
# Download a log file and check if it has changed.
# If it has changed then send an email.
# Pre-reqs: access SSH access, ssmtp installed and configured

# rename the source file
# if the source file does not exist a warning is displayed, but the script will keep processing just fine.
touch error_log
cp error_log error_log_source

# download the file.  This can be done regularly be scheduling this script as a cron job
# as a security precaution the log file should not be available over the open internet.
# You can use an .htaccess file to make sure open internet access is restricted.
# In order to fully automate the authentication process you can follow this guide: liuxproblem.org/art_9.html
scp yourSSHaccount@yourdomain.com:~/public_html/path/to/file ~/path/to/where/you/want/to/compare/file

# comparison logic
# https://stackoverflow.com/questions/8139885/shellscript-action-if-two-files-are-different
if ! cmp error_log error_log_source > /dev/null 2>&1
then 
# email logic
echo "new login detected $(date)" | ssmtp youremailaddress@email.com
fi
