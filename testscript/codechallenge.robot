*** Settings ***
Resource    ../environment/library.robot
Test Teardown    Run Keyword And Ignore Error    Get ScreenShot

*** Variables ***
${chat_text}
*** Test Cases ***
Chat Positive Flow
    [Documentation]
    ...    [TC_ID]    TC01_Verify_Chatbox
    ...    [Description]    Verify positive testcase for chat box
    ...    [Author]    John.vu
    ...    [Date]       2024.09.30
    Open Browser And Start Test    ${meeting_room_url}   ${chrome}    chrome_browser 
    Input "${client_name}" Text in "${Web_Yourname_Input}" Element
    Input "${client_reason}" Text in "${Web_Reason_Visit_Input}" Element
    Select Checkbox    ${Web_Give_Consent_Checkbox} 
    Click "${Web_Enter_WaitingRoom_Button}" Element
    Verify Element Vissile    ${Web_Video_Label}
    Verify Element Is Not Vissile    ${Web_Loading_Icon}

    Open Browser And Start Test    ${meeting_room_url}   ${edge}    edge_browser 
    Click "${Web_Provider_Link}" Element

    Login Vsee    ${login_id}    ${login_password}
    Verify Element Vissile    ${Web_Update_Timezone_Popup}  

    Click "${Web_Update_Timezone_Cancel_Button}" Element  
    Verify Element Vissile    ${Web_Update_Timezone_Dashboard_Mainmenu}

    Click "${Web_Call_Button}" Element  
    Click "${Web_ContinueBrowser_Button}" Element  
    Click "${Web_VisitChat_Button}" Element  
    Input Text Into Chatbox    Helloworld
    Press Keys    ${Web_VisitChat_Input}    \ue007

    Switch Browser  chrome_browser
    Verify Text On Client End    ${chat_text}  

    Switch Browser  edge_browser  
    Close Browser

    Switch Browser  chrome_browser  
    Close Browser
    
*** Keywords ***
Verify Text On Client End
    [Documentation]
    ...    [Description]    Verify Text On Client End
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${text}
    ${loc}    Replace String    ${Web_VisitChat_Content}    ****    ${text}
    Verify Element Vissile    ${loc}

Input Text Into Chatbox
    [Documentation]
    ...    [Description]    Input Text Into Chatbox
    ...    [Date]           2024.09.30
    ...    [Author]          John.vu
    [Arguments]    ${text}
    ${chat_text}    Add Timestamp With No Separator After "${text}"
    Input "${chat_text}" Text in "${Web_VisitChat_Input}" Element
    Set Test Variable    ${chat_text}

