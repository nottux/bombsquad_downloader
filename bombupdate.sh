#/bin/bash
echo started
cd /home/utku/Programlar/Bombsquad/
w="https://files.ballistica.net/bombsquad/builds"
a=$(wget -O - $w |grep -o \>BombSquad_Linux_64bit.*.\</a\>|cut -d\< -f1|cut -c2-)
l=$(ls)
if [ $l = $a ]
then echo up-to-date
else echo downloading
wget -O - $(echo $w/$a|tr -d ' ')|tar -xz
if [ $? = 0 ]
then rm -r $l
chmod -R 777 $a
echo process successful
else rm -r $a
echo process failed
fi
fi
read -n1 -r -p 'Press any key to continue...' key