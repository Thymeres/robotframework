*** Settings ***
Library      SeleniumLibrary
Library      DateTime
Library      String
Library    RequestsLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    Collections

Resource    ./utility_keywords.robot

*** Variables ***
${BASE_URL}=    https://automationexercise.com

*** Keywords ***
Create user via api
    [Arguments]    ${name}    ${email}    ${password}    ${firstname}    ${lastname}    ${address1}    ${country}    ${zipcode}    ${state}    ${city}    ${mobile_number}
    ${url}=    Set Variable    /api/createAccount
    ${timestamp_email}=    Get timestamp name with prefix "email"
    ${email_com}=    Set Variable    ${timestamp_email}@email.com
    Log To Console        ${email_com}
    ${headers}=    Create Dictionary    api-token=""
    # User Details with unique email (needs to be filled out in the actual test case)
    ${body}=    Evaluate    {"name" : (None, "${name}"), "email" : (None, "${emailcom}"), "password": (None, "${password}"), "firstname": (None, "${firstname}"),"lastname": (None, "${lastname}"), "address1": (None, "${address1}"), "country": (None, "${country}"), "zipcode": (None, "${zipcode}"), "state": (None, "${state}"), "city": (None, "${city}"), "mobile_number": (None, "${mobile_number}")}

    Create Session    user_create_session    ${BASE_URL}
    ${request}=    POST On Session    user_create_session    ${url}    headers=${headers}    files=${body}
    ${json_response}=    Convert String To Json    ${request.content}
    Log To Console    ${request.content}
    Log To Console    ${json_response}
    # Verify response code
    Should Be Equal As Numbers    ${json_response['responseCode']}    201    Failed to create user
    Log To Console    ${email_com}

    RETURN    ${email_com}
