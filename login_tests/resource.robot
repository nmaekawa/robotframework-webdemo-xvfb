*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           XvfbRobot

*** Variables ***
${SERVER}         dev-05-engage-001.dce.harvard.edu
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     admin
${VALID PASSWORD}    opencast
${LOGIN URL}      http://${SERVER}/j_spring_security_check
${LOGIN TITLE}    Opencast Matterhorn – Login Page
${WELCOME URL}    http://${SERVER}/welcome.html
${WELCOME TITLE}    Opencast Matterhorn - 1.5.1: Zmutt Ridge
${ERROR URL}      http://${SERVER}/login.html?error

*** Keywords ***
Open Browser To Login Page
    Start Virtual Display  1920  1080
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    ${LOGIN TITLE}

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    j_username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    j_password    ${password}

Submit Credentials
    Click Button    submit

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be       ${WELCOME TITLE}


