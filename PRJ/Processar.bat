@echo off
powershell ./Conversor/Conversor.ps1 .mp3 .jpg .mp4
REM Exemplo: powershell ./Conversor/Conversor.ps1 .{formato de audio} .{formato de imagem} .{formato de video}
REM Todos os formatos devem seguir o modelo ".{formato de audio}" ex: ".amv"
REM O Ponto(".") antes do formato é obrigatório!
PAUSE