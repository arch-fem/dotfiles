#!/bin/bash
STATUS=$(cat /sys/class/power_supply/BAT0/status)
REMAIN=$(echo "scale=1; $(cat /sys/class/power_supply/BAT0/capacity)*100/80" | bc -l)

if [[ ${STATUS} = "Discharging" ]]; then
    remain=$(( $(echo $REMAIN | sed -e 's/\.[0-9]*$'//g) + 0 ))
    (( $remain > 20 )) && echo -e "${STATUS} ${REMAIN}%\n\n#8CFF2D" || \
    echo -e "${STATUS} ${REMAIN}%\n\n#FE2E2E"
else
    echo -e "${STATUS} ${REMAIN}%\n\n#8CFF2D"
fi
