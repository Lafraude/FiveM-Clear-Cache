@echo off

title FiveM Tools - By Lafraude - Cache Deleter
color c

echo Pret a supprimer ton cache FiveM ?
echo By Lafraude

pause

cd %localappdata%
cd FiveM
cd FiveM.app

if exist crashes rmdir /s /q crashes
if exist logs rmdir /s /q logs

cd data

if exist server-cache rmdir /s /q server-cache
if exist server-cache-priv rmdir /s /q server-cache-priv
if exist cache rmdir /s /q cache
if exist nui-storage rmdir /s /q nui-storage

timeout 5

echo Cache supprime !
echo Merci d'avoir utilise mon outil !

pause
