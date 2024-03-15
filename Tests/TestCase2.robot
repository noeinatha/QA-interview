*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://nocnoc.com/pl/All?area=search&st=
${BROWSER}    Chrome
${SearchTerm}    เครื่องทำน้ำอุ่น
${ProductList}    xpath://div[@class='product-search-listing']/div[@class='product-content tw-overflow-hidden']/div[@class='sort-section-container']/p[contains(text(), '/แสดงผลลัพธ์\s\d+-\d+\sจาก\s\d+/gm')]

*** Test Cases ***
Filter with 1 filter of 1 field
    ${full_url}=    Set Variable    ${URL}${SearchTerm}
    Set Selenium Timeout    10 seconds
    Open Browser    ${full_url}    ${BROWSER}
    Maximize Browser Window

    # Wait for 60 sec to check why ${ProductList} is not shown
    Wait Until Page Contains  แสดงผลลัพธ์ 1-50 จาก 1332    60 sec
    # found "Request for the Private Access Token challenge"

    Wait Until Page Contains Element    ${ProductList}
    ${filter_sidebar}=    Get Text    xpath://p[@class='filter-head tw-typography-label-1']
    Should Be Equal As Strings    ${filter_sidebar}    ฟิลเตอร์
    [Teardown]    Close Browser