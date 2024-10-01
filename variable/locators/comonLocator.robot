*** Settings ***
Resource    ../../environment/library.robot

*** Variables ***
${Web_Common_Url}                      xpath=https://team.vsee.me/providers/login
${Web_Login_Id}                        xpath=//input[@id='AppUserUsername']
${Web_Login_Password}                  xpath=//input[@id='AppUserPassword']
${Web_Login_Button}                    xpath=//button[@id='btnSignIn']
${Web_Update_Timezone_Popup}           xpath=//h4[text()='Update Time Zone Settings']
${Web_Update_Timezone_Cancel_Button}           xpath=//button[@class='btn btn-default' and text()='Cancel']
${Web_Update_Timezone_Dashboard_Mainmenu}           xpath=//a[@class='menu-users-dashboard']

#Client login page
${Web_Yourname_Input}           xpath=//input[@name='first_name']
${Web_Reason_Visit_Input}           xpath=//textarea[@name='reason_for_visit']
${Web_Give_Consent_Checkbox}            xpath=//label[@class='checkbox']//input[@id='jsonform-1-elt-consent']
${Web_Enter_WaitingRoom_Button}            xpath=//input[@value='Enter Waiting Room']
${Web_Welcome_Message}            xpath=//div[@class='reminder_message']
${Web_Continue_Button}            xpath=//button[contains(.,'Continue')]
${Web_Provider_Link}            xpath=//a[text()='For Providers']
${Web_Media_Iframe}            xpath=//iframe[@name="jitsiConferenceFrame0"]
${Web_Video_Label}            xpath=//div[text()='Text me when the provider is ready']/ancestor::a[@class='button']
${Web_Loading_Icon}            xpath=//div[@class='blockUI blockMsg blockPage']

#Providers
${Web_Call_Button}            xpath=//a[contains(text(),'John Vu')]/ancestor::div[@class='panel-body']/preceding-sibling::div//a[@title='Call']
${Web_ContinueBrowser_Button}            xpath=//h3[text()='Continue on this browser']/..
${Web_VisitChat_Button}            xpath=//span[text()='Visit Chat']/..
${Web_VisitChat_Input}            xpath=//input[@placeholder='Type your message here']
${Web_VisitChat_Content}            xpath=//label[@class='webchat-message-client name']/../following-sibling::div[@class='webchat-message-content']//div[text()='****']