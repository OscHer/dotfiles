RH_BASED_SYSTEM="centos|rhel"
DEBIAN_BASED_SYSTEM="debian"

alias ll='ls -l'
alias la='ls -lA'
alias br='sudo su -'

if [ $(grep ID /etc/os-release | grep -E $RH_BASED_SYSTEM | wc -l) -gt 0 ]; then
  alias sys_update='sudo yum update'
elif [  $(grep ID /etc/os-release | grep -E $DEBIAN_BASED_SYSTEM | wc -l) -gt 0 ]; then
  alias sys_update='sudo apt update && sudo apt upgrade'
else
  echo "Unknown package management system"
fi
