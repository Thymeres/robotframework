*** Settings ***
Documentation     A simple test case for showcasing my knowledge with Robot Framework
Library           SeleniumLibrary
Library           DateTime
Resource          ../keywords/action_keywords.robot
Resource          ../keywords/api_keywords.robot
Resource          ../keywords/verification_keywords.robot
Variables         ../pages/register_page.py
Variables         ../pages/products_page.py
Variables         ../pages/login_page.py
Variables         ../pages/checkout_page.py
Variables         ../pages/constants.py


Test Setup       Opening Browser
Test Teardown    Close Browser
Test Timeout       60s

*** Keywords ***
Opening Browser
    Open Browser    https://www.automationexercise.com/    chrome     executable_path=./chromedriver.exe
    Maximize Browser Window
    Wait Until Page Contains    Full-Fledged practice website for Automation Engineers     timeout=10s

Delete account
    Click Element With Text "Delete Account"
    # Account deletion success page
    Wait Until Page Contains    Account Deleted!
    Click Element With Text "Continue"
    # Homepage
    Verify Element With Text "Signup / Login"

*** Test Cases ***
Register User
    [Documentation]     User registration
    [Tags]      Registration
    Click Element With Text "Signup / Login"
    Wait Until Page Contains    New User Signup!
    Input Text    ${SIGNUPNAME_TXT}    userfullname
    # Create unique email with timestamp
    ${email}=    Get timestamp name with prefix "email"
    Input Text    ${SIGNUPEMAIL_TXT}    ${email}@email.com
    Click Button With Text "Signup"
    Wait Until Page Contains    Enter Account Information
    # Filling up form
    Click Element    id:id_gender1
    Element Attribute Value Should Be    id:name    value    userfullname
    Element Attribute Value Should Be    id:email   value    ${email}@email.com
    Input Text    id:password    Password1!
    Click Element    id:days
    Click Element With Text "10"
    Click Element    id:months
    Click Element With Text "February"
    Click Element    id:years
    Click Element With Text "1990"
    Click ELement    id:newsletter
    Click Element    id:optin
    Input Text    id:first_name    FirstName
    Input Text    id:last_name    LastName
    Input Text    id:company    Company of Heroes
    Input Text    id:address1    123 Testaddress
    Input Text    id:address2    Unit 100
    # Scrolling down to button because ads are blocking the fields
    Scroll Element Into View    ${CREATEACCOUNT_BTN}
    Click Element    id:country
    Click Element With Text "Canada"
    Input Text    id:state    Ontario
    Input Text    id:city    London
    Input Text    id:zipcode    N1A 2B3
    Input Text    id:mobile_number    2261234567
    # Scrolling down to subscribe field because ads are blocking the continue button
    Scroll Element Into View    ${SCROLLTOVIEW_LABEL}
    Click Element    ${CREATEACCOUNT_BTN}
    # Account creation success page
    Wait Until Page Contains    Account Created!
    Click Element With Text "Continue"
    # Verify user is logged in
    Wait Until Page Contains    Logged in as userfullname
    Delete account
