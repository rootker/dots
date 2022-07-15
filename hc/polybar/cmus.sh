#!/bin/bash

case "$1" in
    --toggle)
        if mpc | grep -q 'status playing'; then
           mpc play 
        else
          mpc pause 
        fi
        ;;
    *)
        if mpc >/dev/null | head -1; then
		output=`mpc | head -1  | awk '{$1=""; $2=""; print $0}' |cut -c 3-`
		if ((${#output} > 21)); then
			echo ${output:0:21}"..."
		else
			echo $output
		fi
        fi
        ;;
esac
