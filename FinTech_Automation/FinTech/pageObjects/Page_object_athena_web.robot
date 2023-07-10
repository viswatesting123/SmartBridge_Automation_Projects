*** Settings ***
Resource      ../libs/Web_Settings.robot
Library       DateTime
Library       String



*** Variables ***
${athena_username}             //input[@name='email']
${athena_password}             //input[@name='password']
${login_button}                //button[@name='login']
${dashboard_page}              //h5[text()='Overview']
${create_party}                //div[@data-original-title='Party']
${party_dashboard}             //h5[text()='Parties']
${add_new_party}               //button[@id='add-task']
${add_new_party_name}          //input[@id='id_customer_name']
${party_address_1}              //input[@id='id_address_line_1']
${party_city_address}           //input[@id='id_city']
${party_state_address}          //input[@id='id_state']
${party_zip_code}               //input[@id='id_zip_code']
${party_country}                //input[@id='id_country']
${save_party}                   //*[text()='Save & Continue']
${footer_section}               (//*[@alt='Athena Fintech'])[2]
${create_contract}              //div[@data-original-title='Contract']
${new_contract}                 //button[@data-bs-toggle='dropdown']
${loan}                         //li/a[text()='Loan']
${customer}                     //label[text()='Customer']//following-sibling::div//input
${term}                         //*[@id='contract_term']
${interest_rate}                //*[@id='interest']
${vendor_name}                  //*[@id='vendor_list']
${vendor_option}                //option[text()='university']
${vehicle_cost}                 //*[@name='vehiclecost']
${save_contract}                //button[@type='submit']
${create_invoices}              //div[@data-original-title='Invoice']
${new_invoice}                  //*[@id='add-task']
${invoice_customer_name}        //label[contains(text(),'Customer')]//following-sibling::div//input
${contract_number}              //label[contains(text(),'Contract Number')]//following-sibling::div//input
${due_date}                     //*[@name='duedate']

*** Keywords ***

Setup browser
    [Arguments]                 ${login_url}=${ATHENA_HOME}

    Set Selenium timeout       ${UI_TIMEOUT}s
    # support remote url for browser stack
    open browser  ${login_url}      browser=${BROWSER}
    Maximize Browser Window

Login as
    [Arguments]     ${username}     ${password}

    Click Element       ${athena_username}
    Input Text          ${athena_username}    ${username}
    Click Element       ${athena_password}
    Input Text          ${athena_password}    ${password}
    Sleep    10s
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)
    Click Element       ${login_button}
    wait until page does not contain element  ${login_button}

Verify the Athena Dashboard page is visible

    Sleep    5s
    Wait Until Element Is Visible    ${dashboard_page}
    # exclipit wait



Create Party information

    Click Element    ${create_party}
    Wait Until Element Is Visible    ${party_dashboard}
    Click Element    ${add_new_party}
    Execute Javascript      window.scrollTo(0,document.body.scrollHeight)
    Sleep    5s
    Input Text    ${add_new_party_name}    athenatest1
    Input Text    ${party_address_1}    california
    Input Text    ${party_city_address}    ca
    Input Text    ${party_state_address}    ca
    Input Text    ${party_zip_code}    96162
    Input Text    ${party_country}    USA
    Sleep    5s
    Click Element    ${save_party}
    Sleep    5s

Create Contract information
    
    Click Element    ${create_contract}
    Sleep    5s
    Click Element    ${new_contract}
    Click Element    ${loan}
    Click Element    ${customer}
    Input Text    ${customer}    universal
    Press Keys      None    ARROW_DOWN
    Press Keys      None    ENTER
    Sleep   10s
    Input Text    ${term}    240
    Sleep   10s
    Input Text    ${interest_rate}    8
    Click Element    ${vendor_name}
    Sleep   10s
    Click Element    ${vendor_option}
    Input Text    ${vehicle_cost}    4574543
    Sleep   10s
    Click Element    ${save_contract}

Create Invoices

    Click Element    ${create_invoices}
    Sleep    5s
    Click Element    ${new_invoice}
    Input Text    ${invoice_customer_name}    universal
    Press Keys      None    ARROW_DOWN
    Press Keys      None    ENTER
    Input Text    ${contract_number}    1010
    Press Keys      None    ARROW_DOWN
    Press Keys      None    ENTER
    Input Text    ${due_date}    25/01/2020
    Sleep    5s
    Click Element    ${save_contract}

Log out
    close browser