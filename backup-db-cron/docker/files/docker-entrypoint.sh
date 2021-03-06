#!/bin/bash
set -e

echo "ver 0.0.0.7"

# Drop /etc/crontab
echo > /etc/crontab

printenv | grep -v "TIME" | sed 's/^\(.*\)$/export \1/g' > /root/project_env
chmod +x /root/project_env

echo "$TIME /bin/bash /slug-backup-db-cron/start >> /slug-backup-db-cron/backups/cron.log 2>&1" > /etc/crontab
crontab /etc/crontab

# Start
cron -f

exit 0