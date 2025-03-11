*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Keywords ***
Get User Details
    [Arguments]    ${user_id}
    ${response}=    GET    ${BASE_URL}/users/${user_id}
    [Return]    ${response}

Get User Posts
    [Arguments]    ${user_id}
    ${response}=    GET    ${BASE_URL}/users/${user_id}/posts
    [Return]    ${response}