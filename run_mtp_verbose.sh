#!/bin/bash
set -xo pipefail

echo "### 4. Checking uptime and OS details of servers"
uptime
cat /etc/*-release
uname -a

echo "### 5. DNS configuration check"
cat /etc/resolv.conf
nslookup $(hostname)

echo "### 6. Network interface details"
ip a

echo "### 7. File system status"
df -TH
vgs
lsblk

echo "### 8. fstab entries check"
cat /etc/fstab

echo "### 9. Checking memory and CPU details"
cat /proc/meminfo
free -h
lscpu

echo "### 10. adinfo or sssd configuration check"
adinfo || cat /etc/sssd/sssd.conf | grep ldap_access_filter

echo "### 11. Firewall status & SELinux status check"
systemctl status firewalld.service
cat /etc/selinux/config | grep SELINUX

echo "### 12. subscription-manager & repolist check"
subscription-manager identity
yum repolist all

echo "### 13. Kernel parameter check"
yum list installed kernel
rpm -q kernel --last
rpm -qa --last | head
yum check-update --security

echo "### 14. Verifying Admin accounts"
chage -l root
chage -l expamb

echo "### 15. nslcd service check"
systemctl status nslcd

echo "### 16. Verifying of command history creation"
cat /etc/profile | grep HISTFILE
ls -ll /var/adm/cops
history | tail -20

echo "### 17. sendmail configuration check"
cat /etc/mail/sendmail.cf | grep smtp
systemctl status sendmail.service || systemctl status postfix.service

echo "### 18. Cluster Status Check"
pcs status

echo "### 19. Fireeye Status Check"
ps -ef | grep -i xagt
rpm -qa --last | grep xagt

echo "### Sentinelone Status check"
/opt/sentinelone/bin/sentinelctl control status
/opt/sentinelone/bin/sentinelctl management status

echo "### 20. Splunk Status Check"
/opt/splunkforwarder/bin/splunk status
ps -ef | grep splunk
rpm -qa --last | grep splunk

echo "### 21. Commvault status Check"
commvault status
commvault list

echo "### 22. Chronyc status check"
chronyc tracking
chronyc sources
chronyc sourcestats

echo "### 23. Control-M status"
# This requires user input, so it's commented out.
# su ctmagent
# ag_diag_comm

echo "### 24. Basic Build details"
dmidecode -t1
hostnamectl

echo "### 25. AWS account details"
aws sts get-caller-identity
aws iam list-account-aliases
aws configure get region
systemctl status amazon-ssm-agent
amazon-ssm-agent -version

echo "### 29. Bastion Accounts Permission Validation"
cat /etc/sudoers.d/6111-bastion
cat /etc/sudoers

echo "### 30. SDH compliance status check"
# No command provided in the original file for this step.
