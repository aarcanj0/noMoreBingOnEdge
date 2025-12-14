@echo off
setlocal

set "REG_KEY=HKEY_CURRENT_USER\Software\Microsoft\Edge\PreferenceMACs\Default"

echo [+] Encerrando Microsoft Edge...
taskkill /f /im msedge.exe >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] Microsoft Edge encerrado com sucesso
)

echo [+] Configurando...
echo.

reg add "%REG_KEY%" /v default_search_provider_data.template_url_data /t REG_SZ /d "6E4F9F2C4427827E9B2CCFCF10CF4ABD0B88455F53EBD7CE9B7EC791046B36F8" /f >nul 2>&1
if %errorLevel% equ 0 (
    echo [OK] default_search_provider_data.template_url_data alterado!
) else (
    echo [ERRO] Nao foi possivel continuar! Verifique seu anti-virus
)

echo.
echo.
pause
endlocal
exit /b 0
