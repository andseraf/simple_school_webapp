<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

<?php

$mysqli = new mysqli("127.0.0.1", "root", "", "db_school", 3306);
echo("Server Status: ");
echo $mysqli->host_info . "\n";

$result = $mysqli->query("SELECT studente.nome AS nome_studente, cognome , id_studente, ruolo.nome AS nome_ruolo 
FROM studente 
INNER JOIN ruolo 
ON studente.ruolo_id = ruolo.id_ruolo 
ORDER BY id_studente ASC;");

echo ("<table style = \"border: 1px solid black;\">
<tr>
  <th>Nome</th>
  <th>Cognome</th>
  <th>Id</th>
  <th>Ruolo</th>
  
</tr>");
foreach ($result as $row) {
    echo "<tr><td style = \"border: 1px solid black;\">" . $row['nome_studente'] ."</td>". "<td style = \"border: 1px solid black;\">" . $row['cognome'] ."</td>"."<td style = \"border: 1px solid black;\">" . $row['id_studente'] . "</td>"."<td style = \"border: 1px solid black;\">" . $row['nome_ruolo'] . "</td></tr>";
}

?>

</body>
</html>