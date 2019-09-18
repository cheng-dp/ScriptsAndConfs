#!/bin/bash

target_dir="_posts";

inserted_sentence="本文地址：";

host_url = https://cheng-dp.github.io

for filename in `find _posts -name "*.md"`
do
    if ! grep "$inserted_sentence" $filename; then

    fi
done
