* Settings *
Library     Browser

* Variables *
${SERVER}           vm3212.kaj.pouta.csc.fi
${HOME_URL}         https://${SERVER}/
${LOGIN_URL}        https://${SERVER}/login
${REGISTER_URL}     https://${SERVER}/register

* Keywords *

Open-homepage
    new page    ${HOME_URL}
    get text        a.navbar-brand  ==  conduit

Goto-login-page
    Go to           ${LOGIN_URL}
    get text        button.btn-primary  ==  Sign in

Goto-register-page
    Go to           ${REGISTER_URL}
    get text        button.btn-primary  ==  Sign up

Input-username
    [Arguments]     ${username}
    type text       css=[placeholder="Username"]    ${username}

Input-email
    [Arguments]     ${email}
    type text       css=[placeholder="Email"]       ${email}

Input-password
    [Arguments]     ${password}
    type text       css=[placeholder="Password"]    ${password}

Submit-login
    click           css=[type="submit"]

Invalid-email-or-password
    get text        css=[class="error-messages"]    *=  invalid

Invalid-blank-email
    get text        css=[class="error-messages"]    *=  email
    get text        css=[class="error-messages"]    *=  blank

Invalid-blank-password
    get text        css=[class="error-messages"]    *=  password
    get text        css=[class="error-messages"]    *=  blank

Valid-login
    [Arguments]     ${username}
    get text        css=[href="/@${username}"]    ==  ${username}
