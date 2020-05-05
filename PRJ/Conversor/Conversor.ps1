$audioFomart=$args[0]
$imageFormat=$args[1]
$videoFormat=$args[2]

$audio=Get-ChildItem -Path Entrada\Audio -Name -Include *$audioFomart
$image=Get-ChildItem -Path Entrada\Imagem -Name -Include *$imageFormat
$video=[System.IO.Path]::GetFileNameWithoutExtension("$audio")+$videoFormat

$pathAudio="Entrada\Audio\$audio"
$pathimage="Entrada\Imagem\$image"
$pathVideo="Saida\$video"

$date = Get-Date -uformat "%d-%m-%Y"

$pathAudioHist="Processados\Audio\"+[System.IO.Path]::GetFileNameWithoutExtension("$audio")+"-"+$date+$audioFomart
$pathimageHist="Processados\Imagem\"+[System.IO.Path]::GetFileNameWithoutExtension("$image")+"-"+$date+$imageFormat
$pathVideoHist="Processados\Video\"+[System.IO.Path]::GetFileNameWithoutExtension("$video")+"-"+$date+$videoFormat

ffmpeg -loop 1 -i $pathimage -i $pathAudio -c:v libx264 -tune stillimage -c:a aac -b:a 192k -pix_fmt yuv420p -shortest -s hd1080 $pathVideo

Copy-Item $pathAudio $pathAudioHist
Copy-Item $pathimage $pathimageHist
Copy-Item $pathVideo $pathVideoHist
