*** Settings ***
Resource      ../libs/Web_Settings.robot
Library       DateTime
Library       String



*** Variables ***
${craferia_username}             //input[@id='username']
${craferia_password}             //input[@id='password']
${login_button}                //button[@name='login']
${dashboard_page}              //a[normalize-space()='Dashboard']
${create_party}                //div[@data-original-title='Party']


*** Keywords ***

Setup browser
    [Arguments]                 ${login_url}=${ATHENA_HOME}

    Set Selenium timeout       ${UI_TIMEOUT}s
    # support remote url for browser stack
    open browser  ${login_url}      browser=${BROWSER}
    Maximize Browser Window

Login as
    [Arguments]     ${username}     ${password}

    Click Element       ${craferia_username}
    Input Text          ${craferia_username}    ${username}
    Click Element       ${craferia_password}
    Input Text          ${craferia_password}    ${password}
    Sleep    10s
    Click Element       ${login_button}
    wait until page does not contain element  ${login_button}

Verify the Craferia Dashboard page is visible

    Sleep    5s
    Wait Until Element Is Visible    ${dashboard_page}
    # exclipit wait





Log out
    close browser