*** Settings ***
Resource    ../environment/library.robot
Library    DateTime
Library    Telnet
*** Variables ***
${chrome_options}

*** Keywords ***
Open Browser And Start Test
    [Documentation]
    ...    [Description]    Open Browser And Start Test
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${url}    ${browser}    ${alias}
    Set Selenium Timeout    ${Selenium Timeout}
    Set Selenium Speed    ${Selenium Speed}
    Open Browser    ${url}    ${browser}    options=add_argument("--disable-popup-blocking"); add_argument("--use-fake-ui-for-media-stream")    alias=${alias}
    Maximize Browser Window

Get ScreenShot
    [Documentation]
    ...    [Description]    Get ScreenShot
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    Log To Console    Get screenshot if test failed
    ${screenshotName}    Add Timestamp With No Separator After "${TESTNAME}"
    Run Keyword If Test Failed    ${screenshotName}.png

Add Timestamp With No Separator After "${text}"
    [Documentation]
    ...    [Description]    Add Timestamp With No Separator
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    Log To Console   Add Timestamp With No Separator
    ${date}    Get Current Date    result_format=%Y%m%d%H%M%S
    ${newtext}    Set Variable    ${text}${date}
    [Return]    ${newtext}

Login Vsee
    [Documentation]
    ...    [Description]    Login Vsee
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${id}    ${Password}
    Log To Console   Login Vsee
    Input "${id}" Text in "${Web_Login_Id}" Element
    Input "${login_password}" Text in "${Web_Login_Password}" Element
    Click "${Web_Login_Button}" Element

Verify Element Vissile
    [Documentation]
    ...    [Description]    Verify Element Vissile
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${xpath}
    Wait Until Element Is Visible    ${xpath}

Verify Element Is Not Vissile
    [Documentation]
    ...    [Description]    Verify Element Is Not Vissile
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${xpath}
    Wait Until Element Is Not Visible    ${xpath}

Open New Window
    [Documentation]
    ...    [Description]    Open New Window
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${url}
    Execute Javascript    window.open('${url}')
    Switch Window    New
    
#Selenium api
Input "${text}" Text in "${xpath}" Element
    [Documentation]    Input text in element
    Wait Until Element Is Visible    ${xpath}
    Input Text     ${xpath}    ${text}


Click "${xpath}" Element
    [Documentation]    Click element
    Set Selenium Timeout    ${Selenium Timeout}
    Set Selenium Speed    ${Selenium Speed}
    Wait Until Element Is Visible    ${xpath}
    Click Element    ${xpath}


    
