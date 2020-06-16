@echo off

:: *************************************************************
:: *               ----- szamkitatalo02.bat -----              *
:: * A felhaszáló gondolhat egy 1 és 1024 közé eső számot és a *
:: * program max. 10 tippeléseel kitalálja azt. A játék mene-  *
:: * te a lastgame02.txt fájlba szöveges formában mentésre ke- *
:: * rül.                                                      *
:: *************************************************************

rem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
rem ! a program futtatásához szükséges a fejlec02.txt fajl !
rem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

:: ---------------------------------
:: --- példa a bináris keresésre ---
:: ---------------------------------

set outpfile="lastgame02.txt"

cls

type fejlec02.txt

type fejlec02.txt >%outpfile%

set min=1
set max=1024

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
