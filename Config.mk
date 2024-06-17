name		:= berry
VERSION		:= 0.1.12

################ Programs ############################################

CC		:= gcc
INSTALL		:= install
INSTALL_DATA	:= ${INSTALL} -m 644
INSTALL_PROGRAM	:= ${INSTALL} -m 755 -s

################ Destination #########################################

prefix		:= /usr/local
bindir		:= ${prefix}/bin
datadir		:= ${prefix}/share
mandir		:= ${datadir}/man
man1dir		:= ${mandir}/man1
TMPDIR		:= /tmp
builddir	:= ${TMPDIR}/make/${name}
O		:= .o/

################ Compiler options ####################################

#debug		:= 1
libs		:= -lX11 -lXinerama -lfontconfig -lfreetype -lXft
ifdef debug
    cflags	:= -O0 -ggdb3
    ldflags	:= -g -rdynamic
else
    cflags	:= -Os -g0 -DNDEBUG=1
    ldflags	:= -s
endif
CFLAGS		:= -Wall -Wextra -Wredundant-decls -Wshadow \
		   -Wno-deprecated-declarations -pedantic
cflags		+= -std=c99 -I/usr/include/freetype2 -I/usr/include/libpng16 -I/usr/include/harfbuzz -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include -I/usr/include/sysprof-6 -pthread ${CFLAGS}
ldflags		+=  ${LDFLAGS}
