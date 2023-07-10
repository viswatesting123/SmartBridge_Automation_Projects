*** Settings ***
Resource      ../pageObjects/Page_object_athena_web.robot



Test Setup          Setup Browser
Test Teardown       Close Browser


*** Variables ***
# User Details for test suite
&{athena_user_info}        username=chandana@athenafintech.com     password=admin@12345
${test}         uservalue
@{listvariable}     testone     testwo      testhree



*** Test Cases ***

ATHENA-111: Create Party, contract and other information about fintech products
    [Tags]      Smoke   viswa   underdev    underuat

     Login as    ${athena_user_info['username']}  ${athena_user_info['password']}
     Verify the Athena Dashboard page is visible
#     Create Party information
#     Create Contract information
#     Create Invoices
#     Add Payment details
#     Add Receipts details
#     Add Report details
#     Add Inventory details
#     Add Pricing details
     Log out





*** Keywords ***


Teardown Suite Test
     Close All Browsers
