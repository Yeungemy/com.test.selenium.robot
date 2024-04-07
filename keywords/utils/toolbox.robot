*** Settings ***
Documentation       This class is hold all common keywords
Library             SeleniumLibrary
Library             Collections
Library    OperatingSystem

*** Variables ***


*** Keywords ***
Select Option From Dropdown
    [Arguments]     ${dropdown_btn_element}     ${option_name}
    Select From List By Value    ${dropdown_btn_element}    ${option_name}
    
Open Dropdown List 
    [Arguments]     ${dropdown_btn}
    Click Element    ${dropdown_btn}

Get List of Names By WebElements
    [Arguments]     ${option_list}
    ${option_names}     Create List
    FOR    ${element}    IN    @{option_list}
        ${option_text} =    Get Text    ${element}
        Run Keyword If    '${option_text}' !=''    Append To List      ${option_names}      ${option_text}
    END

    [Return]    ${option_names}











