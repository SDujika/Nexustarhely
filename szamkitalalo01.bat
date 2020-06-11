@echo off

:: *************************************************************
:: *               ----- szamkitatalo01.bat -----              *
:: * a felhaszáló gondolhat egy 1 és 1024 közé eső számot és a *
:: * program max. 10 tippeléseel kitalálja azt                 *
:: *************************************************************

rem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
rem ! a program futtatásához szükséges a fejlec.txt fajl !
rem !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

:: --- példa bináris keresésre ---

cls

type fejlec.txt

set /a min=1
set /a max=1024

set /a tippszamlalo=1

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

if %max% LSS %min% (
    echo Fullentettel a valszadas soran.
) else (
    echo Koszonom a jatekot.
)
