#!/bin/sh
#
# Copyright 1997, 1998, 1999, 2000  Patrick Volkerding, Moorhead, MN, USA
# Copyright 2001, 2002  Slackware Linux, Inc, Concord, CA, USA
# Copyright 2006, 2009  Patrick Volkerding, Sebeka, MN, USA
# All rights reserved.
#
# Redistribution and use of this script, with or without modification, is
# permitted provided that the following conditions are met:
#
# 1. Redistributions of this script must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
#
#  THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO
#  EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
#  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
#  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
#  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
#  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
#  ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

# This is a preprocessor for 'less'.  It is used when this environment
# variable is set:   LESSOPEN="|lesspipe.sh %s"

lesspipe() {
  case "$1" in
  *.tar) tar tvvf "$1" 2>/dev/null ;;
  *.tgz | *.tar.gz | *.tar.Z | *.tar.z | *.tar.bz2 | *.tbz ) tar tvvf "$1" 2>/dev/null ;;
  *.tlz | *.tar.lzma ) lzma -dc "$1" 2> /dev/null | tar tvvf - 2> /dev/null ;;
  *.txz | *.tar.xz ) xz -dc "$1" 2> /dev/null | tar tvvf - 2> /dev/null ;;
  *.zip) unzip -l "$1" 2>/dev/null ;;
  *.rpm) rpm -qpvl "$1" 2>/dev/null ;;
  *.rar) # check if rar is installed first
    if which rar 1> /dev/null ; then
      `which rar` t "$1" 
    fi ;;
  *.1|*.2|*.3|*.4|*.5|*.6|*.7|*.8|*.9|*.n|*.man) # *roff src?
    if file -L "$1" | grep roff 1> /dev/null ; then
      nroff -S -mandoc "$1"
    fi ;;
  *.1.gz|*.2.gz|*.3.gz|*.4.gz|*.5.gz|*.6.gz|*.7.gz|*.8.gz|*.9.gz|*.n.gz|*.man.gz) # compressed *roff src?
    if gzip -dc "$1" | file - | grep roff 1> /dev/null ; then
      gzip -dc "$1" | nroff -S -mandoc -
    else gzip -dc "$1"  2>/dev/null
    fi ;;
  *.1.bz2|*.2.bz2|*.3.bz2|*.4.bz2|*.5.bz2|*.6.bz2|*.7.bz2|*.8.bz2|*.9.bz2|*.n.bz2|*.man.bz2) # compressed *roff src?
    if bzip2 -dc "$1" | file - | grep roff 1> /dev/null ; then
      bzip2 -dc "$1" | nroff -S -mandoc -
    fi ;;
  *.gz) gzip -dc "$1"  2>/dev/null ;;
  *.bz2) bzip2 -dc "$1" 2>/dev/null ;;
  *.lzma) lzma -dc "$1" 2>/dev/null ;;
  *.xz) xz -dc "$1" 2>/dev/null ;;
#  *) FILE=`file -L "$1"` ; # Check to see if binary, if so -- view with 'strings'
#    FILE1=`echo $FILE | cut -d ' ' -f 2`
#    FILE2=`echo $FILE | cut -d ' ' -f 3`
#    if [ "$FILE1" = "Linux/i386" -o "$FILE2" = "Linux/i386" \
#         -o "$FILE1" = "ELF" -o "$FILE2" = "ELF" ]; then
#      strings "$1"
#    fi ;;
  esac
}

lesspipe "$1"
