*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Scroll Through The Page
    Execute JavaScript                          window.scrollTo(0, 600)
