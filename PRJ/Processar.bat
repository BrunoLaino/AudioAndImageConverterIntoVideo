@echo off
ren Entrada\Audio\*.mp3 Audio.mp3
ren Entrada\Imagem\*.jpg Imagem.jpg
ffmpeg -loop 1 -i Entrada\Imagem\Imagem.jpg -i Entrada\Audio\Audio.mp3 -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest -s hd1080 Saida\Video.mp4 
move Entrada\Audio\Audio.mp3 Processados\Audio\Audio-%date:~0,2%-%date:~3,2%-%date:~6,10%-%time:~0,2%-%time:~3,2%.mp3
move Entrada\Imagem\Imagem.jpg Processados\Imagem\Imagem-%date:~0,2%-%date:~3,2%-%date:~6,10%-%time:~0,2%-%time:~3,2%.jpg
copy Saida\Video.mp4 Processados\Video\Video-%date:~0,2%-%date:~3,2%-%date:~6,10%-%time:~0,2%-%time:~3,2%.mp4

