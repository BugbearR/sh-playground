#!/bin/sh

# %zh hours part of offset (0 padding) [-23,+23]
# %zm minutes part of offset (0 padding) [00,59]
# %z offset ([+-]HH:MM)
strftime_subset()
{
    # echo "$1"
    printf '%s\n' "$1" | sed -e "s/%Y/$2/g" -e "s/%m/$3/g" -e "s/%d/$4/g" -e "s/%H/$5/g" -e "s/%M/$6/g" -e "s/%S/$7/g" -e "s/%zh/$8/g" -e "s/%zm/$9/g" -e "s/%z/$8:$9/g"
}

get_current_iso8601_local()
{
    FORMAT=${1:-}
    U_Y= U_m= U_d= U_H= U_M= U_S=
    L_Y= L_m= L_d= L_H= L_M= L_S=
    while :
    do
        set $(date '+%Y %m %d %H %M %S')
        L_Y=$1 L_m=$2 L_d=$3 L_H=$4 L_M=$5 L_S=$6
        L_Hn=${L_H#0}; L_Hn=${L_Hn:-0}
        L_Mn=${L_M#0}; L_Mn=${L_Mn:-0}
        if [ "x$L_S" = "x$U_S" ]; then
            break
        fi

        set $(date -u '+%Y %m %d %H %M %S')
        U_Y=$1 U_m=$2 U_d=$3 U_H=${4#0} U_M=${5#0} U_S=$6
        U_Hn=${U_H#0}; U_Hn=${U_Hn:-0}
        U_Mn=${U_M#0}; U_Mn=${U_Mn:-0}
        if [ "x$L_S" = "x$U_S" ]; then
            break
        fi
    done
    L_min=$((L_Hn * 60 + L_Mn))
    U_min=$((U_Hn * 60 + U_Mn))
    if [ $L_Y$L_m$L_d -lt $U_Y$U_m$U_d ]
    then
        L_min=$((L_min - 1440))
    elif [ $L_Y$L_m$L_d -gt $U_Y$U_m$U_d ]
    then
        L_min=$((L_min + 1440))
    fi
    D_min=$((L_min - U_min))
    if [ $D_min -lt 0 ]
    then
        sign='-'
        D_min=$((-D_min))
    else
        sign='+'
    fi
    D_M=$((D_min % 60))
    D_H=$((D_min / 60))
    # echo ${L_Y} ${L_m} ${L_d} ${L_H} ${L_M} ${L_S} ${sign}${D_H} ${D_M} ${D_min}
    if [ -n "$FORMAT" ]
    then
        strftime_subset "$FORMAT" ${L_Y} ${L_m} ${L_d} ${L_H} ${L_M} ${L_S} $(printf "${sign}%02d" $D_H) $(printf '%02d' $D_M)
    else
        printf "${L_Y}${L_m}${L_d}T${L_H}${L_M}${L_S}${sign}%02d%02d\n" $D_H $D_M
    fi
}

get_current_iso8601_local "$@"
