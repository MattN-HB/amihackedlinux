# amihackedlinux
List of checks to see if your linux box has been hacked.

## MVP:

1. Do each check and prompt before continue
2. See .sh for the checks
3. Compare baseline and show running gui like bashtop
4. Push to grafana

## Set-up:
Works on linux machine
1. Basic set up no prereqs just 'git clone https://github.com/MattN-HB/amihackedlinux'
2. /.amihacked.sh

## Resources:
*https://hackingpassion.com/determine-if-your-linux-computer-or-server-is-hacked/
 

## Checks:

last 
#look for listen or established
netstat | more

sudo netstat -atnp | grep ESTA

#all network processes
lsof -i

sudo apt install strace

strace -ls

#use lsof i to get pid #
 strace -d -p <PID #>

#what process is running
ps aux

#whats running now
top

#run processes gui ....needed to sudo apt install htop
htop

#ntop can be installed for windows

#check ssh connections
sudo tail -n 300 /var/log/auth.log

sudo tail -n 300 /var/log/auth.log | grep sshd

#what ports have open 
nmap localhost

#kernel
sudo ls /proc/*/exe -la

#common attack points
ls /tmp -la
ls /dev/shm -la

ls /var/tmp -la

#check if malicious script running on schedule
less /etc/crontab
cd /etc/cron.d/
ls -l
cat filename

systemctl list-timers 
