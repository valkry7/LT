#!/bin/bash
clear
MAX=1
if [ -e "/var/log/auth.log" ]; then
        OS=1;
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        OS=2;
        LOG="/var/log/secure";
fi

if [ $OS -eq 1 ]; then
	service ssh restart > /dev/null 2>&1;
fi
if [ $OS -eq 2 ]; then
	service sshd restart > /dev/null 2>&1;
fi
	service dropbear restart > /dev/null 2>&1;
				
if [[ ${1+x} ]]; then
        MAX=$1;
fi

        cat /etc/passwd | grep "/home/" | cut -d":" -f1 > /root/user.txt
        username1=( `cat "/root/user.txt" `);
        i="0";
        for user in "${username1[@]}"
			do
                username[$i]=`echo $user | sed 's/'\''//g'`;
                jumlah[$i]=0;
                i=$i+1;
			done
        cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/log-db.txt
        proc=( `ps aux | grep -i dropbear | awk '{print $2}'`);
        for PID in "${proc[@]}"
			do
                cat /tmp/log-db.txt | grep "dropbear\[$PID\]" > /tmp/log-db-pid.txt
                NUM=`cat /tmp/log-db-pid.txt | wc -l`;
                USER=`cat /tmp/log-db-pid.txt | awk '{print $10}' | sed 's/'\''//g'`;
                IP=`cat /tmp/log-db-pid.txt | awk '{print $12}'`;
                if [ $NUM -eq 1 ]; then
                        i=0;
                        for user1 in "${username[@]}"
							do
                                if [ "$USER" == "$user1" ]; then
                                        jumlah[$i]=`expr ${jumlah[$i]} + 1`;
                                        pid[$i]="${pid[$i]} $PID"
                                fi
                                i=$i+1;
							done
                fi
			done
      cat $LOG | grep -i sshd | grep -i "Accepted password for" >/tmp/log-db.txt
data=($(ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'))
for PID in "${data[@]}"; do
    cat /tmp/log-db.txt | grep "sshd\[$PID\]" >/tmp/log-db-pid.txt
    NUM=$(cat /tmp/log-db-pid.txt | wc -l)
    USER=$(cat /tmp/log-db-pid.txt | awk '{print $9}')
    IP=$(cat /tmp/log-db-pid.txt | awk '{print $11}')
    if [ $NUM -eq 1 ]; then
        i=0
        for user1 in "${username[@]}"; do
            if [ "$USER" == "$user1" ]; then
                jumlah[$i]=$(expr ${jumlah[$i]} + 1)
                pid[$i]="${pid[$i]} $PID"
            fi
            i=$i+1
        done
    fi
done
for i in ${!username[*]}; do
    slip=$(cat /etc/ssh/${username[$i]})
    if [ ${jumlah[$i]} -gt $slip ]; then
        date=$(date +"%Y-No such file or directory-0 14")
        echo "$date - ${username[$i]} - ${jumlah[$i]}"
        echo "$date - ${username[$i]} - ${jumlah[$i]}" >>/root/log-limit.txt
        TIMES="10"
        CHATID="6617783693"
        KEY="6751589620:AAHwjP6dzZhuqeyUOdYFc6742Q1YUVF1EjM"
        URL="https://api.telegram.org/bot$KEY/sendMessage"
        TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️SSH OVPN NOTIF⚠️</b>
<b>     User Multi Login</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>USERNAME :</b> <code>${username[$i]} </code>
<b>TOTAL IP :</b> <code>${jumlah[$i]} </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>I REMOVE ACCOUNT</code>
<code>NO MULTI LOGINS!</code>
"
        kill ${username[$i]}
        userdel -f ${username[$i]}
        sed -i "/^### ${username[$i]}/d" /etc/ssh/.ssh.db
        rm /etc/xray/log-createssh-${username[$i]}.log
        curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
    fi
done
}
bukit
