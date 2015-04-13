#!/bin/sh

for ID in `xprop -root | sed '/_LIST(WINDOW)/!d;s/.*# //;s/,//g'`
do
    case `xprop -id "$ID" | sed -n '/WM_CLASS/s/.*= "\([^"]*\)".*/\1/p'` in
        main) 
            GROUP1="\${color0}1\${color}" 
	    ;;
        Navigator|Browser|Places|netsurf) 
            GROUP2="\${color0}2\${color}" 
	    ;;
        casa)
            GROUP3="\${color0}3\${color}" 
	    ;;
        urxvt|xterm|skype)
            GROUP4="\${color0}4\${color}" 
	    ;;
        VCLSalFrame|soffie|zathura|leafpad|feh)
            GROUP5="\${color0}5\${color}" 
	    ;;
        gtkpod|kicad|linphone|gimp|mplayer)
            GROUP6="\${color0}6\${color}" 
	    ;;
	rdesktop)
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
