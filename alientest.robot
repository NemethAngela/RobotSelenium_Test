*** Settings ***

Library     SeleniumLibrary

*** Variables ***    #létrehozom a változókat
${email}    nemethangelaagnes@ktch.hu
${password}    Almafa12;    #ide azért írtunk pontosvesszőt, mert ez a jelszó neve, amúgy nem kellene
${NAME}    Taiqull                                       
${PLANET}    Yirnors                                   
${POPULATION}    76000000                                  
${NEWPOPULATION}    230000000    
${ATTITUDE}    Patronizing                                   
${LISTNAME}                                //*[@id="id"]/td[1]
${LISTPLANET}                              //*[@id="id"]/td[2]
${LISTPOPULATION}                          //*[@id="id"]/td[3]
${LISTATTITUDE}                            //*[@id="id"]/td[4]
${LISTEDIT}                                //*[@id="id"]/td[5]/a[1]
${LISTDELETE}                              //*[@id="id"]/td[5]/a[3]
${EDITNAME}                                //*[@id="Name"] 
${EDITPLANET}                              //*[@id="Planet"] 
${EDITPOPULATION}                          //*[@id="Population"] 
${EDITATTITUDE}                            //*[@id="Attitude"] 
${EDITSAVE}                                //*[@id="Save"] 
${EDITBACKTOLIST}                          //*[@id="BackToList"] 
${DELETEDELETE}                            //*[@id="Delete"] 
${LOGIN}                                   //*[@id="Login"]     #ide bemásoljuk a path-ot: xpath://
${LOGINEMAIL}                              //*[@id="Input_Email"] 
${LOGINPASSWORD}                           //*[@id="Input_Password"] 
${LOGINBUTTON}                             //*[@id="login-submit"] 
${LOGOUTBUTTON}                            //*[@id="Logout"]/button[1] 
${HELLO}                                   //*[@id="Hello"] 


*** Test Cases ***
elso teszt
    Open Browser    ${URL}    ${BROWSER}      Chrome    options=add_experimental_option("detach", True)
        #https://alienregistry.azurewebsites.net
    Maxime Browser Window    #nagyképernyős módba rakom, ezt fontos, hogy kicsinyítésnél ne  tűnjenek el a menük
    Wait Until Element Is Visible    ${WELCOMETEXT}
    ${item}    Get Text     ${WELCOMETEXT}    #get text-el kiszedem a szöveget, beteszem változóba és összehasonlítom
    Should Contain    ${item}    Welcome

    Register
    Click Element    xpath://html/body/header/nav/div/div/div/ul[2]/li[1]/a    #copy path (weboldal, F12, jobb egérgomb)
    #Sleep 2s
    #Page Should Contain    Register
    Wait Until Element Is Visible /html/body/div/main/h1    2s
    Page Should Contain    Register    #tartalmazze-e a szöveg
    Capture Page Screenshot    register.png    #képernyőfotó készítése

#Verify Registration    # regisztráció ellenőrzése, egyszerre csak az egyiket teszteljük, vagy a regisztrációt vagy a belépést
    #Input Text    xpath://*[@id="Input_Email"]    nemethangelaagnes@ktch.hu
    #Input Text    xpath://*[@id="Password"]    Almafa12;
    #Input Text    xpath://*[@id="Confirm_Password"]    Almafa12;
    #Click Button    id:registerSubmit
    #Click Element    id:confirm-link

Verify Login    # login ellenőrzése
    Click Element    xpath://html/body/header/nav/div/div/div/ul[2]/li[1]/a
    Sleep  1s
    Page Should Contain     Use a local account to log in    #tartalmazze-e a szöveg
    Input Text    xpath://*[@id="Input_Email"]    ${email}
    Input Password    xpath://*[@id="Input_Password"]    ${password}
    Click Button    ${LOGINBUTTON}

    Wait Until Element Is Visible    xpath://html/body/header/nav/div/div/div/ul[2]/li[1]/a
    ${item}    Get Text    ${HELLO}    2s
    Should Contain    ${item}    ${email}
    
Create New Aliens
    Click Element    ${ALIENTEXT}
    Wait Until Element Is Visible     #Alientext megjelenik-e
    Click Element ${CREATENEW}
    Sleep  1s    #két szóköz!!
    Input Text     ${CREATENAME}    ${NAME}
    Input Text     ${CREATEPLANET}    ${PLANET}
    Input Text     ${CREATEPOPULATION}    ${POPULATION}
    Input Text     ${CREATEATTITUDE}    ${ATTITUDE} 
    Click Button    ${CREATECREATE}
    Sleep  1s
    Page Should Contain    ${NAME}    #tartalmazze-e a szöveg

Logout     # kijelentezés az alkalmazásból
    Click Button    ${LOGOUTBUTTON}
     Wait Until Element Is Visible    ${LOGIN}

Close
    Close BROWSER




