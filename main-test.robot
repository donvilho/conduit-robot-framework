* Settings *
Resource        settings.txt

* Test Cases * 

Invalid-login-email-blank
    Goto-login-page
    Submit-login
    Invalid-blank-email

Invalid-login-password-blank
    Goto-login-page
    Input-email  testi@testi.fi
    Submit-login
    Invalid-blank-password