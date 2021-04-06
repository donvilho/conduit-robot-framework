* Settings *
Suite Setup       Login And Post
Suite Teardown    Close Browser
Test Setup        Go To Post Page
Test Template     Fill Post Form
Resource          resource.robot

*** Test Cases ***          title-len   about-len   text-len    tags
Empty Post                  0           0           0           0
Post Lenght 10              10          10          10          10
Post Lenght 100             100         100         100         100
Post Lenght 1000            1000        1000        1000        1000


*** Keywords ***

Login And Post
    Open Browser To Homepage
    Go To Login Page
    Login Should Success  testi1@testi.fi  testi

Fill Post Form
    [Arguments]     ${title-len}    ${about-len}    ${text-len}     ${tags-len}
    ${title} =    Generate Random String  ${title-len}
    Input Article Title  ${title}

    ${about} =    Generate Random String  ${about-len}
    Input About Text  ${about}

    ${text} =    Generate Random String  ${text-len}
    Input Post Text  ${text}

    ${tags} =    Generate Random String  ${tags-len}
    Input Tags  ${tags}

    Submit Post
    get text        css=div.container > h1     ==          ${title}

Input Article Title
    [Arguments]     ${context}
    type text       css=[placeholder*="Article Title"]               ${context}

Input About Text
    [Arguments]     ${context}
    type text       css=[placeholder*="What"]                       ${context}

Input Post Text
    [Arguments]     ${context}
    type text       css=[placeholder*="Write your"]                  ${context}

Input Tags
    [Arguments]     ${context}
    type text       css=[placeholder*="Enter tags"]                  ${context}


Submit Post
    click           text="Publish Article"   # ok
    #click            fieldset > button.btn-primary  #ok