#!/bin/bash

Benn=("Benign" "Attack")
MalBen=$(
	zenity --list --title="Benign or attack scenario" --width="250" --height="200" \
	--column="Scenario type" \
	--text "Insert your choice" "${Benn[@]}" \
)		

Duration=30


#if [[ ${MalBen} == "${Benn[1]}" ]]; then
#	zenity --error --title="Attack scenarios coming to GUI" --text="The attack-scenarios are not included in the GUI yet, sorry. Switching to Benign-scenarios"
#fi

if [[ ${MalBen} == "${Benn[1]}" ]]; then
	. GUI_files/GUI_Mal.sh
	
fi


if [[ ${MalBen} == "${Benn[0]}" ]]; then
. GUI_files/GUI_Benign.sh
fi

. GUI_files/GUI_cred.sh
. GUI_files/GUI_file.sh
. GUI_files/GUI_congest.sh
. GUI_files/GUI_load.sh
. GUI_files/GUI_repeat.sh

###############################
# Execution ###################
###############################


cd captures/$Directory
#echo ${Duration}
. ./$ExecFile $Activity ${Duration}
mkdir -p ../../Generated_data/"${Scenario}_${CAPTURETIME}"
mv data/* ../../Generated_data/"${Scenario}_${CAPTURETIME}"/

