#!/bin/bash

echo
echo "In the logs of freesurfer script, there is run-time: the time taken by freesurfer script. The task is to: "
echo "1...Get run-time from each log"
echo "2...Restrict it to two decimal digits"
echo "3...Print the name of the log, if run-time is less than 9.5hrs."


tar xf logs.tgz
mv -t logs xI3ss_recon-all.log xI443s_recon-all.log xIops_recon-all.log xIosss_recon-all.log gcutError_recon-all.log
cd ~/logs
fixed_runtime=9.50
echo 

runtime=$(grep "run-time" xI3ss_recon-all.log | cut  -c "32-36")
if [ 1 -eq "$(echo "${runtime} < ${fixed_runtime}" | bc)" ]
then
   echo "$runtime is less than $fixed_runtime: xI3ss_recon-all.log"
fi

runtime=$(grep "run-time" xI443s_recon-all.log | cut  -c "32-36")
if [ 1 -eq "$(echo "${runtime} < ${fixed_runtime}" | bc)" ]
then
   echo "$runtime is less than $fixed_runtime: xI443s_recon-all.log"
fi

runtime=$(grep "run-time" xIops_recon-all.log | cut  -c "32-36")
if [ 1 -eq "$(echo "${runtime} < ${fixed_runtime}" | bc)" ]
then
   echo "$runtime is less than $fixed_runtime: xIops_recon-all.log"
fi

runtime=$(grep "run-time" xIosss_recon-all.log | cut  -c "32-36")
if [ 1 -eq "$(echo "${runtime} < ${fixed_runtime}" | bc)" ]
then
   echo "$runtime is less than $fixed_runtime: xIosss_recon-all.log"
fi

runtime=$(grep "run-time" gcutError_recon-all.log | cut  -c "32-36")
if [ 1 -eq "$(echo "${runtime} < ${fixed_runtime}" | bc)" ]
then
   echo "$runtime is less than $fixed_runtime: gcutError_recon-all.log"
fi

