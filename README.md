# amihackedlinux
List of checks to see if your linux box has been hacked.

## MVP:

1. Do each check and prompt before continue ( See .sh for the checks)
2. Run bashtop gui
3. Backlog:  Compare baseline 
4. Backlog: Push to grafana

## Set-up:
0. linux machine
1. '''git clone https://github.com/MattN-HB/amihackedlinux'''
2. Optional gui run at end '''git clone https://github.com/aristocratos/bashtop'''
2.sudo  /.amihacked.sh

## Resources:
*https://hackingpassion.com/determine-if-your-linux-computer-or-server-is-hacked/
*https://github.com/aristocratos/bashtop
*https://www.lifewire.com/linux-top-command-2201163 

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
bashtop
