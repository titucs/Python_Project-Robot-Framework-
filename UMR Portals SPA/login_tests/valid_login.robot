*** Settings ***
Documentation     This is a test suite with a single test for valid login... Titu
Resource          resource.robot

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username    33
    Input Password    33
    Submit Credentials
    Wait Until Element Is Visible    class=navbar-brand
    Welcome Page Should Be Open
    [Teardown]    Close Browser
