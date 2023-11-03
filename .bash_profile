doc=~/Documents
vrc=$doc/.vimrc
brc=$doc/.profile
prc=$doc/.bash_profile
sshcfg=$doc/.ssh/config

alias srcpr='. $prc'
alias srcbr='. $brc'

alias vi='vim'
alias vivr='vi $vrc'
alias vibr='vi $brc'
alias vipr='vi $prc'
alias vicr='vi $sshcfg'
alias vipr='vi $prc'
alias vibr='vi $brc'
alias vicf='vi $sshcfg'

alias ll='ls -l'
alias la='ls -ahl'


params() {
   if [ -f $sshcfg ]; then
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
  ssh      \
   $2:~/$1 \
     >> ~./.ssh/authorizedhosts 
 }


sshcopyid $@ 
