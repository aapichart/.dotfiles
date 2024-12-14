#!/home/chart/.nix-profile/bin/zsh
if grep -qs '/home/chart/mnt/WDocker ' /proc/mounts; then
  echo "It's mounted."
else 
  echo "It's not mounted."
  echo "Starting mount process..... "
  if ping -c 1 10.135.70.200 > /dev/null | grep "1 received"; then
    sshfs apichart@10.135.70.200:/home/apichart/WDocker ~/mnt/WDocker
    echo "Host -10.135.70.200 is reachable...! "
    echo "Mount process success.... "
  else
    echo "Host -10.135.70.200 is not reachable...!! "
    echo "Start VPN process ....! "
    echo "Please provide your password as a sudoer.......!! "
    sudo vpnc default.conf 
    sleep 5 # Wait for the VPN process is done
    if ps -A | grep vpnc; then
      sshfs apichart@10.135.70.200:/home/apichart/WDocker ~/mnt/WDocker
      echo "Host -10.135.70.200 is reachable...! "
      echo "Mount process success.... "
    else
      echo "Host -10.135.70.200 is not reachable...!! "
      echo "VPN process does not success....! "
    fi
  fi
fi
