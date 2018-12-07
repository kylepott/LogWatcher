# LogWatcher
LogWatcher is a utility to perform very simple automated system monitoring and alerting.  It is an ideal solution to use in conjunction with a web app that has a sound event logging architecture implemented.  LogWatcher simply watches an error log file for any anomalous behavior.  If someone attempts a log in, attempts to read the database, hack the URL, or any other adverse behavior that is landing in an error log file, LogWatcher can send an email alert to make you aware.

LogWatcher.sh is meant to be run on your local server and can be scheduled as a cron job.

LogWatcherBlue.sh is meant to run as a cron job within cPanel on a webhost.  If you schedule the cron job to run every minute you essentially have continuous monitoring and alerting.  If you added a grep phrase into the logwatcher scripts you could alert for specific user behavior.

The principle difference between LogWatcher.sh and LogWatcherBlue.sh is that LogWatcher requires an SSH login and it requries SMTP to be pre-configured.  LogWatcherBlue assumes direct access to the error log and it uses the webhost's settings to send an email using a terminal utility called mailx.  Of course if you used your cell carriers SMS gateway you could have text alerts.

Both LogWatcher.sh and LogWatcherBlue.sh will require you to configure your SSH access and the paths to your error_log file.

## Usage

```bash
❯ ./logwatcher.sh

    Usage: ./logwatcher.sh [-u] [-r] [-f] [-l] [-e]

    Example: ./logwatcher.sh -u my_user -r my_server.my_domain.com -f /path/to/remote/file -l /path/to/local/file -e myself@me.com
```

## Integrity

SHA-256 checksum for logwatcher.sh 9d7dfcf0d6dceabddf272fd45bbab26f7a9008e38f467eb7f24a42d8d387842b

SHA-256 checksum for logwatcherblue.sh ba346500fa59969fc739def6c5f3d68f60b40840915b3d701692dd46eeca2e56
