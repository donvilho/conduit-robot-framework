* Settings *
Test Setup      Open-homepage
Resource        resource.robot

* Variables * 

${valid-username}       kauttaja
${valid-password}       testi
${valid-email}          testi1@testi.fi
${invalid-password}     itset
${invalid-email}        aasdfe@asdfase.fi


* Test Cases * 
Goto login page
    Goto-login-page

Blank email
    Goto-login-page
    Input-password  ${valid-password}
    Submit-login
    Invalid-blank-email

Blank password
    Goto-login-page
    Input-email  ${valid-email}
    Submit-login
    Invalid-blank-password

Invalid email or password
    Goto-login-page
    Input-email  ${invalid-email}
    Input-password  ${invalid-password}
    Submit-login
    Invalid-email-or-password

Succesfull login
    Goto-login-page
    Input-email  ${valid-email}
    Input-password  ${valid-password}
    Submit-login
    Valid-login  ${valid-username}

Logout 
    Succesfull_login
