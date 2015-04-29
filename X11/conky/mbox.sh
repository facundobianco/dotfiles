#!/bin/bash
#
# Check for new arrived emails on your mailboxes
#
# Add this line in your conkyrc
# ${color1}|${color} ${execp /home/vando/.config/conky/mbox.sh}\

# Create a dir with symlinks to your new's mailboxes
#     $> ln -s ~/spool/mail/inbox/new ~/spool/conky/INBOX
#     $> ln -s ~/spool/mail/trac/new  ~/spool/conky/TRAC
#     $> ln -s ~/spool/datacenter/new ~/spool/conky/DC
SPOOL=/home/vando/spool/conky

# You can list them in specific order or leave undefine this variable
# to list them by alphabetic order
MAILDIR="INBOX DC TRAC"

for MBOX in ${MAILDIR:-`/bin/ls $SPOOL`}
do
    COUNT=`/bin/ls -1 ${SPOOL}/${MBOX} | wc  -l`
    [ ${COUNT} -lt 100 ] && COUNT="  $COUNT"
    [ ${COUNT} -lq  10 ] && COUNT="  $COUNT"
    echo -n ${MBOX} \${color0}${COUNT}\${color} " "
done
