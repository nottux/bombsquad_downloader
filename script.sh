c='eval '
g="sed -n "
e="echo "
w="wget http://www.files.froemling.net/bombsquad/builds"
t="enter "
$e$t\empty or non exist dir
$e$t\dir
read v
mkdir -p $v
cd $v
$e\choosen $(pwd) as dir
$e
$w
b="(grep -o '\"B.*.\"' builds | tr -d '\"') | "
l=$($c"$b\wc -l")
$e\choose file to download
$e
$c$b\cat
$e
$e\example: $t\1 for $($c"$b$g\1p")
$e$t\10 for $($c"$b$g\10p")
read v
if [ $v -ge 1 -a $v -le $l ]
then $w/$($c"$b$g$v\p")
else $e\wrong entry!
fi
