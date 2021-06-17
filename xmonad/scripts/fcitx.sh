#!/bin/sh
case $(fcitx-remote) in
    '0') echo '<icon=ime/xx.xpm/>' ;;
    '1') echo '<icon=ime/en.xpm/>' ;;
    '2') echo '<icon=ime/ja.xpm/>' ;;
esac
