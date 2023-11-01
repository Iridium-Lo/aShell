   echo '
      sshConfigHost
    '
  else
     echo ' 
       <user>@h<hostname> <key.pub>
     '
  fi
 } 

usageSshCopyId() {
  [ -z $1 ] &&
    params 
    return 1
 }

shhcopyid() {
  usageSshCopyId $@ &&
  scp $1 \
   $2:~/.ssh
  ssh        \
   $2:~/$1   \
     >> ~./.ssh/authorizedhosts 
 }


sshcopyid $@ 