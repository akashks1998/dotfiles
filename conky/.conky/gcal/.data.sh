nownum=$(date +%s)
thennum=$((nownum+1209600))
now=$(date --date=@$nownum +%D)
then=$(date --date=@$thennum +%D)
cd  ~/.conky_maildata/
cat .temper
if ping -q -c 1 -W 1 google.com >/dev/null; then
   gcalcli --nocolor agenda $now $then >.temper
fi
