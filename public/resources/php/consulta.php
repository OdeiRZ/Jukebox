<?php
    try {
        $json = "*error*";
        $dbh = new PDO('mysql:host=localhost;dbname=jukebox;charset=utf8','root','root');
        $dbh -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        if (empty($_GET)) {
            $consulta = $dbh -> prepare("SELECT DISTINCT genero FROM albumes ORDER BY genero");
            $consulta -> execute();
            $generos = $consulta -> fetchAll(PDO::FETCH_ASSOC);
            $json = json_encode($generos);
        } else if(isset($_GET['genero'])) {
            $consulta = $dbh -> prepare("SELECT * FROM albumes WHERE genero=:genero ORDER BY nombre");
            $consulta -> bindValue(':genero', $_GET['genero'], PDO::PARAM_INT);
            $consulta -> execute();
            $albumes = $consulta -> fetchAll(PDO::FETCH_ASSOC);
            $json = json_encode($albumes);
        } else if(isset($_GET['album'])) {
            $consulta = $dbh -> prepare("SELECT * FROM pistas WHERE id_album=:id ORDER BY numero");
            $consulta -> bindValue(':id', $_GET['album'], PDO::PARAM_INT);
            $consulta -> execute();
            $pistas = $consulta -> fetchAll(PDO::FETCH_ASSOC);
            $json = json_encode($pistas);
        }
        echo $json;
    } catch (PDOException $e) {
        echo $json; //die('Ha ocurrido un *error* al acceder a la BBDD.');
    }