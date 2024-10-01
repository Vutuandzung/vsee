*** Settings ***
Resource    ../../environment/library.robot
*** Variables ***
# Browser
${chrome}            chrome
${edge}              edge
${Selenium Timeout}    60
${Selenium Speed}       0.1
# ${CHROME_OPTIONS}    --use-fake-ui-for-media-stream    --use-fake-device-for-media-stream

# Web login
${login_id}          tuandunghust94@gmail.com
${login_password}    Abc13579!
${web_url}         https://team.vsee.me/providers/login
${meeting_room_url}         https://team.vsee.me/u/robin1
# Web client
${client_name}        John Vu
${client_reason}      Feeling dizzy