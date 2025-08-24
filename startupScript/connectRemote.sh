#!/home/apichart/.nix-profile/bin/zsh
# if grep -qs '/home/apichart/googleDrive' /proc/mounts; then
#   echo "It's mounted."
# else 
#   echo "It's not mounted."
#   echo "Starting mount process..... "
#   if [[ ! -d ~/googleDrive]]; then
#     mkdir -p ~/googleDrive
#   fi
# fi
if ! grep -qs "rclone" /proc/mounts; then 
  nohup rclone mount googleDrive: ~/googleDrive --vfs-cache-mode writes --allow-non-empty &>/dev/null &; 
fi
