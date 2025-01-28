*** Settings ***
Library      SeleniumLibrary
Library      DateTime
Library      String
Library    RequestsLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    Collections

Resource    ./utility_keywords.robot

*** Keywords ***
# Use to verify an element with a specific text. (Uses normalize-space)
Verify ${elementType:\w+} with text "${elementText}"
    ${elementType}=    Convert To Lower Case    ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="element"    *     ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="link"    a     ${elementType}
    ${element}=    ${elementType} with text "${elementText}"
    Wait Until Element Is Visible    ${element}    10s
    Sleep    2s
