@echo off
setlocal

devtools\bin\vpc.exe /hl2mp /tf /define:SOURCESDK +everything /mksln everything.sln

for /R %%f in (*.vcxproj) do (
    echo Processing %%f
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "(Get-Content -Raw '%%f') -replace '<PlatformToolset>v143</PlatformToolset>','<PlatformToolset>ClangCL</PlatformToolset>' | Set-Content '%%f'"
)

pause