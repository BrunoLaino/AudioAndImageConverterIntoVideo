$audioFomart=".mp3"
$imageFormat=".jpg"
$videoFormat=".mp4"

$audio=Get-ChildItem -Path Entrada\Audio -Name -Include *$audioFomart
$image=Get-ChildItem -Path Entrada\Imagem -Name -Include *$imageFormat
$video=[System.IO.Path]::GetFileNameWithoutExtension("$audio")+$videoFormat

$pathAudio="Entrada\Audio\$audio"
$pathimage="Entrada\Imagem\$image"
$pathVideo="Saida\$video"

$pathAudioHist="Processados\Audio\$audio"
$pathimageHist="Processados\Imagem\$image"
$pathVideoHist="Processados\Video\$video"

ffmpeg -loop 1 -i $pathimage -i $pathAudio -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest -s hd1080 $pathVideo

Move-Item $pathAudio $pathAudioHist
Move-Item $pathimage $pathimageHist
Copy-Item $pathVideo $pathVideoHist