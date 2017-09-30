e=echo
w="http://www.files.froemling.net/bombsquad/builds"
$e downloading website
a=$(wget -O - $w | grep -o '\"B.*.\"' | tr -d '\"' | tr \\n '\"')
l=$(echo $a | tr '\"' \\n | wc -l)
$e download complete
$e
$e $a | tr '\"' \\n | nl | tr '	' ")"
$e
$e enter the number of the file you want to download
read c
$e 'enter the directory you want to download to, enter "here" to download to current directory'
read d
if [ "$d" = here ]
then d=$(pwd)
fi
if [ "$c" -lt $l ]
then wget $w/$(echo $a | tr '\"' \\n | sed -n $c\p) -P "$d"
else $e wrong entry
fi
