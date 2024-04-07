*** Settings ***
Documentation       This test suite is to verify sorting tools functionality
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${TOOL_TITLE_SELECTOR}               css=.card-title
${SORT_DROPDOWN_BTN_SELECTOR}      css:[data-test="sort"]
${DROPDOWN_LIST_OPTION_SELECTOR}                 css=option
@{SORT_OPTION_VALUES}       name,asc    name,desc    Price (High - Low)    Price (Low - High)
@{SORT_OPTION_NAMES}        Name (A - Z)    Name (Z - A)    Price (High - Low)      Price (Low - High)
@{tool_list}                Create List

*** Keywords ***
Click Sort Dropdown Field
   Click Element    ${SORT_DROPDOWN_BTN_SELECTOR}

Select Sort Option from Dropdwon List
   [Arguments]      ${orderOption}
   Click Element    css:option[value="${orderOption}"]

Extract List of Tool Names
   ${name_elements}=    Get WebElements    ${TOOL_TITLE_SELECTOR}
   ${tool_list}=   Create List

   FOR    ${element}    IN    @{name_elements}
       Append To List    ${tool_list}    ${element.text}
   END

   [Return]    ${tool_list}

Sort List in A-Z Order
    [Arguments]     ${tool_list}
    ${sorted_list}=     Sort List    ${tool_list}
    [Return]    ${sorted_list}