#!/bin/sed -nf
/BEGIN:VEVENT/,/LOCATION/{
    /ORGANIZER/{s/.*CN=\(.*\):MAILTO:\(.*\)/Organizer: \1 <\2>/p}
    /ATTENDEE/{N;s/\n //;s/.*CN=\(.*\):MAILTO:\(.*\)/Participants: \1 <\2>/p}
    /LANGUAGE/{s/;LANG.*-US//}
    /SUMMARY/{s/.*:/\n/p}
    /DTSTART/{N;s/\n.*T/ /;s/.*:\(....\)\(..\)\(..\)T\(..\)\(..\).. \(..\)\(..\)../\nWhen: \3\/\2\/\1 | \4:\5 to \6:\7hs/p}
    /LOCATION/{s/.*:\(.*\)$/at \1/p}
}
