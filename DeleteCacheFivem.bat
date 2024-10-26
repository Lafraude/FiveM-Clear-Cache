@echo off
title Outil de Suppression du Cache FiveM - By Lafraude
color 0c

echo ===========================================
echo        Bienvenue dans le Nettoyeur de Cache FiveM !
echo               Developpe par Lafraude
echo ===========================================
echo.
echo Pret a supprimer le cache de FiveM ? C'est parti !
echo.

pause

:: Definir les chemins pour simplifier la gestion
set "CHEMIN_CACHE_FIVEM=%localappdata%\FiveM\FiveM.app\data"
set "CHEMIN_RACINE_FIVEM=%localappdata%\FiveM\FiveM.app"

echo.
echo Acces au repertoire de FiveM en cours...

cd /d "%CHEMIN_RACINE_FIVEM%"

:: Supprimer les dossiers "crashes" et "logs" dans le repertoire racine
if exist crashes (
    echo Suppression du dossier "crashes"...
    rmdir /s /q crashes
) else (
    echo Dossier "crashes" non trouve.
)

if exist logs (
    echo Suppression du dossier "logs"...
    rmdir /s /q logs
) else (
    echo Dossier "logs" non trouve.
)

:: Aller dans le dossier "data" pour continuer le nettoyage
cd /d "%CHEMIN_CACHE_FIVEM%"

:: Supprimer les dossiers de cache specifiques dans le repertoire data
for %%D in (server-cache server-cache-priv cache nui-storage) do (
    if exist %%D (
        echo Suppression du dossier "%%D"...
        rmdir /s /q %%D
    ) else (
        echo Dossier "%%D" non trouve.
    )
)

echo.
echo Cache supprime avec succes !
echo Merci d'avoir utilise l'outil de nettoyage de cache de Lafraude !
echo.

:: Demander a l'utilisateur s'il veut lancer FiveM
set /p LANCER="Voulez-vous lancer FiveM maintenant ? (y/n) : "

if /i "%LANCER%"=="y" (
    echo Lancement de FiveM...
    start "" "%localappdata%\FiveM\FiveM.exe"
) else (
    echo FiveM ne sera pas lance.
)

echo Fermeture dans 5 secondes...
timeout /t 5 >nul
exit
