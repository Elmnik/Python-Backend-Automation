*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    https://jsonplaceholder.typicode.com

*** Test Cases ***
Verify Get User Details
    ${response}=    GET    ${BASE_URL}/users/1
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_json}    name
    Should Be Equal As Strings    ${response_json["name"]}    Leanne Graham

Verify Get User Posts
    ${response}=    GET    ${BASE_URL}/users/1/posts
    Should Be Equal As Strings    ${response.status_code}    200
    ${posts}=    Set Variable    ${response.json()}
    Should Not Be Empty    ${posts}
    FOR    ${post}    IN    @{posts}
        Should Be Equal As Strings    ${post["userId"]}    1
    END

Verify Create New Post
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    userId=1    title=Sample Title    body=Sample Body
    ${response}=    POST    ${BASE_URL}/posts    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    201
    ${response_json}=    Set Variable    ${response.json()}
    Dictionary Should Contain Key    ${response_json}    title
    Should Be Equal As Strings    ${response_json["title"]}    Sample Title

Verify Update Post
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${body}=    Create Dictionary    title=Updated Title    body=Updated Body
    ${response}=    PUT    ${BASE_URL}/posts/1    json=${body}    headers=${headers}
    Should Be Equal As Strings    ${response.status_code}    200
    ${response_json}=    Set Variable    ${response.json()}
    Should Be Equal As Strings    ${response_json["title"]}    Updated Title

Verify Delete Post
    ${response}=    DELETE    ${BASE_URL}/posts/1
    Should Be Equal As Strings    ${response.status_code}    200