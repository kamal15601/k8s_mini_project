#check connectivity status from jumpbox



#server ping response with hostname




#getting hostname deatils of servers







#4 checking uptime os details of servers
# uptime
# cat /etc/*-release
# uname -a





#5 DNS configuration check
# cat /etc/resolv.conf
# nslookup **ServerName**



#6.network interface details
#ip a



#7 file system status
    # df -TH
    # vgs
    # lsblk



#8 fstab entries check
    # cat /etc/fstab


#9 checking memory details and cpu details
    # cat /proc/meminfo 
    # free -h
    # lscpu



#10 adinfo or sssd configuration check
    # adinfo
    #or
    # cat /etc/sssd/sssd.conf | grep ldap_access_filter



#11 firewall status & selinux status check 
    # systemctl status firewalld.service
    # cat /etc/selinux/config  | grep SELINUX


#12 subscription-manager & repolist check 
    # subscription-manager identity
    #(NA for amazon linuxos)  
    #yum repolist all



#13 kernel parameter check 
    
    # yum list installed kernel
    # rpm -q kernel --last
    # rpm -qa --last | grep head
    # yum check-update --security


#14.	Verifying Admin accounts.
#Note: expamb user is Optional.

  # chage -l root
  # chage -l expamb



#15.nslcd service check
#Note: this service should be in stopped/disabled state
    # systemctl status nslcd


#16. Verifying of command history creation
    # cat /etc/profile | grep HISTFILE
    # cd /var/adm/cops; ll
    # history | tail -20


#17. sendmail configuration check
    # cat /etc/mail/sendmail.cf | grep smtp
    # systemctl status sendmail.service (or)
    #systemctl status postfix.service




18.	Cluster Status Check
#(Not all servers configured with PCS-can be ignored if not)
    # pcs status




19.	Fireeye Status Check
  # ps -ef | grep -i xagt 
  # rpm -qa --last | grep xagt

#Sentinelone Status check
              # /opt/sentinelone/bin/sentinelctl control status
              # /opt/sentinelone/bin/sentinelctl  management status
#Note: Agent state should be Enabled; Connectivity should be On




#20.Splunk Status Check
    # /opt/splunkforwarder/bin/splunk status
    # ps -ef | grep splunk
    # rpm -qa --last | grep splunk




#21.Commvault status Check (Not all servers configured with commvault-can be ignored if not)
    # commvault status
    # commvault list




#22.Chronyc status check. (Not all servers configured with-can be ignored if not)Command:  
    # chronyc tracking
    # chronyc sources
    # chronyc sourcestats



#23.Control-M status (Not all servers configured with -can be ignored if not)
    # su ctmagent
    # ag_diag_comm




#24.Basic Build details
    #dmidecode -t1
    # hostnamectl (for amazon linux systems)



#25. AWS account details ignore if the server is not amazon linux os
    #AWS Account ID
        #aws sts get-caller-identity
        #aws iam list-account-aliases
    #Current AWS Region
        # aws configure get region
    #SSM Agent Installation and Connection
        # systemctl status amazon-ssm-agent
        # amazon-ssm-agent -version



#26.console details for amazon linux, azure , HPE/HP and vmware servers






#27  CMDB details



#28 bastion onboading check clouduser must be present




#29.	Bastion Accounts Permission Validation:
#Note: Check the permsissions of accounts in below files (sudoers or 6111-bastion). If any account entry is missing kindly add it.
 
    #cat /etc/sudoers.d/6111-bastion
    #cat /etc/sudoers



#30.SDH compliance status check