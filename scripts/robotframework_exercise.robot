*** Settings ***
Documentation     A simple test case for showcasing my knowledge with Robot Framework
Library           SeleniumLibrary
Library           DateTime
Resource          ../keywords/action_keywords.robot
Resource          ../keywords/api_keywords.robot
Variables         ../pages/robotframework_exercise.py
Test Setup       Opening Browser
Test Teardown    Close Browser
Test Timeout       60s

*** Keywords ***
Opening Browser
    Open Browser    https://www.automationexercise.com/    chrome     executable_path=./chromedriver.exe
    Maximize Browser Window
    Wait Until Page Contains    Full-Fledged practice website for Automation Engineers     timeout=10s

*** Test Cases ***
Test Case1: Register User
    [Documentation]     User registration
    [Tags]      Registration
    Click Element With Text "Signup / Login"
    Wait Until Page Contains    New User Signup!
    Input Text    ${SIGNUPNAME}    userfullname
    # Create unique email with timestamp
    ${email}=    Get timestamp name with prefix "email"
    Input Text    ${SIGNUPEMAIL}    ${email}@email.com
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
    Scroll Element Into View    ${CREATEACCOUNT}
    Click Element    id:country
    Click Element With Text "Canada"
    Input Text    id:state    Ontario
    Input Text    id:city    London
    Input Text    id:zipcode    N1A 2B3
    Input Text    id:mobile_number    2261234567
    # Scrolling down to subscribe field because ads are blocking the continue button
    Scroll Element Into View    id:subscribe
    Click Element    ${CREATEACCOUNT}
    # Account creation success page
    Wait Until Page Contains    Account Created!
    Click Element With Text "Continue"
    # Verify user is logged in
    Wait Until Page Contains    Logged in as userfullname
    # Verify user can delete their account
    Click Element With Text "Delete Account"
    Wait Until Page Contains    Account Deleted!
    Click Element With Text "Continue"
    Verify Element With Text "Signup / Login"

Test Case 16: Place Order: Login before Checkout
    [Documentation]     User Checkout
    [Tags]      Checkout
    Click Element With Text "Signup / Login"
    Wait Until Page Contains    Login to your account
    # Get user email from create account API
    ${emailcom}=    Create user via api
    Input Text    ${LOGINEMAIL}    ${emailcom}
    Input Text    ${LOGINPASSWORD}    Password1!
    Click Button With Text "Login"
    # Verify user is logged in
    Wait Until Page Contains    Logged in as testname
    Scroll Element Into View    ${STYLISHDRESS}
    # Go to product page and add to cart item
    Click Element    ${BLUETOPVIEW}
    Wait Until Page Contains    Write Your Review
    Click Button With Text "Add to cart"
    Wait Until Page Contains    Your product has been added to cart.
    # Go to cart
    Click Element With Text "Continue Shopping"
    Click Element With Text "Cart"
    # Verify that cart page is displayed with the correct order and Click Proceed To Checkout
    Wait Until Page Contains    Shopping Cart
    Wait Until Page Contains Element   ${BLUETOP}
    Click Element    ${CARTCHECKOUT}
    #  Verify checkout page is displayed with correct Address Details and Item Order
    Wait Until Page Contains Element    id:address_delivery
    Element Should Contain    ${FIRSTNAMEADDRESS}    testfirstname testlastname
    Element Should Contain    ${ADDRESS1}    testaddress
    Element Should Contain    ${CITY}    testcity teststate testzipcode
    Element Should Contain    ${COUNTRY}    Canada
    Element Should Contain    ${MOBILENUM}    testmobile_number
    Wait Until Page Contains Element    id:product-1
    Scroll Element Into View    ${SCROLLTOVIEW}
    # Click Checkout
    Click Element    ${CARTCHECKOUT}
    # Enter payment details: Name on Card, Card Number, CVC, Expiration date
    Wait Until Page Contains Element    id:payment-form
    Input Text    name:name_on_card    testfirstname testlastname
    Input Text    name:card_number    1234567890
    Input Text    name:cvc    123
    Input Text    name:expiry_month    04
    Input Text    name:expiry_year    2005
    Click Element    id:submit
    Wait Until Page Contains    Congratulations! Your order has been confirmed!
    # Delete account
    Click Element With Text "Delete Account"
    # Account deletion success page
    Wait Until Page Contains    Account Deleted!
    Click Element With Text "Continue"
    # Homepage
    Verify Element With Text "Signup / Login"