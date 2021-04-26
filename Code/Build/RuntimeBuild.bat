@echo off
set CompileType=%1
set SourceDir=%2
set SourcePluginFileName=%3
set BatPath=%~dp0
set ProjectTargetDir=%BatPath%..\..\Project\Assets\Plugins\AIDLL\
set SourcePluginFilePath=%SourceDir%%SourcePluginFileName%
set ProjectTargetPluginFilePath=%ProjectTargetDir%%SourcePluginFileName%
set SourcePdbFilePath=%SourcePluginFilePath%.pdb
set TargetPdbFilePath=%ProjectTargetDir%%SourcePluginFileName%.pdb
:: Rar路径
set MonoPath="C:\Program Files\Unity\Hub\Editor\2019.4.1f1\Editor\Data\MonoBleedingEdge\bin\mono.exe"

if "%CompileType%"=="Debug" (echo f | xcopy /y "%SourcePdbFilePath%" "%TargetPdbFilePath%" ) else (del /q "%TargetPdbFilePath%")
echo f | xcopy /y "%SourcePluginFilePath%.dll" "%ProjectTargetPluginFilePath%.dll" 

%MonoPath% "%BatPath%pdb2mdb.exe" "%ProjectTargetPluginFilePath%.dll"