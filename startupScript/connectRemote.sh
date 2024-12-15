#!/home/chart/.nix-profile/bin/zsh
if grep -qs '/home/chart/mnt/WDocker ' /proc/mounts; then
  echo "It's mounted."
else 
  echo "It's not mounted."
  echo "Starting mount process..... "
  for i in {1..1}; do
    rm -f /tmp/ping_result
    ping -c 1 "10.135.70.200" | grep "1 packets received" > /tmp/ping_result
    echo "Waiting for 10.135.70.200 to be reachable ... "
    echo "Iteration $i"
    if [[ -s /tmp/ping_result ]]; then  
      sshfs apichart@10.135.70.200:/home/apichart/WDocker ~/mnt/WDocker
      echo "Host -10.135.70.200 is reachable...! "
      echo "Mount process success.... "
    else 
      echo "Host is unreachable ..! => Do you want to connect VPN? (y/n): "
      read answer
      if [[ $answer == [Y/y]* ]]; then
        # if not success, we will not wait for now 
        echo "Host -10.135.70.200 is not reachable...!! "
        echo "Start VPN process ....! "
        echo "Please provide your password as a sudoer.......!! "
        sudo vpnc default.conf 
        sleep 5 # Wait for the VPN process is done
        if ps -A | grep vpnc; then
          # If pass here, the ping should success ... 
          sshfs apichart@10.135.70.200:/home/apichart/WDocker ~/mnt/WDocker
          echo "Host -10.135.70.200 is reachable...! "
          echo "Mount process success.... "
        else
            echo "Host -10.135.70.200 is not reachable...!! "
            echo "VPN process does not success....! "
        fi
      else 
        # answer is N then not mounted
        echo "Host -10.135.70.200 is not reachable...!! "
        break 
      fi
    fi
  done
fi
