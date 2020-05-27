#!/bin/bash
#Made by Dennis Larsson @ University of Vienna 2020
#Be mindful that admixture output output files directly where you stand in the terminal! 
#However because Admixture doesn't allow you to designate an outout folder, I have integrated into the script a few commands to create a folder and change the directory to that folder.
#This will allow Admixture to output files into a separate folder without cluttering your current workspace.
#Be careful though when using relative paths!

#make sure that you stand in the same folder in the terminal as where the .ped file is. The script will create a subfolder in that folder, and run admixture there. It is important to not use paths in the argument, only the names of the .ped file and the name of the output folder to be created in the current folder (no paths that start in folders other than where the .ped is).
#Run like this: ./admixture.sh myOrganism.ped output_folder maxK threads


pedfile=$1
admfolder=$2
maxK=$3
threads=$4

mkdir $admfolder
cd $admfolder

for ((K=1; K<=$maxK; K++))
do
	admixture --cv -j$threads ../$pedfile $K | tee log${K}.out
done
logfile=$admfolder".log"
grep -h CV log*.out > ../$logfile
