@echo off

:: **********************************************************************************************
:: *                              ----- szamkitatalo03.bat -----                                *
:: *                                  =====================                                     *
:: * A program indításakor a felhaszálónak paraméterként meg kell adnia, két 1 és 10 000        *
:: * közötti egész számot, egy minimum és egy maximum értéket.                                  *
:: * A számok közti külöbség 1000-nél kisebb nem lehet (a maximum értékének az 1 001 - 10 000   *
:: * tartományba kell esnie).                                                                   *
:: * A minimum és maximum értékek megadásának sorrendje tetszőleges. A program a kisebb értéket *
:: * minimumnak, a nagyobbikat maximumnak választja.                                            *
:: * A felhasználó tetszőlegesen kiválaszthat egy egész számot az általa megadott intervallumon *
:: * belül. A program pedig kitalálja a választott számot.                                      *
:: * A játék menete a lastgame.txt fájlba szöveges formában mentésre kerül.                     *
:: *                                                                                            *
:: * -----------------------------------------------------------                                *
:: *  Példa a program indítására : szamkitalalo03.bat 1437 3682                                 *
:: **********************************************************************************************

rem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
rem ! A program futtatásához szükséges fájlok : !
rem ! 1. hianyzoprm03.txt                       !
rem ! 1. fejlec03.txt                           !
rem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

:: ---------------------------------
:: --- példa a bináris keresésre ---
:: ---------------------------------

set hibavan=false

if "%1"=="" (
    set hibavan=true
)

if [%2] EQU [] (
    set hibavan=true
)

if hibavan==true (
    type hianyzoprm03.txt
    goto prgVege
)

if %1 GTR %2 (
    set max=%1
    set min=%2
) else (
    set min=%1
    set max=%2
)

set outpfile="lastgame03.txt"

cls

type fejlec03.txt
echo A megadott intervallum : %min%-%max%.

type fejlec03.txt >%outpfile%
echo A megadott intervallum : %min%-%max%. >>%outpfile%

set tippszamlalo=1

:ciklusEleje

    if %max% LSS %min% (
        goto ciklusVege
    )

    set /a aktErtek=(%min% + %max%) /2

    :valasztUjbol
    
        echo ==============================
        echo min = %min%
        echo max = %max%
        echo ------------

        echo %tippszamlalo%. tipp
        echo Az aktualis tippem : %aktErtek%
        set /p valaszKar=A gondolt szam Kisebb, Nagyobb vagy Egyenlo ? (k/n/e)

        echo ============================== >>%outpfile%
        echo min = %min% >>%outpfile%
        echo max = %max% >>%outpfile%
        echo ------------ >>%outpfile%

        echo %tippszamlalo%. tipp >>%outpfile%
        echo Az aktualis tippem : %aktErtek% >>%outpfile%
        echo A gondolt szam Kisebb, Nagyobb vagy Egyenlo ? (k/n/e) %valaszKar% >>%outpfile%
        
        if %valaszKar%==k (
            goto kisebb
        ) else (
            if %valaszKar%==n (
                goto nagyobb   
            ) else (
                if %valaszKar%==e (
                    goto egyenlo
                ) else (
                    goto valasztUjbol
                )
            )
        )
    
        :kisebb
            set /a max=%aktErtek% - 1

            goto valaszOK

        :nagyobb
            set /a min=%aktErtek% + 1

            goto valaszOK

        :egyenlo
            goto ciklusVege

    :valaszOK
        set /a tippszamlalo=%tippszamlalo% + 1
        goto ciklusEleje

:ciklusVege

echo ==============================
echo min = %min%
echo max = %max%
echo ------------

echo ============================== >>%outpfile%
echo min = %min% >>%outpfile%
echo max = %max% >>%outpfile%
echo ------------ >>%outpfile%

if %max% LSS %min% (
    echo Fullentettel a valszadas soran.
    echo Fullentettel a valszadas soran. >>%outpfile%

) else (
    echo Koszonom a jatekot.
    echo Koszonom a jatekot. >>%outpfile%
)

:prgVege