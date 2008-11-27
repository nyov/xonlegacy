#!/bin/sh

allsounds=`find sound -name .svn -prune -o \( -name \*.ogg -o -name \*.wav \) -print`
for S in $allsounds; do
	SND=${S#sound/}
	SND=${SND%.*}
	if [ -f "sound/$SND.ogg" ] && [ -f "sound/$SND.wav" ]; then
		echo "$SND exists twice"
	fi
	case "$SND" in
		player/*/*)
			# verified by .sounds file check
			;;
		ambient/*)
			# maps can use them always
			;;
		weather/*)
			# maps can use them always
			;;
		cdtracks/*)
			# maps can use them always
			;;
		misc/footstep*)
			;;
		misc/metalfootstep*)
			;;
		misc/hitground*)
			;;
		misc/metalhitground*)
			;;
		misc/talk*) # engine
			;;
		*)
			if ! grep -Er '"'$SND'\.(ogg|wav)"' qcsrc/server >/dev/null; then
				echo "$S ($SND) is unused by the code"
			fi
			;;
	esac
done

LF="
"
allsounds="$LF`find sound/player -mindepth 2 -name .svn -prune -o \( -name \*.ogg -o -name \*.wav \) -print`$LF"
remainingsounds=$allsounds
psoundfile()
{
	snd=$1
	pat="$LF$snd$LF"
	case "$allsounds" in
		*$pat*)
			case "$remainingsounds" in
				*$pat*)
					remainingsounds=${remainingsounds%%$pat*}$LF${remainingsounds#*$pat}
					;;
			esac
			return 0
			;;
		*)
			return 1
			;;
	esac
}
psoundtry()
{
	s=$1
	psoundfile "$s.ogg" || psoundfile "$s.wav"
}
psound()
{
	s=$1
	if psoundtry "$s"; then
		:
	else
		echo "$S references nonexisting sound $s"
	fi
}

for S in models/player/*.sounds sound/player/default.sounds; do
	if [ "$S" = "sound/player/default.sounds" ] || [ -f "${S#.sounds}" ]; then
		while read -r TITLE SOUND COUNT; do
			case "$TITLE" in
				//*)
					good=false
					case "$COUNT" in
						0)
							if psoundtry "$SOUND"; then
								good=false
							fi
							;;
						*)
							for i in `seq 1 $COUNT`; do
								if psoundtry "$SOUND$i"; then
									good=true
								fi
							done
							;;
					esac
					if $good; then
						echo "$S references existing sound $SOUND but commented out"
					fi
					;;
				*[!a-z0-9]*)
					echo "Unknown identifier $TITLE in $S"
					;;
				*)
					case "$COUNT" in
						0)
							psound "$SOUND"
							;;
						*)
							for i in `seq 1 $COUNT`; do
								psound "$SOUND$i"
							done
							;;
					esac
					;;
			esac
		done < "$S"
	else
		echo "$S exists for nonexisting player model"
	fi
done
for S in $remainingsounds; do
	echo "$S is not used by any player model"
done

# tag check
for S in models/player/*.sounds; do echo -n `head -n 1 "$S"`"  "; md5sum "$S"; done | sort
