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
Place Order: Login before Checkout
    [Documentation]     User Checkout
    [Tags]      Checkout
    Click Element With Text "Signup / Login"
    Wait Until Page Contains    Login to your account
    # Get user email from create account API
    ${emailcom}=    Create user via api    testname    testemail    Password1!    testfirstname    testlastname    testaddress    Canada    testzipcode    teststate    testcity    123456789
    Input Text    ${LOGINEMAIL_TXT}    ${emailcom}
    Input Text    ${LOGINPASSWORD_TXT}    Password1!
    Click Button With Text "Login"
    # Verify user is logged in
    Wait Until Page Contains    Logged in as testname
    Scroll Element Into View    ${STYLISHDRESS_LABEL}
    # Go to product page and add to cart item
    Click Element    ${BLUETOPVIEW_BTN}
    Wait Until Page Contains    Blue Top
    Wait Until Page Contains    Write Your Review
    Click Button With Text "Add to cart"
    Wait Until Page Contains    Your product has been added to cart.
    # Go to cart
    Click Element With Text "Continue Shopping"
    Click Element With Text "Cart"
    # Verify that cart page is displayed with the correct order and Click Proceed To Checkout
    Wait Until Page Contains    Shopping Cart
    Wait Until Page Contains Element   ${BLUETOP_LABEL}
    Click Element    ${CARTCHECKOUT_BTN}
    #  Verify checkout page is displayed with correct Address Details and Item Order
    Wait Until Page Contains Element    id:address_delivery
    Element Should Contain    ${FIRSTNAMEADDRESS_LABEL}    testfirstname testlastname
    Element Should Contain    ${ADDRESS1_LABEL}    testaddress
    Element Should Contain    ${CITY_LABEL}    testcity teststate testzipcode
    Element Should Contain    ${COUNTRY_LABEL}    Canada
    Element Should Contain    ${MOBILENUM_LABEL}    123456789
    Wait Until Page Contains Element    id:product-1
    Scroll Element Into View    ${SCROLLTOVIEW_LABEL}
    # Click Checkout
    Click Element    ${CARTCHECKOUT_BTN}
    # Enter payment details: Name on Card, Card Number, CVC, Expiration date
    Wait Until Page Contains Element    id:payment-form
    Input Text    name:name_on_card    testfirstname testlastname
    Input Text    name:card_number    1234567890
    Input Text    name:cvc    123
    Input Text    name:expiry_month    04
    Input Text    name:expiry_year    2005
    Click Element    id:submit
    Wait Until Page Contains    Congratulations! Your order has been confirmed!
    Delete account

   # Other possible tests:
    # Searching a product
    # Checking out a product without an account
    # Correct invoice file content
    # Product description
    # Product filters
    # Product reviews
    # Correct subscription email
    # Unsubscribe to email
    # ETC...
