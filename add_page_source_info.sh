#!/bin/bash
# author: dpchengx@gmail.com
# 向git page博客中添加原文url信息。

target_dir="_posts";
prefix_sentence="本文地址：";
host_url="https://cheng-dp.github.io"
target_line_num=8

for path in `find $target_dir -name "*.md"`
do
    if ! grep "$prefix_sentence" $path; then
      echo "Insert into: $path"
      date=`echo $path | grep -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}"`
      date_pos=`echo $path | grep -b -o "[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}" | grep -oE "[0-9]+" | head -1`
      filename=${path:`expr $date_pos+11`}
      name=${filename:0:`expr ${#filename} - 3`}
      date=`echo $date | tr - /`
      final_url=$host_url/$date/$name/
      final_sentence=$prefix_sentence$final_url
      sed -i "${target_line_num}i \ " $path
      sed -i "${target_line_num}i $final_sentence " $path
      sed -i "${target_line_num}i \ " $path
      echo "Inserted sentence: $final_sentence"
    fi
done
