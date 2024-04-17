<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Szalkai Viktória web2 dolgozat</title>
    <link rel="stylesheet" href="style.css">
    </head>
<body>
    <main>
    <?php
    $nev = ["Nagy Aladár", "Kis Béla", "Szép Cecil", "Nagy Antal", "Kedves Csanád"];

    $klub = ["Budapest", "Budapest", "Karacslapulytő", "Baja", "Szeged"];

    $maxMeret = [random_int(10, 100),random_int(10, 100),random_int(10, 100),random_int(10, 100),random_int(10, 100)];

    $th = ["Név", "Klub Neve", "Maximális méret"];

    echo "<table><tr>";
    for ($index=0; $index < count($th); $index++) { 
        echo "<th>$th[$index]</th>";
    }echo "</tr>";
    for ($index=0; $index < count($nev); $index++) { 
        echo "<tr>
                <td>$nev[$index]</td>
                <td>$klub[$index]</td>
                <td>$maxMeret[$index]</td>
            </tr>";
    }echo "</table";
    ?>
    </main>
</body>
</html>