#/bin/sh
w=http://www.files.froemling.net/bombsquad/builds
a=$(wget -O - $w |grep -o \"BombSquad_Linux_64bit.*.\" |tr -d \" |rev |cut -c 8- |rev)
l=$(ls)
if [ $l = $a ]
echo allready the newest version
else wget -O - $w/$a.tar.gz |tar -xz
if [ $? = 0 ]
then rm -r $l
chmod -R 777 $a
echo succes
else rm -r $a
echo failed
fi
fi
