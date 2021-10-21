#!/bin/bash

#  The file $PWD/v is copied from
#+ https://github.com/rupa/v

[[ -e ~/.kunyuan.sh ]] || ( echo "~/.kunyuan.sh does not exist!" && exit 0; )

if ! grep "add_path" ~/.kunyuan.sh &> /dev/null; then
  echo "add_path should be a function!"
  exit 0
else
  echo "add_path $PWD" >> ~/.kunyuan.sh
fi

echo "Done"
