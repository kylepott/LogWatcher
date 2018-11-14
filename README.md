# LogWatcher
LogWatcher is a utility to perform very simple automated system monitoring and alerting.  It is an ideal solution to use in conjunction with a web app that has a sound event logging architecture implemented.  LogWatcher simply watches an error log file for any anomalous behavior.  If someone attempts a log in, attempts to read the database, hack the URL, or any other adverse behavior that is landing in an error log file, LogWatcher can send an email alert to make you aware.

LogWatcher.sh is meant to be run on your local server and can be scheduled as a cron job.

LogWatcherBlue.sh is meant to run as a cron job within cPanel on a webhost.  If you schedule the cron job to run every minute you essentially have continuous monitoring and alerting.  If you added a grep phrase into the logwatcher scripts you could alert for specific user behavior.

The principle difference between LogWatcher.sh and LogWatcherBlue.sh is that LogWatcher requires an SSH login and it requries SMTP to be pre-configured.  LogWatcherBlue assumes direct access to the error log and it uses the webhost's settings to send an email using a terminal utility called mailx.  Of course if you used your cell carriers SMS gateway you could have text alerts.

Both LogWatcher.sh and LogWatcherBlue.sh will require you to configure your SSH access and the paths to your error_log file.
