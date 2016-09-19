#!/bin/sh
for version in master zsh-5.2 zsh-5.1 zsh-5.0.0 zsh-4.3.17 zsh-4.3.5; do
    ./build.sh $version /tmp/zsh-source /usr/local/zsh/
done
