*** Settings ***
Resource      ../pageObjects/Page_object_IXL_Learning_web.robot


Test Setup          Setup Browser
Test Teardown       Close Browser


*** Variables ***
# User Details for test suite
&{ixl_user_info}        username=testuser@gmail.com     password=admin@12345


*** Test Cases ***

IXL-111: Validate IXL Learning
    [Tags]      Smoke


    Verify the IXL Dashboard page is visible






*** Keywords ***


Teardown Suite Test
     Close All Browsers
