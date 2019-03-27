#!/bin/bash
cd ~/.conky_maildata/
user1="$(cat .user1)"
user2="$(cat .user2)"
email(){
  cat .email
  if ping -q -c 1 -W 1 google.com >/dev/null; then
    x=$(curl -u $user1:$user2 --silent "https://mail.google.com/mail/feed/atom")
    echo "$x" |  grep -oPm1 "(?<=<title>)[^<]+" | sed '1d'| head -15>.email
    echo "$x" |  grep -oPm1 "[^<]+" | sed '1d' | grep -A 1 "author>"| grep "name"| tr ">" "\n"|grep -v "name"| head -15>.name
  fi
}
name(){
  cat .name
}
if [ "$1" = "1" ];then
  email
else
  name
fi
