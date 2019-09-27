#Ubuntu Server Essentials LiveLessons
#Manager Permisssions
sudo usersadd -m lisa -s /bin/bash
touch /tmp/somefile
ls -l /tmp/somefile
chown lisa /tmp/somefile
chgrp lisa /tmp/somefile
chmod 764 /tmp/somefile
chmod +x /tmp/somefile
#Scheduling Tasks for Future Execution
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin

# m h dom mon dow user  command
17 *    * * *   root    cd / && run-parts --report /etc/cron.hourly
25 6    * * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.daily )
47 6    * * 7   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.weekly )
52 6    1 * *   root    test -x /usr/sbin/anacron || ( cd / && run-parts --report /etc/cron.monthly )
#
crontab -u lisa -e                                                                                                    
#Managing Logs
cd /var/log
less /syslog
vim /etc/rsyslog.conf
/etc/rsyslog.d/
#Managing Networking
vim /etc/network/interfaces
vim /etc/resolv.conf
#Using SSH
netstat -tulpen 
scp /etc/hosts # secure copy
cd /etc/ssh
vim /etc/ssh/sshd_config
#An Introduction to Using Uncomplicated Firewall



