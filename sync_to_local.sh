#!/bin/sh

# Copy files from this repository to the user home folder, and including a
# tag file containing the sha of this commit.

echo $HOME
git submodule sync
git submodule update

input="./fileList.txt"
while IFS= read -r line
do
  echo "link $PWD/$line ~/$line"
  if [[ -f ~/$line ]]; then
    if [[ ! -f ~/$line.bk ]]; then
      echo "Making backup of ~/$line"
      mv ~/$line ~/$line.bk
    else
      rm ~/$line
    fi

  elif [[ -d ~/$line ]]; then
    if [[ ! -d ~/$line.bk ]]; then
      echo "Making backup of ~/$line"
      mv ~/$line ~/$line.bk
    else
      rm -rf ~/$line
    fi
  elif [[ -L ~/$line ]]; then
    rm ~/$line
  fi

  ln -sfnv $PWD/$line ~/$line
done < "$input" 

# can't use a symlink for .gitconfig
cp .gitconfig ~/.gitconfig
