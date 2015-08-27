#!/bin/sh

# |gco|: compile |@program@.c| [...] , 'outputting' to basename of first arg.

# written by Hugh McGuire

if [ $# -lt 1 ]
then
    echo Usage:\  `basename $0` '@program@.c' '[...]' >&2
    exit 1
fi

DIRNAME=`dirname "$1"`
BASENAME_C=`basename "$1" .c`
BASENAME=`basename "$1"`

if [ "${BASENAME_C}.c" != "${BASENAME}" ]
then
    echo Usage:\  `basename $0` '@program@.c' '[...]' >&2
    exit 1
fi

# if debugging:
set -x                  # seems nice even if not debugging
# set -v

gcc -std=c99 -Wall -g "$@" -lm -o "$DIRNAME/$BASENAME_C"
