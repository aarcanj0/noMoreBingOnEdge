@echo off
setlocal

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo.
    echo  [-] Permissao de Administrador Necessaria
    echo.
    echo Reinicie como Administrador
    echo.
    pause
    exit /b 1
)

set "REG_KEY=HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge"

echo [+] Configurando Politicas do Microsoft Edge
echo.

echo Configurando DefaultSearchProviderEnabled...
reg add "%REG_KEY%" /v DefaultSearchProviderEnabled /t REG_DWORD /d 1 /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] DefaultSearchProviderEnabled = 1
) else (
    echo [ERRO] Nao foi possivel criar a entrada DWORD
)

echo Configurando DefaultSearchProviderName...
reg add "%REG_KEY%" /v DefaultSearchProviderName /t REG_SZ /d "Google" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] DefaultSearchProviderName = Google
) else (
    echo [ERRO] Nao foi possivel criar a entrada REG_SZ
)

echo.
echo  [+] Configuracao concluida com sucesso!
echo As alteracoes serao aplicadas ao reiniciar o Microsoft Edge.
echo.
pause
endlocal
exit /b 0