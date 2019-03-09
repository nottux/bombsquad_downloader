#/bin/bash
echo started
cd /home/utku/Programlar/Bombsquad/
w=http://www.files.froemling.net/bombsquad/builds
a=$(wget -O - $w |grep -o \"BombSquad_Linux_64bit.*.\" |tr -d \" |rev |cut -c 8- |rev)
l=$(ls)
if [ $l = $a ]
then echo up-to-date
else echo downloading
wget -O - $w/$a.tar.gz |tar -xz
if [ $? = 0 ]
then rm -r $l
chmod -R 777 $a
echo process successful
else rm -r $a
echo process failed
fi
fi
read -n1 -r -p 'Press any key to continue...' key
