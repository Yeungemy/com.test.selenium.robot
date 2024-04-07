*** Settings ***
Documentation       This test suite is to verify sorting tools functionality
Library             SeleniumLibrary
Library             Collections
Resource    ../basePage.keywords.robot

*** Variables ***
${TOOL_TITLE_SELECTOR}                          css=.card-title


*** Keywords ***