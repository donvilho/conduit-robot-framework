* Settings *
Documentation
...     Testissä kokeillaan eri kirjautumisen tekstikenttä variaatioita
...     mukana on myös yksi onnistunut kirjautuminen jonka pitää failata.
...     Test Setupissa navigoidaan kirjautumissivulle klikkaamalla sivun painiketta jotta voidaan varmistaa
...     että linkitys toimii, mutta itse testissä välilehdet avataan suoraan urlilla. 


Suite Setup       Open Browser To Homepage
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login Should Fail
Resource          resource.robot


* Test Cases *                                      Email               Password
Empty Email And Empty Password                      ""                  ""
Empty Email And Invalid Password                    ""                  ${invalid-password}
Empty Email And Valid Password                      ""                  ${valid-password}
Valid Email And Empty Password                      ${valid-email}      ""
Valid Email And Invalid Password                    ${valid-email}      ${invalid-password}
Valid Email And Valid Password - SHOULD FAIL        ${valid-email}      ${valid-password}
Invalid Email And Empty Password                    ${invalid-email}    ""
Invalid Email And Invalid Password                  ${invalid-email}    ${invalid-password}
Invalid Email And Valid Password                    ${invalid-email}    ${valid-password}




* Keywords * 

Login Should Fail
    [Arguments]     ${email}     ${password}
    New Context
    New Page                        ${LOGIN_URL}
    Get Element State               css=[id="login-button"]   visible   ==   True
    Run Keyword And Expect Error    *visible*navbar-logged-user*False*   Login-Attempt   ${email}     ${password}