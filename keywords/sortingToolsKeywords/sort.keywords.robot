*** Settings ***
Documentation       This test suite is to verify sorting tools functionality
Library             SeleniumLibrary
Library             Collections

*** Variables ***
${TOOL_TITLE_SELECTOR}                          css=.card-title
${SORT_DROPDOWN_BTN_SELECTOR}                   css:[data-test="sort"]
${DROPDOWN_LIST_OPTION_SELECTOR}                css=option
${PAGE_LINK_SELECTOR}                           css=.pagination .page-link
${TOOL_PRICE_SELECTOR}                          css=[data-test="product-price"]
@{SORT_OPTION_VALUES}                           name,asc    name,desc    Price (High - Low)    Price (Low - High)
@{SORT_OPTION_NAMES}                            Name (A - Z)    Name (Z - A)    Price (High - Low)      Price (Low - High)
@{tool_list}                                    Create List

*** Keywords ***
Open Sort Dropdown List
   Click Element    ${SORT_DROPDOWN_BTN_SELECTOR}

Sorting Tools
    [Arguments]     ${sort_option}
    Select From List By Value    ${SORT_DROPDOWN_BTN_SELECTOR}      ${sort_option}
    Wait Until Element Is Visible    ${TOOL_TITLE_SELECTOR}

Extract Names Of All Tools
    ${all_tools}    Create List
    ${all_pages}=   Get WebElements    ${PAGE_LINK_SELECTOR}
    ${len}=   Get Length    ${all_pages}
    FOR    ${index}    IN RANGE     1   ${len}-1
        Click Element    ${all_pages}[${index}]
        Sleep    5s
        ${webElements}=     Get WebElements    ${TOOL_TITLE_SELECTOR}
            FOR    ${element}    IN    @{webElements}
                ${option_text} =    Get Text    ${element}
                Run Keyword If    '${option_text}' !=''    Append To List      ${all_tools}      ${option_text}
            END
    END
    [Return]    ${all_tools}

Extract Prices Of All Tools
    ${all_tools}    Create List
    ${all_pages}=   Get WebElements    ${PAGE_LINK_SELECTOR}
    ${len}=   Get Length    ${all_pages}
    FOR    ${index}    IN RANGE     1   ${len}-1
        Click Element    ${all_pages}[${index}]
        ${webElements}=     Get WebElements    ${TOOL_PRICE_SELECTOR}
            FOR    ${element}    IN    @{webElements}
                ${option_text} =    Get Text    ${element}
                Run Keyword If    '${option_text}' !=''    Append To List      ${all_tools}      ${option_text}
            END
    END
    [Return]    ${all_tools}
