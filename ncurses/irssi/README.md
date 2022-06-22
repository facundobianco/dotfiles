# Irssi configuration files

## Script list

- adv_windowlist.pl
- bitlbee_blist.pl
- facebook_bitlbee_rename.pl
- il.pl
- nm.pl
- trigger.pl
- usercount.pl

## Trigger script

Triggers file version 1.0

```
-all -nocase -regexp '</?(a|b|body|div|em|font|i|s|u)( +\w+=".*?")*>' -replace ''

-privmsgs -nocase -regexp '&amp;' -replace '&'
-privmsgs -nocase -regexp '&gt;' -replace '>'
-privmsgs -nocase -regexp '&lt;' -replace '<'
-privmsgs -nocase -regexp '&quot;' -replace '"'
```
