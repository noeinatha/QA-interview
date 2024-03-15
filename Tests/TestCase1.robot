*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://nocnoc.com/pl/All?area=search&st=
${BROWSER}    Chrome
${SearchTerm}    เครื่องทำน้ำอุ่น
${Header}    รายการสินค้า: "${SearchTerm}"
${LocationHeader}    xpath://div[@class='top-section-pl-title']/h1[contains(text(), '${Header}')]

*** Test Cases ***
Open URL and Verify Header
    ${full_url}=    Set Variable    ${URL}${SearchTerm}
    Open Browser    ${full_url}    ${BROWSER}
    Maximize Browser Window

    Wait Until Page Contains Element    ${LocationHeader}
    ${actual_header}=    Get Text    xpath://div[@class='top-section-pl-title']/h1
    Should Be Equal As Strings    ${actual_header}    ${Header}
    [Teardown]    Close Browser