* Settings *

Suite Setup       Open Browser To Homepage
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login Should Fail
Resource          resource.robot


* Test Cases *                          Email               Password
Empty Email and Empty Password          ${empty}            ${empty}
Empty Email and Invalid Password        ${empty}            ${invalid-password}
Empty Email and Valid Password          ${empty}            ${valid-password}

Valid Email and Empty Password          ${valid-email}      ${empty}
Valid Email and Invalid Password        ${valid-email}      ${invalid-password}

Invalid Email and Empty Password        ${invalid-email}    ${empty}
Invalid Email and Invalid Password      ${invalid-email}    ${invalid-password}
Invalid Email and Valid Password        ${invalid-email}    ${valid-password}


* Keywords * 

Login Should Fail
    [Arguments]     ${email}     ${password}
    Input Email     ${email}
    Input Password  ${password}
    Submit
    Invalid Email Or Password


