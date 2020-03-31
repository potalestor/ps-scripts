$fileName = "test.txt"
$srcPath = "C:\dev\repos\ps-scripts\copy\src"
$dstPath = "C:\dev\repos\ps-scripts\copy\dst"
$bufferSize = 1024

$srcFileName = [IO.Path]::Combine($srcPath, $fileName)
$dstFileName = [IO.Path]::Combine($dstPath, $fileName)

[IO.FileStream] $inStream = [IO.File]::OpenRead($srcFileName)
try {
    [IO.FileStream] $outStream = [IO.File]::OpenWrite($dstFileName)
    try {

        $bytes = New-Object byte[] $bufferSize
        while (($bytesread = $inStream.Read($bytes, 0, $bufferSize)) -ne 0) {
            $outStream.Write($bytes, 0, $bytesread)
        }

    }
    finally {
        [IO.FileStream] $outStream.Close()
    }

}
finally {
    [IO.FileStream] $inStream.Close()
}



