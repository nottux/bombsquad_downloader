#/bin/bash
echo started
cd /home/utku/Programlar/Bombsquad/
w="https://files.ballistica.net/bombsquad/builds"
a=$(wget -O - $w |grep -o \>BombSquad_Linux_64bit.*.\</a\>|cut -d\< -f1|cut -c2-)
l=$(ls)
b=$(echo $a|cut -d. -f-3)
if [ $l = $b ]
then echo up-to-date
else echo downloading
wget -O - $(echo $w/$a|tr -d ' ')|tar -xz
if [ $? = 0 ]
then rm -rf $l
chmod -R 777 $b
echo process successful
else rm -rf $b
echo process failed
fi
fi
read -n1 -r -p 'Press any key to continue...' key