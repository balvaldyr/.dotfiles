#!/usr/bin/env bash
#
#	kbdd_layout is a script that parse layout with kbdd in real time
#	Copyright (C) 2016 Anton Karmanov <starcom24@gmail.com>
#
#	This program is free software: you can redistribute it and/or modify
#	it under the terms of the GNU General Public License as published by
#	the Free Software Foundation, either version 3 of the License, or any
#	later version.
#
#	This program is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#	GNU General Public License for more details.
#
#	You should have received a copy of the GNU General Public License
#	along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Get initial state of layout
NUMBER=$( dbus-send --print-reply=literal --dest=ru.gentoo.KbddService\
    /ru/gentoo/KbddService ru.gentoo.kbdd.getCurrentLayout 2>/dev/null |\
    sed -un 's/^.*uint32 //p' )

# In case dbus service wasn't available yet, poll until service is ready
while [[ -z "$NUMBER" ]]; do
    sleep .1
    NUMBER=$( dbus-send --print-reply=literal --dest=ru.gentoo.KbddService\
        /ru/gentoo/KbddService ru.gentoo.kbdd.getCurrentLayout 2>/dev/null |\
        sed -un 's/^.*uint32 //p' )
done

NAME=$( dbus-send --print-reply=literal --dest=ru.gentoo.KbddService \
	/ru/gentoo/KbddService ru.gentoo.kbdd.getLayoutName uint32:$NUMBER )

case "$NAME" in
    *English*)
        echo "EN";;
    *German*)
        echo "DE";;
    *)
        echo "KB";;
esac

echo ""
echo "#870000"

# Parse dbus output - detects changes, will stay in infinite loop
#dbus-monitor "interface='ru.gentoo.kbdd',member='layoutNameChanged'" |\
#	sed -un '0~2p' | sed -un 's:.*string "\(.*\)".*:\1:p'  | sed -u '/:/d'
