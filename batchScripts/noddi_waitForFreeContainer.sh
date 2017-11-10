#!/bin/sh

# run something when a container is free


wait_for_next_container_slot() {
# loop around until a slot is available
# set availableSlot to an available slot number
sleepTime=1
echo "<<<<<<<" entered wait_for_next_container_slot ">>>>>>"
availableSlot=0
freeContainer=0
 while [ "$availableSlot" -eq 0 ]; do
  for i in 1 2 3 4; do
   if [ ! "$(docker ps -q -f name=noddi$i)" ]; then
    availableSlot=$i
    freeContainer=noddi$i
    echo $freeContainer is available
   else
    echo slot $availableSlot is unavailable
   fi
  done
  sleep $sleepTime
 done
}

proc_one_noddi() {
 #Cycle through four possible container names
 #Simple mechanism to restrict number of simultaneous processes
 #This can restrict pipeline jobs at the level of this local script that intstantiates containers
 #idx=$((idx + 1))
 #if [[ $idx -gt 4 ]];then
 # idx=1
 #fi

 #curContainer=noddi1

 #waitContainerName=$curContainer
# wait_for_container_to_stop
 dirName=`dirname $1`

 wait_for_next_container_slot
 curContainer=noddi$availableSlot
 echo "---->"current container to launch is $curContainer

 echo ln -s `basename $1` dti_topup_eddy.nii.gz 
 ln -s `basename $1` dti_topup_eddy.nii.gz 
 echo $preProcCmd dti_topup_eddy.nii.gz Study01 Study01/Subject01 bvals.1D bvecs.1D mask_mask.nii.gz mask_mask.nii.gz
 $preProcCmd dti_topup_eddy.nii.gz Study01 Study01/Subject01 bvals.1D bvecs.1D mask_mask.nii.gz mask_mask.nii.gz

 #Check if container with same name is already open. If it is, wait until it finishes.
 #This can potentially negotiate pipeline usage among different users
# docker ps | grep noddi
 #docker wait $curContainer
 echo "-----"finished waiting for container $curContainer. Launching another.
 pwd
 echo $noddiCmd $curContainer
 $noddiCmd $curContainer
 sleep 10
 echo "<<<<<<<<<<<<>>>>>>>>>>>"
 cd $topDir
}

# ------------MAIN---------
topDir=`pwd`

#fnToFind=dti_topup_eddy.nii.gz
#find . -name $fnToFind > dti_topup_eddy_files.$$

while read fn
do
echo $fn
wait_for_next_container_slot
#proc_one_noddi $fn
done < temp_files_to_proc
