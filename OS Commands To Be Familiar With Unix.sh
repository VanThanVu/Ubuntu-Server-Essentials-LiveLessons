#OS Commands To Be Familiar With Unix

#VI
arrow keys - moves the "cursor" location up/down , left/right
i for insert
r for replace character
R replace and continue replacing to right
u - undo change
/term search for "term" and goto in file
n - when in search mode, will goto next match
shift+n - go back to last match
q! - forced quit without saving
wq! - writes , quits , forces save

#Grep
grep FATAL mailbox.log
#Ignore case [-i] :

grep -i fatal mailbox.log
#OR or extended regexp operator [-E] , any line that has fatal or error [might not be available in all versions of grep] :

grep -iE 'fatal|error' mailbox.log
#NOT, Negative or invert matching [-v] , any line that DOES NOT have info or warn:

grep -iEv 'info|warn' mailbox.log
#Print additional lines around context [-C#] :

grep -iEv -C3 'info|warn' mailbox.log
#Print additional lines after context [-A#] :

grep -iEv -A3 'info|warn' mailbox.log
#Print with line numbers [-n] :

grep -iEvn -A3 'info|warn' mailbox.log
#If your terminal shows colors, this is useful in seeing where the match is in the output [--color] :

grep -iEvn -A3 --color 'info|warn' mailbox.log
#AND match. Match happens left to right with first variable and then second :

grep -iE 'user1.*user2' /var/log/zimbra.log
#AND match going either way :

grep -iE 'user1.*user2|user2.*user1' /var/log/zimbra.log 
#AND match by piping to another grep :

 grep -iE user1 /var/log/zimbra.log | grep user2
#Print only the matched (non-empty) parts of a matching line, with each part on a separate output line. Very useful with you combine with the -E option and are looking for uniform log events and want to discard unnecessary info without doing/knowing sed or awk.

grep -i smtp /var/log/zimbra.log | grep -ioE 'to=.*status=.*[ \t] ' | head -5
 to=<admin@mail-172.example.com>, relay=127.0.0.1[127.0.0.1]:10026, delay=4.4, delays=0.22/0.03/0.4/3.7, dsn=2.0.0, status=sent 
 to=<admin@mail-172.example.com>, relay=127.0.0.1[127.0.0.1]:10032, delay=2.7, delays=0.3/0.04/0.01/2.3, dsn=2.0.0, status=sent 
 to=<admin@mail-172.example.com>, relay=127.0.0.1[127.0.0.1]:10026, delay=2.3, delays=0.07/0.1/0.27/1.9, dsn=2.0.0, status=sent  
 to=<admin@mail-172.example.com>, relay=127.0.0.1[127.0.0.1]:10032, delay=1.5, delays=0.24/0.02/0.02/1.2, dsn=2.0.0, status=sent 
 to=<admin@mail-172.example.com>, relay=127.0.0.1[127.0.0.1]:10026, delay=7.9, delays=0.3/0.03/2.3/5.3, dsn=2.0.0, status=sent


 zgrep -i "triggers filter" /var/log/zimbra.* | grep -ioE 'from=.*to=.*>[ \t]' | grep example | uniq
 from=<admin@mail-172.example.com> to=<admin@mail-172.example.com> 
 from=<user1@mail-172.example.com> to=<admin@mail-172.example.com> 
 from=<admin@mail-172.example.com> to=<admin@mail-172.example.com>

#Zgrep
#You can use all the options above in grep with zgrep .

zgrep -i fatal mailbox.log.*.gz
zgrep -iEv -C3 'info|warn' mailbox.log.*.gz

#Head

#Useful, for example, when you want to see how a long file formats date/time to use later for your grep:

head mailbox.log

#Tail
#If you wanted to monitor multiple files at once in 'real time' . Note, you could also pipe the output to grep also :

tail -f mailbox.log -f trace_log.2015_03_11 -f access_log.2015-03-11 -f sync.log -f ews.log
tail -f mailbox.log -f trace_log.2015_03_11 -f access_log.2015-03-11 -f sync.log -f ews.log | grep -i user1

#Less
less +F /opt/zimbra/log/mailbox.log

#wc - Word Count

#uniq - Unique

#sort

