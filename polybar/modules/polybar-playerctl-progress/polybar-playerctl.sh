#!/bin/sh

PLAYER="spotify"



if [ "$(pidof "$PLAYER")" != "" ];
then
	POSITION="$(playerctl position)"
	POSITION="${POSITION//./}"
	LENGTH="$(playerctl metadata  mpris:length)"
	DURATION=`echo "($POSITION/$LENGTH)" | bc -l`
	STRING="$(playerctl metadata --format "{{ artist }} - {{ title }}")"
	size=${#STRING}
	PART=`echo "($DURATION * $size)" | bc -l`
	PARTINT=${PART%.*}
	UNDERLINED=${STRING::PARTINT}
	NOTUNDERLINED=${STRING:PARTINT}
	echo %{u#ff9900}%{+u}$UNDERLINED%{u-}$NOTUNDERLINED
else
	echo "$PLAYER is not running"
fi
