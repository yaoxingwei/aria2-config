#!/bin/sh
tempfile1=temp1.txt
tempfile2=temp2.txt
aria2_conf_file=aria2-asus.conf
tracksrc_path=/home/yxw/config/github/trackerslist

cd $tracksrc_path
git pull
cd -
touch $tempfile1
touch $tempfile2
echo "bt-tracker" > $tempfile1
cat $tracksrc_path/trackers_all.txt | awk '{if($0!="")print}' | awk BEGIN{RS=EOF}'{gsub(/\n/,",");print}' >> $tempfile1
cat $tempfile1 | awk BEGIN{RS=EOF}'{gsub(/\n/,"=");print}' > $tempfile2
sed -i -e '/bt-tracker/d' $aria2_conf_file
cat $tempfile2 >> $aria2_conf_file
rm $tempfile1
rm $tempfile2
