#!/bin/sh

set -e


# If variable is present
if [ -n "$CRONTAB" ]; then
	# Use default temporary file location if variable undeclared
	CRON_TMPFILE=${CRON_TMPFILE:-/tmp/crontab.txt}

	echo "$CRONTAB" > "$CRON_TMPFILE"

	if [ -n "$CRON_USER" ]; then
		echo "Setting up crontab for user '$CRON_USER'..."
		crontab -u "$CRON_USER" "$CRON_TMPFILE"
	else
		echo "Setting up crontab for $(id -nu)..."
		crontab "$CRON_TMPFILE"
	fi

	rm "$CRON_TMPFILE"
	/etc/init.d/cron start
fi

# Execute any arguments passed
exec "$@"
