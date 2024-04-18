*** Settings ***
Documentation       base page to hold common keywords
Library             SeleniumLibrary
Library             Collections
Resource            ./PO/sort/sort.keywords.robot

*** Variables ***


*** Keywords ***
Launch Application
    # Initialize selenium
    Set Selenium Speed      .2s
    Set Selenium Timeout    10s
    Open Browser    https://practicesoftwaretesting.com/#/    chrome

    # Resize window position
    Maximize Browser Window
    Sleep                       3s
    Wait Until Element Is Visible    ${TOOL_TITLE_SELECTOR}

Teardown
    Close All Browsers

