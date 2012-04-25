# !/bin/sh

set -x

p1name=p1-$$
p2name=p2-$$

mkdir -p $p1name $p2name


umount /dev/mmcblk0p1
umount /dev/mmcblk0p2

for i in `seq 1 50`; do
	echo $i
	sleep 2
	mount /dev/mmcblk0p1 $p1name
	mount /dev/mmcblk0p2 $p2name
	sleep 2

	umount $p1name
	umount $p2name
done

rm -rf $p1name $p2name

