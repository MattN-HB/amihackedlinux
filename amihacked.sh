#!/bin/sh
#
#List of checks to validate if been hacked
#
#

#Checks latest actions by user set to last five entries

"Latest actions by user"
last -4
read - p "Press any key to next check"

# show established connections
"Established Connections:"
sudo netstat -atnp | grep ESTA
read - p "Press any key to next check"

#show listening connections
"Listening Connections:" 
sudo netstat -atnp | grep LIST
read - p "Press any key to next check"

#network processes running
"Network Processes running"
lsof -i 
read - p "Press any key to next check"

#use strace to track a PID 
#strace -d -p <PID#>
#read - p "Press any key to next check"

#processes running on
"Processe running"
ps -au
read - p "Press any key to next check"

#processes full list details all use ps --help all
#ps -aux
#read - p "Press any key to next check"

#check ssh connections
"SSh connections"
sudo tail -n300 /var/log/auth.log | grep sshd
read - p "Press any key to next check"

#scan using nmap localhost
"NMAP local"
nmap localhost
read - p "Press any key to next check"

#check common attack points
#ls /tmp -la
"Common attach points"
ls /dev/shm -la
ls /var/tmp -la
read - p "Press any key to next check"

#check malicious scripts run in cron
#less /etc/crontab

#check services
#systemctl list-timers

#list out proceeses 
"Processes"
top
read - p "Press any key to next check"

