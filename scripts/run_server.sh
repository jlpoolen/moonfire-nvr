#!/bin/bash
#
# Script to start and stop (use Ctrl-C) moonfire-nvr server
# run as root so the sudo doesn't prompt for password
#

START_TIME="$(date '+%Y%b%d_%H%M%S%Z')"
LOG=moonfire_jlpoole_$START_TIME.log
CMD=$(sudo -u moonfire-nvr /usr/local/src/moonfire/moonfire-nvr/target/release/moonfire-nvr run  &>${LOG})
echo Commencing with:
echo    ${CMD} at ${START_TIME}
$(${CMD})
echo Completed $(date '+%Y%b%d_%H:%M_%Z') >> ${LOG}
echo Completed $(date '+%Y%b%d_%H:%M_%Z') 
