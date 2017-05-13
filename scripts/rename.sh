#!/bin/sh

function usage {
    echo "Usage: ./rename.sh PATH SRC DEST"
        exit 0
}

if [ $# != 3 ]
then
    usage
fi

for filename in $1/*
do
   sed -i.bu "s/$2/$3/g" $filename
   rm "$filename.bu"
done