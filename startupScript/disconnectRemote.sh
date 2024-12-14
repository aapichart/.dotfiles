#!/home/chart/.nix-profile/bin/zsh
if grep -qs '/home/chart/mnt/WDocker ' /proc/mounts; then
  echo "It's mounted."
  umount $HOME/mnt/WDocker 
  echo "unmounted successful....! "
else 
  echo "It's not mounted."
fi

