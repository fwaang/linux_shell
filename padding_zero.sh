# !/bin/sh

# usage: padding_zero file size
# for example: padding_zero pad.bin 0x100000

file_size() {
     stat -t $1 | cut -d' ' -f2
}

file=$1
size=$2

echo "file size: $(file_size $file), target size: $size"

pad=$(($size - $(file_size $file)))
if [ $pad -gt 0 ]; then
	echo "> padding $pad bytes"
	dd if=/dev/zero bs=1 count=$pad | tr '\000' '\377' >> $file
else
	echo "> need not to pad"
fi

 
