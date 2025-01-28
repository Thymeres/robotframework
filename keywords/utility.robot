*** Settings ***
Library    String

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