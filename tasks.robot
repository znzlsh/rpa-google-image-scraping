# ## Google Image Search Example
# This simple robot will execute a Google Image Search and save the result image.

*** Settings ***
Documentation     Executes Google image search and stores the first result image.
Library           RPA.Browser.Selenium
Library    Collections

*** Variables ***
${GOOGLE_URL}     https://google.com/
${SEARCH_TERM}    %{SEARCH_TEXT}
${IMG_CNT}        %{IMG_CNT}

*** Keywords ***
Accept Google Consent
    Click Element    xpath://button/div[contains(text(), 'I agree')]

*** Keywords ***
Open Google search page
    Open Available Browser    ${GOOGLE_URL}
    Run Keyword And Ignore Error    Accept Google Consent

*** Keywords ***
Search for
    [Arguments]    ${text}
    Input Text    name:q    ${text}
    Press Keys    name:q    ENTER
    Wait Until Page Contains Element    search

*** Keywords ***
View image search results
    Click Link    이미지

*** Keywords ***
Screenshot Loop
    FOR    ${i}    IN RANGE   ${IMG_CNT}
        ${count}=     Get Element Count    css:div[data-ri="${i}"] a[class="wXeWr islib nfEiy"]
        Run Keyword If    ${count} > 0
        ...    Capture Element Screenshot    css:div[data-ri="${i}"] a[class="wXeWr islib nfEiy"]     image\\image-${i}.png
    END

*** Tasks ***
Execute Google image search and store the first result image
    Open Google search page
    Search for    ${SEARCH_TERM}
    View image search results
    Screenshot Loop
    [Teardown]    Close Browser
