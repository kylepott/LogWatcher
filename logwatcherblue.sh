#!/bin/bash
# v.1; GNU - GPL
# Author: Kyle Pott
# This script is designed to be run as a cron job on a web host
# This script assumes unauthenticated access to the error_log file.
# Download a log file and check if it has changed.
# If it has changed then send an email.
# Here is what you can enter to schedule the cron job on your web host: 
# /bin/sh /home/username/public_html/logwatcherblue.sh

# create and rename the source file
# if the source file does not exist a warning is displayed, but the script will keep processing just fine.
touch error_log
cp error_log error_log_source
cp ~/public_html/path/to/your/error_log error_log #Edit this to be the path to your error_log

# comparison logic
# https://stackoverflow.com/questions/8139885/shellscript-action-if-two-files-are-different
if ! cmp error_log error_log_source > /dev/null 2>&1
then
# email logic
echo "new login detected at $(date)" | mailx youremailaddress@email.com
fi

# Some webhosts send you a confirmation email after a cron job runs.
# That would not be practicable if you set the cron job to run every minute. 
# So we add this to the bottom of our file to suppress automated cron notification.
> /dev/null 2>&1
