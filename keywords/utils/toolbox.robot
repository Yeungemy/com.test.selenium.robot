*** Settings ***
Documentation       This class is hold all common keywords
Library             SeleniumLibrary
Library             Collections
Library    OperatingSystem

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











