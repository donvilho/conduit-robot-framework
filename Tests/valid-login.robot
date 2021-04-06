* Settings *
Documentation
...     Testissä kokeillaa että käyttäjä pystyy kirjautumaan validilla emaililla ja salasanalla
...     sekä mikäli käyttäjä kirjoittaa emailin väärin mutta oikean salasanan.
...     Test Setupissa navigoidaan kirjautumissivulle klikkaamalla sivun painiketta jotta voidaan varmistaa
...     että linkitys toimii, mutta itse testissä välilehdet avataan suoraan urlilla.



Suite Setup       Open Browser To Homepage
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login Should Succeed
Resource          resource.robot


* Test Cases *                                              Email               Password

Valid Email and Valid Password                              ${valid-email}      ${valid-password}
Typo 1 Email and Valid Password -SHOULD FAIL                testi1@testifi      ${valid-password}
Typo 2 Email and Valid Password -SHOULD FAIL                testi1!testi.fi     ${valid-password}
Typo 3 Email and Valid Password -SHOULD FAIL                testi1#testi.fi     ${valid-password}

* Keywords *

Login Should Succeed
    [Arguments]     ${email}     ${password}
    New Context
    New Page                                ${LOGIN_URL}
    Get Element State                       css=[id="login-button"]   visible   ==   True
    Run Keyword And Continue On Failure     Login-Attempt   ${email}     ${password}
