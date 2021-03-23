* Settings *

Suite Setup       Open Browser To Homepage
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login Should Success
Resource          resource.robot


* Test Cases *                          Email               Password
Valid Email and Valid Password          ${valid-email}      ${valid-password}

* Keywords * 

Login Should Success
    [Arguments]     ${email}     ${password}
    Input Email     ${email}
    Input Password  ${password}
    Submit
    Valid Login
