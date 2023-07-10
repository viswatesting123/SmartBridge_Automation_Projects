*** Settings ***
Resource      ../libs/Web_Settings.robot
Library       DateTime
Library       String



*** Variables ***
${athena_username}             //input[@name='email']
${athena_password}             //input[@name='password']
${login_button}                //button[@name='login']
${dashboard_page}              //a[normalize-space()='Learning']


*** Keywords ***

Setup browser
    [Arguments]                 ${login_url}=${IXL_HOME}

    Set Selenium timeout       ${UI_TIMEOUT}s
    # support remote url for browser stack
    open browser  ${login_url}      browser=${BROWSER}
    Maximize Browser Window



Verify the IXL Dashboard page is visible



    Wait Until Element Is Visible    ${dashboard_page}
    Log out




Log out
    close browser