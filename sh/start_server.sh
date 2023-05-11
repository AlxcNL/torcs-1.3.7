#!/usr/bin/env bash

logfile="$(realpath ../logs)/torcs_server.log"
rm ${logfile}
touch ${logfile}
date >> ${logfile}

printf "Log to %s\n" ${logfile}
torcs >> ${logfile}