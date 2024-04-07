*** Settings ***
Documentation       This test suite is to verify sorting tools functionality
Library             SeleniumLibrary
Library             Collections
Resource            ../keywords/sort.keywords.robot
Resource            ../keywords/utils/toolbox.robot

Suite Setup         Set Base Url
Suite Teardown      Teardown

*** Test Cases ***
Verify Dropdown Options
    ${options_list}     Extract Options from Dropdown    ${SORT_DROPDOWN_FIELD}
    Lists Should Be Equal    ${options_list}   ${SORT_OPTION_NAMES}   //@{SORT_OPTION_NAMES} string like will get error here, must use ${SORT_OPTION_NAMES}

Sort tools by name in ASCE
   [Documentation]    Sort tools by name in ascending order and verify
   ${expect_list}=     Extract List of Tool Names
#   ${expect_list}=     Sort List in A-Z Order    ${expect_list}
   Open Dropdown List  ${SORT_DROPDOWN_FIELD}
   ${option}=   Set Variable    ${SORT_OPTION_VALUES}[0]
   Select Sort Option from Dropdwon List   ${option}
   Wait Until Element Is Visible    ${TOOL_TITLE}

   ${actual_list}=     Extract List of Tool Names
   Lists Should Be Equal    ${expect_list}    ${actual_list}

