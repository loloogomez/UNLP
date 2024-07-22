<?php

class ConexionDB {

    public function __construct() {
        $this->servername = 127.0.0.1;
        $this->username = "root";
        $this->password = "root";
        $this->dbname = "juegos";
    }

    public function conectar() {
        try {
            $this->conn = new PDO("mysql:host=$this->servername;dbname=$this->dbname", $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch(PDOException $e) {
            echo "Error de conexión: " . $e->getMessage();
        }
    }

    public function desconectar() {
        $this->conn = null;
    }

    public function getConexion() {
        return $this->conn;
    }
}

?>