DATETIME=`date`
RAM=$(free -m | grep '^Mem' | awk '{print "RAM Used: " $3"MB" }') 
VOLUME=$(amixer get Master | tail -n1 | awk '{ print "Volume: " $4 }' | tr -d '[]') 
BATTERYSTATE=$( acpi -b | awk '{ split($5,a,":"); print substr($3,0,2), $4, 
"["a[1]":"a[2]"]" }' | tr -d ',' ) 
xsetroot -name "${VOLUME} | ${DATETIME} | ${RAM} | ${BATTERYSTATE}"
