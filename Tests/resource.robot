* Settings *
Library           Browser
Library           String
Library           BuiltIn

* Variables *
${SERVER}               -------
${HOME_URL}             https://${SERVER}/
${LOGIN_URL}            https://${SERVER}/login
${REGISTER_URL}         https://${SERVER}/register
${POST_URL}             https://${SERVER}/editor
${SETTINGS_URL}         https://${SERVER}/settings

${valid-username}       kauttaja
${valid-password}       testi
${valid-email}          testi1@testi.fi
${invalid-password}     invalid
${invalid-email}        invalid@email.fi


* Keywords *

Open Browser To Homepage
    #lopettaa typerien screeshottien ottamisen
    Register Keyword To Run On Failure  None
    New Page                            ${HOME_URL}
    Get Element State                   css=[class="home-page"]   visible   ==   True

Go To Login Page
    Click               css=[id="navbar-login"]
    Get Element State   css=[id="login-button"]   visible   ==   True

Go To Register Page
    Click               css=[id="navbar-register"]
    Get Element State   css=[id="register-button"]   visible   ==   True

Go To Post Page
    Go to           ${POST_URL}
    Get Element State   css=[id="article-publish"]   visible   ==   True



# Oletuksena on että kirjautuminen onnistuu, muuten palauttaa false
# New Context ja New Page luo uuden incognito välilehden jotta kirjautuminen tapahtuu per välilehti

Login-Attempt
    [Arguments]                     ${email}    ${password}
    Type Text                       css=[id="login-email-field"]        ${email}
    Type Text                       css=[id="login-password-field"]     ${password}
    Click                           css=[id="login-button"]
    Wait Until Network Is Idle
    Get Element State               css=[id="navbar-logged-user"]     visible   ==   True
 
