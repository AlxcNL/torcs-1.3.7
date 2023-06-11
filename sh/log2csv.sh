#!/usr/bin/env bash

# TODO
fileName="torcs_server_short"
logFile="logs/${fileName}.log"
csvFile=data/json/${fileName}.json
logJCsv=$(cat $logFile | grep -E -w 'Sending')
header="angle;curLapTime;damage;distFromStart;distRaced;fuel;gear;lastLapTime;opponents;racePos;rpm;speedX;speedY;speedZ;track;trackPos;wheelSpinVel;z;focus;x;y;roll;epitch;yaw;speedGlobalX;speedGlobalY;angle;curLapTime;damage;distFromStart;distRaced;fuel;gear;lastLapTime;opponents;racePos;rpm;speedX;speedY;speedZ;track;trackPos;wheelSpinVel;z;focus;x;y;roll;epitch;yaw;speedGlobalX;speedGlobalY"

function extractState {
    logJCsv=${logJCsv//Sending: /}
    logJCsv=${logJCsv//[(]/}
    logJCsv=${logJCsv//)/;}
    logJCsv=${logJCsv//[a-z|A-Z]/}
        # | sed -e 's/\([a-z|A-Z]*\)/\t\"s_\1\": /' | sed -e 's/"s_"://' \
        # | sed -e 's/\([0-9]*\.[0-9]*\)/\1/g')       
}

function extractAction {
    echo $logJCsv | grep -E -w 'Received' \
        | sed -e 's/Received: //' \
        | sed -e 's/)/,\n/g' | sed -e 's/(//g' \
        | sed -e 's/\([a-z|A-Z]*\)/\t"s_\1":/' | sed -e 's/\t"s_"://' \
       
}

function makeJson {
    # echo $header
    extractState
    echo "$logJCsv" | xargs
    # extractAction
}

cls

if [[ "$(dirname $0)" == "sh" ]]; then    
    makeJson 
    # makeJson > $csvFile
else
    (cd ..; makeJson > $csvFile)
fi
