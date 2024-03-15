*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${URL}    https://nocnoc.com/pl/All
${Expected_Text}    แสดงสินค้า 1-48 จาก (\d+)

*** Test Cases ***
Get Text from URL and Compare
    Open Browser    ${URL}    chrome
    Wait Until Page Contains Element    xpath://div[@class='sort-section-container']//p[@class='product-count-desc-desktop tw-typography-caption-4']
    ${actual_text}=    Get Text    xpath://div[@class='sort-section-container']//p[@class='product-count-desc-desktop tw-typography-caption-4']
    ${variable}=    Get Regexp Matches    ${actual_text}    ${Expected_Text}
    Log    ${variable} 
    Close Browser