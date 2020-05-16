$streamReader = New-Object System.IO.StreamReader("./largeCSV/1000.csv")
$skip = 990
$limit = 5

$current = 0
while ($null -ne($line =$streamReader.ReadLine()))
{
    $current++
    if ($current -lt $skip) {continue}
    if ($limit -le ($current-$skip)) {break}
    $data = $line.Split(",")
    ConvertTo-Json $data
}
$streamReader.Dispose()