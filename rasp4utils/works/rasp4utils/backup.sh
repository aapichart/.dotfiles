#!/bin/bash

# General ask procedure
askforreply() {
    while [ true ];
    do
        local replymsg
        read -p " $1 (y/n): " replymsg
        case $replymsg in
            y|n)
                echo $replymsg
                break 
                ;;
            *)
                echo "Please enter only y or n"
                ;;
        esac
    done
}


# Check and gen backup_log file if not existed
genlog() {
    if [ -f "$1" ]; then
        echo "Backup_log file is ready... "
    else
        touch $1 
    fi
}

# Check whethere backup file have already done on the folder or not. if yes, ask permission to delete
# this function receives two parameter ( 1. destination folder, 2. true - (file compressed), false - (file un-compressed) )
checkexistbackupfile() {
            if [ $# -eq 1 ]; then
                # Pass only one argument
                reply=$(askforreply "Would you like a backup file compressed? :")
                if [ $reply = y ]; then
                    checkfile=$1/$DEST_FILE
                else
                    checkfile=$1/$DEST_FILE_UNCOMPRESSED
                fi
            else
                if [ $# -eq 2 ]; then
                # Pass two arguments
                    if [ $2 == true ]; then
                        checkfile=$1/$DEST_FILE
                    else
                        checkfile=$1/$DEST_FILE_UNCOMPRESSED
                    fi
                fi
            fi 
            echo "Backing up to this file => $checkfile " 
            if [ -f $checkfile ]; then
                reply=$(askforreply "Today, Backup file has already existed.  Replaced it? :")
                if [ $reply = y ]; then
                    read -p "Confirm deleting old backup file (y/n)" confirmdel
                    if [ $confirmdel = y ]; then
                        echo "Deleting begin ........!!"
                        echo "Deleting $checkfile file"
                        rm -rf $checkfile
                        echo "Deleting process is done....." 
                        read -p "(Press Enter Key to continue)" waitconfirm
                    else
                        echo "Deleting process is canceled ....." 
                        read -p "(Press Enter Key to continue)" waitconfirm
                    fi
                else
                    echo "Deleting Backup File is canceled........!! "
                    read -p "(Press Enter Key to continue)" waitconfirm
                fi
            fi
}

# Ask for destination folder 
askdestfolder() {
    while [ true ];
    do
        DEFAULT_FOLDER=$DEST_FOLDER
        read -p "Please enter your destination folder [$DEST_FOLDER] : " DEST_FOLDER 
        #   In case user using default option $DEST_FOLDER will be an empty string
        if [ -z "$DEST_FOLDER" ]; then
            DEST_FOLDER=$DEFAULT_FOLDER
        fi
        # Check whether $DEST_FOLDER has already existed or not.
        if [ -d "$DEST_FOLDER" ]; then
            # $DEST_FOLDER is already existed or not.
            checkexistbackupfile $DEST_FOLDER 
        else
            # $DEST_FOLDER doesn't exist.
            reply=$(askforreply "The Folder does not exist, Create it? :")
            echo "write dest_folder"
            echo $reply
            if [ $reply = y ]; then
               echo "Creating folder..... : $DEST_FOLDER "
               mkdir -p $DEST_FOLDER
               echo "Done.. "
            else 
                echo "Stop backup process!!!!"
            fi
        fi
        break 
    done
}


# Ask whether to transfer file to NAS server
asktotr() {
    while [ true ];
    do
        read -p "Would you like to transfer backup to NAS Server? (y/n) :" answer
        case $answer in 
            y)
                echo "We are preparing to transfer......"
                trtonas
                break 
                ;;
            n)
                echo "Ok, We are done for today .... Bye.."
                break
                ;;
            *)
                echo "Please answer only y or n "
                ;;
        esac
    done
}

# process backup start here
startbackup() {
    # Make sure user not change any confiuration such as destination folder ...etc
    reply=$(askforreply "***** Would you like to change any config? :")
    if [ $reply = y ]; then
        setnewconfig        
    fi
    # Start Backup Process
    reply=$(askforreply "Would you like a backup file compressed? :")
    if [ $reply = y ]; then
        echo "Preparing for compressing backup file ..... : "
        # Check whethere backup file have already done on the folder or not. if yes, ask permission to delete
        # this function receives two parameter ( 1. destination folder, 2. true - (file compressed), false - (file un-compressed) )
        checkexistbackupfile $DEST_FOLDER true
        echo "Please be Patient. It will take a while for backup"
        echo "Starting Backup now ....."
        # Not using this command
        # sudo dd bs=4M if=/dev/sda of=/mnt/nasBackup/BackupRasp4/rasp4.img
        genlog "backup_log"
        echo "===========> Backup at $(date +'%F %H:%M:%S')......" 
        echo "===========> Backup at $(date +'%F %H:%M:%S')......" > backup_log
        # sudo tar -cvzf $DEST_FOLDER/$DEST_FILE --exclude-from=excfile.txt --absolute-names / >> backup_log 2>/dev/null 
        sudo tar -cvzf - --exclude-from=excfile.txt --absolute-names / 2>/dev/null | pv > $DEST_FOLDER/$DEST_FILE 
        # extract content of file to log
        echo "Please be patient, system is creating log file content .... " 
        tar -tf $DEST_FOLDER/$DEST_FILE 1>>backup_log
        echo "Finished Local backup at " $(date +'%H:%M:%S')
        read -p " Press Enter to Continue ..... " waitkey 
    else 
        echo "Preparing for un-compressing backup file ......"
        # Check whethere backup file have already done on the folder or not. if yes, ask permission to delete
        # this function receives two parameter ( 1. destination folder, 2. true - (file compressed), false - (file un-compressed) )
        checkexistbackupfile $DEST_FOLDER false 
        echo "Please be Patient. It will take a while for backup"
        echo "Starting Backup now ....."
        # Not using this command
        # sudo dd bs=4M if=/dev/sda of=/mnt/nasBackup/BackupRasp4/rasp4.img
        genlog "backup_log"
        echo "===========> Backup at $(date +'%F %H:%M:%S')......" 
        echo "===========> Backup at $(date +'%F %H:%M:%S')......" > backup_log
        sudo tar -cf - --exclude-from=excfile.txt --absolute-names / 2>/dev/null | pv -s $(du -sb --exclude-from=excfile.txt / 2>/dev/null | awk '{print $1}' ) > $DEST_FOLDER/$DEST_FILE_UNCOMPRESSED
        # extract content of file to log
        echo "Please be patient, system is creating log file content .... " 
        tar -tf $DEST_FOLDER/$DEST_FILE_UNCOMPRESSED 1>>backup_log
        echo "Finished Local backup at " $(date +'%H:%M:%S')
        read -p " Press Enter to Continue ..... " waitkey 
    fi
}

showconfig() {
    echo " ======> Backup Configuration:"
    echo " =====:  Backup Source: /"
    echo " =====:  Backup Dest: $DEST_FOLDER/$DEST_FILE (for compression) "
    echo " =====:  Backup Dest: $DEST_FOLDER/$DEST_FILE_UNCOMPRESSED (for un-compression) "
    echo " ======> Backup Excluded Folder: /"
    bat --theme=gruvbox-dark excfile.txt
    echo " ======> Backup Configuration for NAS:"
    echo " =====:  IP Address: $ipaddress "
    echo " =====:  NAS Volume: $nasVolume "
    echo " =====:  Local Mount Point: $localmntpoint "
    echo " =====:  Remote Backup Folder: $remoteBackupFolder "
    echo " =====:  Absolute Local Folder: $localmntpoint/$remoteBackupFolder "
}

# transfer backup file to NAS Server
trtonas() {
    if [ -d "/mnt/nasBackup/BackupRasp4" ]; then
        echo "Sending backup file to NAS...."
        echo "transfer ..........."
        pv $DEST_FOLDER/$DEST_FILE > /mnt/nasBackup/BackupRasp4/$DEST_FILE 
        echo "Backup Done at " $(date +'%H:%M:%S')
    else
        echo "No NAS server at /mnt/nasBackup/BackupRasp4"
        echo "Process stop here ...... Bye"
    fi
}

# Ask NAS server ip address and folder
asknasdetails() {
    read -p "Please enter NAS IP address [10.135.70.133] : " ipaddress    
    if [ -z "$ipaddress" ]; then
        ipaddress=10.135.70.133
    else
        echo "Your NAS's ipaddress : $ipaddress"
    fi

    read -p "Please enter NAS volume [/volume1/DevicesBackup] : " nasVolume
    if [ -z "$nasVolume" ]; then
        nasVolume=/volume1/DevicesBackup
    else
        echo "Your NAS volume : $nasVolume"
    fi


    read -p "Please enter local mount point [/mnt/nasBackup] : " localmntpoint 
    if [ -z "$localmntpoint" ]; then
        localmntpoint=/mnt/nasBackup
    else
        echo "Your local mount point: $localmntpoint "
    fi

    read -p "Please enter remote backup folder [BackupRasp4] : " remoteBackupFolder 
    if [ -z "$remoteBackupFolder" ]; then
        remoteBackupFolder=BackupRasp4
    else
        echo "Your remote backup folder : $remoteBackupFolder "
    fi

    # create mount point 
    mountstring="$ipaddress:$nasVolume $localmntpoint"
    echo "your mount cmd => mount $mountstring"
    read -p "=====> Start mounting. Press Enter Key" waitkey
    sudo mount $mountstring
}

restoreprocess() {
    showconfig
    echo "==================================================="
    echo "=== Please select number:              "
    echo "=== 1) Select Restore from Local Backup. $DEST_FOLDER"
    echo "=== 2) Select Restore from NAS Backup. $localmntpoint/$remoteBackupFolder"
    echo "==================================================="
    read -p " Your selection [1] :" replymsg
    if [ -z "$replymsg" ]; then
        replymsg=1
    fi
    if [ $replymsg -eq 1 ]; then
        restorefrom=$DEST_FOLDER
    else
        restorefrom=$localmntpoint/$remoteBackupFolder  
    fi
    if [ -d "$restorefrom" ]; then
        if [ "$(ls -A "$restorefrom")" ]; then
            echo ""
            echo "====> Please select your backup file to restore system"
            echo "===: using up, down arrow to select choice, then press enter for selecting"
            restorefile=$(ls -la $restorefrom | fzf --height=30% --layout=reverse-list | awk '{print $9}') 
            echo "===: Your select backup file is : $restorefrom/$restorefile"
            sudo tar -xzf $restorefrom/$restorefile / -C
        else
            echo "===: Please selelct another backup folder, it is empty !!! "
        fi
    else
        echo "No Backup Folder, Please create or set it before using this option"
    fi
}

# Encrypt Backup File
EncryptBackup() {
    echo "==================================================="
    echo "=== Please select number:              "
    echo "=== 1) Select Encrypt Local Backup. $DEST_FOLDER"
    echo "=== 2) Select Encrypt NAS Backup. $localmntpoint/$remoteBackupFolder"
    echo "==================================================="
    read -p " Your selection [1] :" replymsg
    if [ -z "$replymsg" ]; then
        replymsg=1
    fi
    if [ $replymsg -eq 1 ]; then
        encryptfrom=$DEST_FOLDER
    else
        encryptfrom=$localmntpoint/$remoteBackupFolder  
    fi
    if [ -d "$encryptfrom" ]; then
        if [ "$(ls -A "$encryptfrom")" ]; then
            echo ""
            echo "====> Please select your backup file to encrypt"
            echo "===: using up, down arrow to select choice, then press enter for selecting"
            encryptfile=$(ls -la $encryptfrom | fzf --height=30% --layout=reverse-list | awk '{print $9}') 
            echo "===: Your select backup file is : $encryptfrom/$encryptfile"
            # cut string after . out
            newencryptfile=$(echo $encryptfile | sed 's/\..*$//')
            if [ ! -z $encryptfile ] && [ ${#encryptfile} -gt 0 ] && [ $encryptfile != '.' ] && [ $encryptfile != '..' ]; then
                newencryptfile=$newencryptfile.tgz
                echo "Encrypted File will be saved at => $newencryptfile"
                read -p "(Press Enter Key to Encrypt or Ctrl-C to Cancel.......)" waitkey
                sudo gzip -9 < $encryptfrom/$encryptfile | pv > $encryptfrom/$newencryptfile
            else
                echo "===: Your selected file ( $encryptfile ) is unzipable "
            fi
        else
            echo "===: Please selelct another backup folder, it is empty !!! "
        fi
    else
        echo "No Backup Folder, Please create or set it before using this option"
    fi
}

# Setting new configuration
setnewconfig() {
    echo "=====> 1) Setting Backup Folder"
    askdestfolder
    echo "=====> 2) Setting NAS details"
    asknasdetails
    echo "=====> All setting is done"
    read -p "(Press Enter Key to Continue.......)" waitkey
}

# Show main menu
showmainmenu() {
    while [ true ];
    do
        clear
        local replymsgmain
        figlet Essoft co.,ltd.
        echo "==================================================="
        echo "=== Please select number:                      ===="
        echo "=== 1) Config Backup System.                   ===="
        echo "=== 2) Show Configuration.                     ===="
        echo "=== 3) Show Local Backup Image.                ===="
        echo "=== 4) Show NAS Backup Image.                  ===="
        echo "=== 5) Encrypt Any Backup File.                ===="
        echo "=== B) Backup our linux system.                ===="
        echo "=== R) Restore linux system from Backup File.  ===="
        echo "=== 0) Exit.                                   ===="
        echo "==================================================="
        read -p " Your selection [2] :" replymsgmain
        if [ -z "$replymsgmain" ]; then
            replymsgmain=2
        fi
        case $replymsgmain in
            1)
                setnewconfig
                ;;
            2)
                showconfig
                read -p "(Press Enter Key to Continue.......)" waitkey
                ;;
            3)
                ls -la $DEST_FOLDER | bat --theme=gruvbox-dark 
                read -p "(Press Enter Key to Continue.......)" waitkey
                ;;
            4)
                ls -la $localmntpoint/$remoteBackupFolder | bat --theme=gruvbox-dark 
                read -p "(Press Enter Key to Continue.......)" waitkey
                ;;
            5)
                EncryptBackup
                read -p "(Press Enter Key to Continue.......)" waitkey
                ;;
            B)
                showconfig
                read -p "(Press Enter Key to Continue.......)" waitkey
                if [ -d "$DEST_FOLDER" ]; then
                    startbackup
                    asktotr
                else
                    echo "No Backup Folder, Please create or set it before using this option"
                    read -p "(Press Enter Key to Continue.......)" waitkey
                fi
                ;;
            R)
                restoreprocess
                read -p "(Press Enter Key to Continue.......)" waitkey
                ;;
            0)
                echo "=====> Process End!!.... Bye"
                read -p "( Press Enter Key to Stop.......)" waitkey
                exit 1
                ;;
            *)
                echo "Please enter only [0,1,2,3,4,5,B,R] "
                read -p "(Press Enter Key to Continue.......)" waitkey
                ;;
        esac
    done
}

# Setting variable for backup process
ipaddress=10.135.70.133
nasVolume=/volume1/DevicesBackup
localmntpoint=/mnt/nasBackup
remoteBackupFolder=BackupRasp4
# sudo mount $ipaddress:$nasVolume $localmntpoint
DEST_FILE=backup-popos-$(date +'%F').tgz
DEST_FILE_UNCOMPRESSED=backup-popos-$(date +'%F').tar
# create local backup copy before copying it to destination on the nas server
DEST_FOLDER=~/backup
showmainmenu

