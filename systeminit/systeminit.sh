#!/bin/bash

basename=`dirname $0`

init_system()
{
  # 添加源
  rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

  #更新系统
  yum update -y 

  #安装常用命令，服务
  # gcc g++ : C and C++ compiler 
  # vim: Vi IMproved, a programmers text editor
  # openssl-devel: Files for development of applications which will use OpenSSL
  # openssl-clients: An open source SSH client applications
  # lrzsz: The lrz and lsz modem communications programs
  # tree: File system tree viewer
  # git: Fast Version Control System
  # expect:  A program-script interaction and testing utility
  # wget:  A utility for retrieving files using the HTTP or FTP protocols
  # rsync: A program for synchronizing files over a network
  # unzip:  A utility for unpacking zip files
  # mtr: A network diagnostic tool
  # lm_sensors: Hardware monitoring tools
  # net-tools: Basic networking tools
  # mlocate: An utility for finding files by name
  # screen: A screen manager that supports multiple logins on one terminal
  # make: A GNU tool which simplifies the build process for users
  # pathch: Utility for modifying/upgrading files
  # glibc: The GNU libc libraries
  yum install -y gcc gcc-c++ vim openssl-devel openssh-clients lrzsz tree git expect wget rsync unzip mtr lm_sensors net-tools mlocate screen make pathch glibc 
}

init_git()
{
  
}


MYDATE=`date +%d/%m/%Y`
THIS_HOST=`hostname -s`
USER=`whoami`
while :
do
  tput clear
  cat <<MAYDAY
-----------------------------------------------------------
User:$USER            Host:$THIS_HOST        Date:$MYDATE
-----------------------------------------------------------
              my platform ()
1: add&update yum repo, update system, install common command/server 
2: network configuration
3: vim plugin

           H:Help screen  --  Q:Exit Menu
-----------------------------------------------------------
MAYDAY
echo -e -n "\tYour Choice [Num,H,Q]>  "
read CHOICE
  case $CHOICE in
#    [0-9]|[0-9][0-9])
    1)
       init_system         
       ;;
    H|h)
                cat <<MAYDAY
                        to be continued
MAYDAY
       ;;
    Q|q) exit 0
       ;;
    *)  echo -e "\t\007 unknown user response"
       ;;
  esac
echo -e -n "\tHit the return key to continue"
read DUMMY
done

