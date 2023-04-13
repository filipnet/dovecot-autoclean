# dovecot-autoclean
Automatically deletes messages to trash or junk mail folder with a certain age

Dovecot is able to automatic delete emails, that are in the Trash and Junk/Spam folder, by the way, you can delete emails in other folders in the same way.

## Search for messages to delete (dry-run)

It is a good practice to first test which messages would be deleted before actually deleting them with "expunge".
```
doveadm search -u max.mustermann mailbox Trash savedbefore 5w
```

## Delete messages oder than 5 weeks inside Folder Trash (manual)

```
doveadm expunge -u max.mustermann mailbox Trash savedbefore 5w
```

## Delete messages oder than (automatically)

Create a bash script to perform the deletion automatically on a regular basis ```vim /root/dovecot_expunge.sh```

```
#!/bin/bash
# which doveadm
DOVEADM="/usr/bin/doveadm";
$DOVEADM expunge -A mailbox Trash savedbefore 30d
$DOVEADM expunge -A mailbox Junk  savedbefore 90d
```

The script must be made executable with ```chmod +x /root/dovecot_expunge.sh```
Add the line below to /etc/crontab:
```
# This task always executes the script on the first day of the month
10 0 * * 1 root /root/dovecot_expunge.sh >/dev/null 2>&1
```


