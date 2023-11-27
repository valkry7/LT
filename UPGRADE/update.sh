#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
echo -e " [INFO] Downloading Update File"
sleep 2

wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/menu.sh" && chmod +x /usr/bin/menu
wget -q -O /usr/bin/m-ss "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m.ss.sh" && chmod +x /usr/bin/m-ss
wget -q -O /usr/bin/m-vmess "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-vmess.sh" && chmod +x /usr/bin/m-vmess
wget -q -O /usr/bin/m-vless "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-vless.sh" && chmod +x /usr/bin/m-vless
wget -q -O /usr/bin/m-trojan "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-trojan.sh" && chmod +x /usr/bin/m-trojan
wget -q -O /usr/bin/m-bot "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-bot.sh" && chmod +x /usr/bin/m-bot
wget -q -O /usr/bin/m-ssh "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-ssh.sh" && chmod +x /usr/bin/m-ssh
wget -q -O /usr/bin/m-set "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-set.sh" && chmod +x /usr/bin/m-set
wget -q -O /usr/bin/m-theme "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-theme.sh" && chmod +x /usr/bin/m-theme
wget -q -O /usr/bin/m-backup "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-backup.sh" && chmod +x /usr/bin/m-backup
wget -q -O /usr/bin/m-ip "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-ip.sh" && chmod +x /usr/bin/m-ip
wget -q -O /usr/bin/m-tor "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-tor.sh" && chmod +x /usr/bin/m-tor
# //
wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/valkry7/LT/MONSTER/UPGRADE/auto-reboot.sh" && chmod +x /usr/bin/auto-reboot
wget -q -O /usr/bin/menu-tcp "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-tcp.sh" && chmod +x /usr/bin/menu-tcp
wget -q -O /usr/bin/rebootvps "https://raw.githubusercontent.com/valkry7/LT/MONSTER/CONFIG/rebootvps.sh" && chmod +x /usr/bin/rebootvps
wget -q -O /usr/bin/menu-dns "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-dns.sh" && chmod +x /usr/bin/menu-dns
wget -q -O /usr/bin/mspeed "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-speedtest.sh" && chmod +x /usr/bin/mspeed
wget -q -O /usr/bin/mbandwith "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/MENU/m-bw.sh" && chmod +x /usr/bin/mbandwith
wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/valkry7/LT/MONSTER/SSH-WS/tendang.sh" && chmod +x /usr/bin/tendang
wget -q -O /usr/bin/lock "https://raw.githubusercontent.com/valkry7/LT/MONSTER/lock.sh" && chmod +x /usr/bin/lock
# // WASTED
wget -q -O /usr/bin/banned "https://raw.githubusercontent.com/valkry7/LT/MONSTER/WASTED/banned.sh" && chmod +x /usr/bin/banned
wget -q -O /usr/bin/userlimit "https://raw.githubusercontent.com/valkry7/LT/MONSTER/WASTED/userlimit.sh" && chmod +x /usr/bin/userlimit
wget -q -O /usr/bin/userlimitssh "https://raw.githubusercontent.com/valkry7/LT/MONSTER/WASTED/userlimitssh.sh" && chmod +x /usr/bin/userlimitssh
wget -q -O /usr/bin/userexpired "https://raw.githubusercontent.com/valkry7/LT/MONSTER/WASTED/userexpired.sh" && chmod +x /usr/bin/userexpired
wget -q -O /usr/bin/cupu "https://raw.githubusercontent.com/valkry7/LT/MONSTER/MANAGER/BOT/bash.sh" && chmod +x /usr/bin/cupu
echo -e " [INFO] Update Successfully"
sleep 2
rm -f update.sh
exit

