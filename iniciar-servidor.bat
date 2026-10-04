@echo off
title KINGS LEAGUE IMEX - SERVIDOR LOCAL
echo ========================================================
echo   INICIANDO PLATAFORMA OFICIAL KINGS LEAGUE IMEX
echo ========================================================
echo Iniciando plataforma en http://localhost:8081...
where node >nul 2>&1
if %errorlevel%==0 (
	echo Backend central activado (Node.js)
	cd /d "%~dp0"
	node server.js
) else (
	echo Node.js no esta instalado. Se iniciara el modo estatico de demostracion.
	powershell -ExecutionPolicy Bypass -File "%~dp0serve.ps1"
)
pause
