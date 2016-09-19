#!/bin/sh
# Build and install zsh version from source
# build.sh zsh-1.2.3 /path/to/source/zsh /path/to/built/zsh 

# Version to test against, ex. ZSH_VERSION=master
ZSH_VERSION=$1
[ -z "$ZSH_VERSION" ] && echo "Error: No zsh version specified." && exit 1;

# Base path where to clone zsh repository
ZSH_SOURCE=$2
[ -z "$ZSH_SOURCE" ] && echo "Error: No zsh source path specified." && exit 3;
#mkdir -p "$ZSH_SOURCE"

# Base path for compiled zsh binaries, ex. /bin/zsh-builds
BUILDS_PATH=$3
[ -z "$BUILDS_PATH" ] && echo "Error: No zsh builds path specified." && exit 2;
mkdir -p "$BUILDS_PATH/$ZSH_VERSION"

# Install dev tools (already installed in travis environment)
# apt-get install -y git-core gcc make autoconf yodl libncursesw5-dev texinfo checkinstall

# Get the code. Should cache it.
git clone https://github.com/zsh-users/zsh.git $ZSH_SOURCE
cd $ZSH_SOURCE

# Build version
# Be sure to clean everything
make clean
git checkout -- .
git clean -fd

# Check out with branch to build, ie: master, zsh-5.0.1, etc
git checkout $ZSH_VERSION

# Make configure
./Util/preconfig

# Configure bindir for this branch
./configure --with-tcsetpgrp --prefix=$BUILDS_PATH/$ZSH_VERSION

# Make
make -j5

make install

cd -
