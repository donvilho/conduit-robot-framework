* Settings *
Library     Browser

* Variables *
${SERVER}               vm3212.kaj.pouta.csc.fi
${HOME_URL}             https://${SERVER}/
${LOGIN_URL}            https://${SERVER}/login
${REGISTER_URL}         https://${SERVER}/register

${valid-username}       kauttaja
${valid-password}       testi
${valid-email}          testi1@testi.fi
${invalid-password}     invalid
${invalid-email}        invalid@email.fi
${empty}

* Keywords *

Open Browser To Homepage
    open browser    ${HOME_URL}
    get text        a.navbar-brand  ==  conduit

Go To Login Page
    Go to           ${LOGIN_URL}
    get text        button.btn-primary  ==  Sign in

Go To Register Page
    Go to           ${REGISTER_URL}
    get text        button.btn-primary  ==  Sign up

Input Username
    [Arguments]     ${username}
    type text       css=[placeholder="Username"]    ${username}

Input Email
    [Arguments]     ${email}
    type text       css=[placeholder="Email"]       ${email}

Input Password
    [Arguments]     ${password}
    type text       css=[placeholder="Password"]    ${password}

Submit
    click           css=[type="submit"]

Invalid Email Or Password
    get element     css=[class="error-messages"]

Invalid-blank-email
    get text        css=[class="error-messages"]    *=  email
    get text        css=[class="error-messages"]    *=  blank

Invalid-blank-password
    get text        css=[class="error-messages"]    *=  password
    get text        css=[class="error-messages"]    *=  blank

Valid Login
    get element        css=[class="ion-gear-a"]