#!/bin/bash

getCLASS() { xprop -id "$1" | sed '/WM_CLASS/!d;s/.*"\(.*\)",.*/\1/' ; }

for ID in `xprop -root | sed '/_LIST(WINDOW)/!d;s/.*# //;s/,//g'`
do
    case `getCLASS "$ID"` in
        main) 
            GROUP1="\${color0}1\${color}" 
	    ;;
        Navigator|chrome) 
            GROUP2="\${color0}2\${color}" 
	    ;;
        casa)
            GROUP3="\${color0}3\${color}" 
	    ;;
        urxvt|xterm|skype|rdesktop)
            GROUP4="\${color0}4\${color}" 
	    ;;
        VCLSalFrame*|zathura|leafpad)
            GROUP5="\${color0}5\${color}" 
	    ;;
        gtkpod|kicad|linphone)
            GROUP6="\${color0}6\${color}" 
	    ;;
	*)
	    GROUP0="\${color0}0\${color}" 
	    ;;
    esac
done

[ -n "$GROUP1" ] || GROUP1="1"
[ -n "$GROUP2" ] || GROUP2="2"
[ -n "$GROUP3" ] || GROUP3="3"
[ -n "$GROUP4" ] || GROUP4="4"
[ -n "$GROUP5" ] || GROUP5="5"
[ -n "$GROUP6" ] || GROUP6="6"
[ -n "$GROUP0" ] || GROUP0="0"

ID=`xprop -root | sed '/^_NET_ACTIVE/!d;s/.*# //'`
[ "$ID" = "0x0" ] || ACTIVE=`getCLASS "$ID"`

[ "$ACTIVE" = "Navigator" ] && ACTIVE="firefox"
[ "$ACTIVE" = "xv" ] && ACTIVE="mplayer"

echo "$GROUP1 $GROUP2 $GROUP3 $GROUP4 $GROUP5 $GROUP6 $GROUP0 | $ACTIVE"
