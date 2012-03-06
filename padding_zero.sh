# !/bin/sh

# usage: padding_zero file size

file_size() {
     stat -t $1 | cut -d' ' -f2
}

file=$1
size=$2

pad=$($size - $(file_size $file))

echo $pad
 
