*** Settings ***
Documentation       This test suite is to verify sorting tools functionality
Library             SeleniumLibrary
Library             Collections
Resource            ../../basePage.keywords.robot

*** Variables ***
${TOOL_TITLE_SELECTOR}                          css=.card-title
${SORT_DROPDOWN_BTN_SELECTOR}                   css:[data-test="sort"]
${DROPDOWN_LIST_OPTION_SELECTOR}                css=option
${PAGE_LINK_SELECTOR}                           css=.pagination .page-link
${TOOL_PRICE_SELECTOR}                          css=[data-test="product-price"]
@{SORT_OPTION_VALUES}                           name,asc    name,desc    price,desc    price,asc
@{SORT_OPTION_NAMES}                            Name (A - Z)    Name (Z - A)    Price (High - Low)      Price (Low - High)
@{tool_list}                                    Create List

*** Keywords ***
Open Sort Dropdown List
   Click Element    ${SORT_DROPDOWN_BTN_SELECTOR}

Sorting Tools
    [Arguments]     ${sort_option}
    Select From List By Value    ${SORT_DROPDOWN_BTN_SELECTOR}      ${sort_option}
    Sleep    5s

Extract Name and Price Of Each Tool
    ${tool_name_list}    Create List
    ${tool_price_list}    Create List
    ${all_pages}=   Get WebElements    ${PAGE_LINK_SELECTOR}
    ${len}=   Get Length    ${all_pages}
    FOR    ${index}    IN RANGE     1   ${len}-1
        Click Element    ${all_pages}[${index}]
        Sleep    5s
        ${tool_name_selectors}=     Get WebElements    ${TOOL_TITLE_SELECTOR}
        ${tool_price_selectors}=     Get WebElements    ${TOOL_PRICE_SELECTOR}
        ${number_of_tools}=     Get Length    ${tool_name_selectors}
        FOR    ${index}     IN RANGE    0   ${number_of_tools}
            ${tool_name} =    Get Text    ${tool_name_selectors}[${index}]
            ${tool_price} =    Get Text    ${tool_price_selectors}[${index}]
            Run Keyword If    '${tool_name}' !=''    Append To List      ${tool_name_list}      ${tool_name}
            Run Keyword If    '${tool_price}' !=''    Append To List      ${tool_price_list}      ${tool_price}
        END
    END
    [Return]    ${tool_name_list}   ${tool_price_list}

