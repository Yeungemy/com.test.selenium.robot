*** Settings ***
Documentation           verify the functionalit of sorting tools
Library                 SeleniumLibrary
Resource                ../../keywords/basePage.keywords.robot
Resource                ../../keywords/utils/toolbox.robot

Suite Setup         Launch Application
Suite Teardown      Teardown

*** Variables ***
${option_list}      Create List

*** Test Cases ***
Verify Dropdown Option List
    ${option_list}=     Extract Options from Dropdown       ${SORT_DROPDOWN_BTN_SELECTOR}
    Log To Console    ${option_list}
    Lists Should Be Equal    ${option_list}    ${SORT_OPTION_NAMES}

