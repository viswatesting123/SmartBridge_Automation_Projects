*** Settings ***
Library     SeleniumLibrary
Variables   config.py


*** Variables ***
${ENV}               QA
${BROWSER}           chrome
${B_VERSION}         18.0
${PLATFORM}          Windows
${P_VERSION}         10
${ATHENA_HOME}        https://${CRAFERIA_HOST}
${REMOTE_URL}        ${EMPTY}
${B_WIDTH}           1600
${B_HEIGHT}          960