dest=/Users/iridium/git/iridium/dl
wrtarr=$dest/writeArr

cdl() {
  ssh -t iri "
    cd $dest && 
    bash --login
  "
 }
dl() {
  ssh -t iri " 
    cd $dest/sitesDl/$1 && 
    bash --login
  "
 }
nlnk() {
  scp $1 \
    iri:wrtarr/rawLinks/$2
 }
