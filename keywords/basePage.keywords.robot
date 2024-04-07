*** Settings ***
Documentation       base page to hold common keywords
Library             SeleniumLibrary
Library             Collections
Resource            ./sortingToolsKeywords/sort.keywords.robot

*** Variables ***


*** Keywords ***
Launch Application
    Open Browser    https://practicesoftwaretesting.com/#/    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${TOOL_TITLE_SELECTOR}

Teardown
    Close Browser
