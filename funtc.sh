funtc() {
        export funct=$(cat $PREFIX/etc/termplayer-native/func | fzf --color=bw --height=30%)
        case $funct in
                "stop")
                        termux-media-player stop
			pkill -9 fzf
			export prid=$(pgrep -f "bash termuxplayer-native" | tail -n 1)
			kill -9 $$
                        ;;
                "pause")
                        termux-media-player pause
                        funtc
                        ;;
                "play")
                        termux-media-player play
                        funtc
                        ;;
                "next")
                        export curnum=$(grep -n "^${diru}" $PREFIX/etc/termplayer-native/lists | cut -d : -f 1)
                        export newnum=$(( $curnum+1 ))
                        export newfile=$(sed -n "${newnum}"p $PREFIX/etc/termplayer-native/lists)
                        export diru=$newfile
			main
                        ;;
                "prev")
                        export curnum=$(grep -n "^${diru}" $PREFIX/etc/termplayer-native/lists | cut -d : -f 1)
                        export newnum=$(( $curnum-1 ))
			export newfile=$(sed -n "${newnum}"p $PREFIX/etc/termplayer-native/lists)
			main
			;;
                "chdir")
                        termux-media-player stop
                        clear
                        echo "Write directory:"
                        read dirt
                        cd $dirt
                        while true; do
                        export diru=$(ls -a | fzf --color=bw)
                        cd $diru || main
                        done
                        ;;
        esac
}
