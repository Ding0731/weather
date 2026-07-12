Add-Type -AssemblyName System.Data.SQLite
$dbPath = "$env:USERPROFILE\.qclaw\state\openclaw.sqlite"
$conn = [System.Data.SQLite.SQLiteConnection]::new("Data Source=$dbPath")
$conn.Open()
$cmd = $conn.CreateCommand()
$cmd.CommandText = "SELECT name, value FROM config WHERE name LIKE '%weixin%' OR name LIKE '%channel%' OR name LIKE '%default%' LIMIT 20;"
$reader = $cmd.ExecuteReader()
while($reader.Read()) {
    Write-Host $reader[0] "=" $reader[1]
}
$conn.Close()
