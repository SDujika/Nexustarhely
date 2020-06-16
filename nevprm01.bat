@echo off

set %1
set %2

cls

if NOT DEFINED min (
    echo Minimum nincs megadva !
    goto prgVege
)

if NOT DEFINED max (
    echo Maximum nincs megadva !
    goto prgVege
)

echo min = %min%
echo max = %max%

:prgVege
