#!/data/data/com.termux/files/usr/bin/bash
apt install termux-api -yq
git clone --depth 1 https://github.com/junegunn/fzf ~/.fzf
~/.fzf/install
mkdir -p $PREFIX/etc/termplayer-native
