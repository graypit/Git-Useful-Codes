#!/usr/bin/env bash
# Author: Habib Quliyev 11.30.2020
# Global Variables:
GitFile="$1"
ToBranch="$2"
FromBranch="$(git rev-parse --abbrev-ref HEAD)"

if [ "$#" -lt 2 ]
then
    echo "Usage: ./$(basename $0) FileName ToBranchName"
    echo "Example: ./$(basename $0) Jenkinsfile master"
    exit 1
fi

function GatheringInformation() {
    LastCommitIdInFile=$(git log --all --source $FromBranch $GitFile|head -n1|grep commit|awk '{ print $2 }')
}

function StartPickingCherries(){
    git checkout $ToBranch
    if [ "$(git cherry-pick $LastCommitIdInFile)" ]
    then
        git push origin $ToBranch && echo "Success.Cherry picked and pushed :)" || echo "Oops..We could not push changes to $ToBranch.Do it manually" ; exit 1
    else
        git add $GitFile && git commit -m "Added $GitFile from $FromBranch" && git push origin $ToBranch && echo "Success.Cherry picked and pushed :)" || echo "Oops..We could not push changes to $ToBranch.Do it manually"
    fi
}
GatheringInformation
StartPickingCherries
