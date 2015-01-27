#!/bin/sh

# Another way to get WMs' class
# -----------------------------
#
# getCLASS() { xprop -id "$1" |  sed '/WM_CLASS/!d;s/.*= //;s/[^a-zA-Z,-]//g' ; }
#
# for ID in `xprop -root | sed '/_LIST(WINDOW)/!d;s/.*# //;s/,//g'`
# do
#     ...

for ID in `xlsclients -l | sed -n '/.*Class:  /s///p' | uniq -u`
do
    case "$ID" in
        main*) 
            GROUP1="\${color0}1\${color}" 
	    ;;
        *Firefox|*Chrome) 
            GROUP2="\${color0}2\${color}" 
	    ;;
        casa*)
            GROUP3="\${color0}3\${color}" 
	    ;;
        urxvt*|xterm*|skype*|rdesktop*)
            GROUP4="\${color0}4\${color}" 
	    ;;
        VCLSalFrame*|soffie*|zathura*|leafpad*|feh*)
            GROUP5="\${color0}5\${color}" 
	    ;;
        gtkpod|kicad|linphone|gimp)
            GROUP6="\${color0}6\${color}" 
	    ;;
	*)
	    GROUP0="\${color0}0\${color}" 
	    ;;
    esac
done

echo "${GROUP1:- } ${GROUP2:- } ${GROUP3:- } ${GROUP4:- } ${GROUP5- } ${GROUP6:- } ${GROUP0:- }"
