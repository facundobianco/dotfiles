#!/bin/sh

for ID in `xprop -root -notype _NET_CLIENT_LIST | sed 's/.*# //'`
do
    case `xprop -id "$ID" -notype WM_CLASS | sed 's/.*= "\([^"]*\)".*/\1/'` in
        main) 
            GROUP1="\${color0}1\${color}" 
	    ;;
        Navigator|Browser|Places|netsurf|Dialog|Google*) 
            GROUP2="\${color0}2\${color}" 
	    ;;
        casa)
            GROUP3="\${color0}3\${color}" 
	    ;;
        urxvt|xterm|roxterm|skype|yakyak)
            GROUP4="\${color0}4\${color}" 
	    ;;
        VCLSalFrame|soffie|zathura|leafpad|feh|libreoffice|scite|SciTE|mirage|cr3|diffuse|mcomix|mtpaint)
            GROUP5="\${color0}5\${color}" 
	    ;;
        gtkpod|kicad|linphone|gimp|mplayer|dia|dia-normal|globaltime|spotify|xfburn|arandr|mpv|MPlayer)
            GROUP6="\${color0}6\${color}" 
	    ;;
	rdesktop|Qt-subapplication|sun-awt-X11-*)
	    GROUP7="\${color0}7\${color}" 
	    ;;
	"") # This prevents when all windows are closed
	    ;;
	*)
	    GROUP0="\${color0}0\${color}" 
	    ;;
    esac
done

echo "${GROUP1:- } ${GROUP2:- } ${GROUP3:- } ${GROUP4:- } ${GROUP5- } ${GROUP6:- } ${GROUP7:- } ${GROUP0:- }"
