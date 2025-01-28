*** Settings ***
Library      SeleniumLibrary
Library      DateTime
Library      String
Library    RequestsLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    Collections

Resource    ./utility.robot

*** Keywords ***
Click ${elementType:\w+} with text "${elementText}"
    ${elementType}=    Convert To Lower Case    ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="element"    *     ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="link"    a     ${elementType}
    ${element}=    ${elementType} with text "${elementText}"
    Wait Until Element Is Visible    ${element}    10s
    Click Element    ${element}
    Sleep    2s

Verify ${elementType:\w+} with text "${elementText}"
    ${elementType}=    Convert To Lower Case    ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="element"    *     ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="link"    a     ${elementType}
    ${element}=    ${elementType} with text "${elementText}"
    Wait Until Element Is Visible    ${element}    10s
    Sleep    2s

Get timestamp name with prefix "${prefix}"
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${name}=    Set Variable   ${prefix}_${timestamp}
    RETURN    ${name}