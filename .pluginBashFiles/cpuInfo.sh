mem=`free -h -t | grep Mem | sed -e 's/ //g' | cut -d"G" -f1,2`
mem=`echo $mem | sed -e 's/Mem://g' | sed -e 's/Gi/ /g'`
totalMem=`echo $mem | cut -d" " -f1`
freeMem=`echo $mem | cut -d" " -f2`

cpuLA=`cat /proc/loadavg | cut -d" " -f1,2,3`


echo " $freeMem$totalMem    $cpuLA"
