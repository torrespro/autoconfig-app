#!/bin/bash
set -ev

npm i @angular/cli -g --silent
npm i angular-cli-ghpages -g --silent

if [[ $TARGET_OS == 'win' ]]; then
  # LD_LIBRARY_PATH=/usr/local/lib64/:$LD_LIBRARY_PATH
  # export LD_LIBRARY_PATH

  sudo dpkg --add-architecture i386
  # sudo apt-add-repository ppa:ubuntu-toolchain-r/test -y
  # sudo apt-get update
  # sudo apt-get install gcc-4.9 g++-4.9 libstdc++6

  # Install wine
  sudo add-apt-repository ppa:ubuntu-wine/ppa -y
  sudo apt-get update
  sudo apt-get install --no-install-recommends -y wine1.8

  # Install mono
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
  echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
  sudo apt-get update
  sudo apt-get install --no-install-recommends -y mono-devel ca-certificates-mono
fi
