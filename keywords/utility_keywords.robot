*** Settings ***
Library      SeleniumLibrary
Library      DateTime
Library      String
Library    RequestsLibrary
Library    OperatingSystem
Library    JSONLibrary
Library    Collections

*** Keywords ***
${elementType:\w+} with text "${elementText}"
    ${elementType}=    Convert To Lower Case    ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="element"    *     ${elementType}
    ${elementType}=    Set Variable If    "${elementType}"=="link"    a     ${elementType}

    IF  "${elementType}"=="tab"
       ${xpath}=    Set Variable    xpath=//*[@role='tab' and normalize-space()='${elementText}']
    ELSE
        ${xpath}=    Set Variable    xpath=//${elementType}\[normalize-space()="${elementText}"]
    END
    RETURN    ${xpath}
    
# Use to make a unique name using a timestamp with a user defined prefix
Get timestamp name with prefix "${prefix}"
    ${timestamp}=    Get Current Date    result_format=%Y%m%d%H%M%S
    ${name}=    Set Variable   ${prefix}_${timestamp}
    RETURN    ${name}
    
