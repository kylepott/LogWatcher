# LogWatcher
LogWatcher is a utility to perform automated monitoring and alerting.  It is an ideal solution to use in conjunction with web apps that have a solid event logging architecture built in.  LogWatcher simply watches an error log file for any anomalous behavior.  If someone attempts a log in, attempts to read the database, hack the UL, or any other adverse behavior that is landing in a log file, LogWatcher can send an alert to make you aware.

LogWatcher.sh is meant to be run on your local server and can be scheduled as a cron job.

LogWatherBlue.sh is meant to run as a cron job within cPanel on a webhost.  If you schedule the cron job to run every minute you essentially have continuous monitoring and alerting.  If you added a grep phrase into the logwatcher scripts you could alert for specific user behavior.
