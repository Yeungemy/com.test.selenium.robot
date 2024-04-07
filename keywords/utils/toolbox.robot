*** Settings ***
Documentation       This class is hold all common keywords
Library             SeleniumLibrary
Library             Collections
Library    OperatingSystem
Library    String

*** Variables ***


*** Keywords ***
Get List of Names By WebElement
    [Arguments]     ${webElement}
    ${option_names}     Create List
    ${webElements}=     Get WebElements    ${webElement}
    FOR    ${element}    IN    @{webElements}
        ${option_text} =    Get Text    ${element}
        Run Keyword If    '${option_text}' !=''    Append To List      ${option_names}      ${option_text}
    END
    [Return]    ${option_names}

Convert To Numbers
    [Arguments]     ${list}
    ${number_list}      Create List
    FOR    ${element}    IN    @{LIST}
        ${number}=      Convert Dollar Value To Number    ${element}
        Append To List    ${number_list}    ${number}
    END
    [Return]    ${number_list}

Convert Dollar Value To Number
    [Arguments]     ${dollar_value}
    ${number}=      Convert To Number    ${dollar_value[1:]}
    [Return]    ${number}











