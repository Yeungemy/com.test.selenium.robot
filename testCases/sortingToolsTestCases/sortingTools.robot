*** Settings ***
Documentation           verify the functionalit of sorting tools
Library                 SeleniumLibrary
Resource                ../../keywords/basePage.keywords.robot
Resource                ../../keywords/utils/toolbox.robot

Suite Setup         Launch Application
Suite Teardown      Teardown

*** Variables ***
${option_list}              Create List
${tool_name_list}           Create List
${tool_price_list}          Create List
${sort_option}              ${SORT_OPTION_VALUES}[0]

*** Test Cases ***
Verify Dropdown Option List
    [Tags]      Dropdown
    ${option_list}=         Get List Items    ${SORT_DROPDOWN_BTN_SELECTOR}
    Log To Console    ${option_list}
    List Should Contain Sub List    ${option_list}    ${SORT_OPTION_NAMES}

Verify Soring By Tool Name In ASC Order
    [Tags]      Sorting

    ${tool_name_list}   ${tool_price_list}=     Extract Name and Price Of Each Tool

    Log To Console    ${tool_name_list}
    Sort List    ${tool_name_list}
    ${expected_list}=      Get Slice From List     ${tool_name_list}   0   9
    Log To Console    ${tool_name_list}
    Sorting Tools    ${sort_option}
    Sleep   5s
    ${actual_list}=      Get List of Names By WebElement    ${TOOL_TITLE_SELECTOR}
    Log To Console    ${actual_list}
    Lists Should Be Equal    ${expected_list}    ${actual_list}
    
Verify Soring By Tool Name In DESC Order
    [Tags]      Sorting
    ${expected_list}        Create List
    Reverse List    ${tool_name_list}
    ${expected_list}=      Get Slice From List     ${tool_name_list}   -8
    Log To Console    ${tool_name_list}
    Sorting Tools    ${SORT_OPTION_VALUES}[1]
    Sleep   5s
    ${actual_list}=      Get List of Names By WebElement    ${TOOL_TITLE_SELECTOR}
    Log To Console    ${actual_list}
    Lists Should Be Equal    ${tool_name_list}    ${actual_list}
