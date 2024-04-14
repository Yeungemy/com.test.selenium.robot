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
    Set Window Position         x=341   y=169
    Set Window Size             width=1935  height=1090
    Maximize Browser Window
    Sleep                       3s
    Wait Until Element Is Visible    ${TOOL_TITLE_SELECTOR}

Teardown
    Close Browser
