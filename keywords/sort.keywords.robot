*** Settings ***
Documentation       This test suite is to verify sorting tools functionality
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${TOOL_TITLE}               css=.card-title
${SORT_DROPDOWN_FIELD}      css:[data-test="sort"]
${OPTIONS}                  css=option
@{SORT_OPTION_VALUES}       name,asc    name,desc    Price (High - Low)    Price (Low - High)
@{SORT_OPTION_NAMES}        Name (A - Z)    Name (Z - A)    Price (High - Low)      Price (Low - High)
@{tool_list}                Create List

*** Keywords ***
Set Base Url
    Open Browser    https://practicesoftwaretesting.com/#/    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${TOOL_TITLE}

Click Sort Dropdown Field
   Click Element    ${SORT_DROPDOWN_FIELD}

Select Sort Option from Dropdwon List
   [Arguments]      ${orderOption}
   Click Element    css:option[value="${orderOption}"]

Extract List of Tool Names
   ${name_elements}=    Get WebElements    ${TOOL_TITLE}
   ${tool_list}=   Create List

   FOR    ${element}    IN    @{name_elements}
       Append To List    ${tool_list}    ${element.text}
   END

   [Return]    ${tool_list}

Sort List in A-Z Order
    [Arguments]     ${tool_list}
    ${sorted_list}=     Sort List    ${tool_list}
    [Return]    ${sorted_list}

Teardown
    Close Browser