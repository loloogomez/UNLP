<?php
    require_once = "servidor\conexionBD.php"

    ConexionDB conn = new ConexionDB();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LowNicJuegos</title>
    <link rel="stylesheet" href="estilos.css"> 
</head>
<body>
    <header>
        <a href="index.html"> <img src="logo.ico" alt="logo" id="logo"> </a>
    </header>
    <h1>Lista de juegos</h1>
    <a href="altaJuego.html"> <button>Agregar Juego</button> </a>
    <body>
        <form id="Filtro-juego">
            <div>
                <label for="Filtrar-nombre">Nombre:</label>
                <input type="text" id="filtrar-nombre" name="filtrar-nombre" placeholder="Nombre">
            </div>
            <div>
                <label for="Filtrar-genero">Genero:</label>
                <select name="filtrar-genero" id="filtrar-genero">
                    <option value="" selected disabled>Seleccione una opción</option>
                    <option name="accion" id="accion">Acción</option>
                    <option name="rol" id="rol">Rol</option>
                    <option name="estrategia" id="estrategia">Estrategia</option>
                    <option name="aventura" id="aventura">aventura</option>
                </select>
            </div>
            <div>
                <label for="Filtrar-plataforma">Plataforma:</label>
                <select name="plataforma" id="plataforma" required>
                    <option value="" selected disabled>Seleccione una opción</option>
                    <option value="Nintendo Switch">Nintendo Switch</option>
                    <option value="Wii U">Wii U</option>
                    <option value="PC">PC</option>
                    <option value="PlayStation 4">PlayStation 4</option>
                    <option value="PlayStation 5">PlayStation 5</option>
                    <option value="Xbox One">Xbox One</option>
                    <option value="iOS">iOS</option>
                    <option value="Android">Android</option>
                </select>
            </div>
            <div>
                <button type="button">Ordenar A-Z</button>
            </div>
        </form>
        <ul id="listaJuegos">
            <li class="elemJuego">
                <h3>The Legend of Zelda</h3>
                <img src="" alt="">
                <p class="descripcion">Únete a Link en su misión para salvar Hyrule de la calamidad en este juego de mundo abierto.</p>
                <p class="plataforma">(Nintendo Switch, Wii U)</p>
                <p class="genero">Acción</p>
                <a href=" https://www.nintendo.com/games/detail/the-legend-of-zelda-breath-of-the-wild-switch/">Click aquí</a>
            </li>
            <li>
            <li class="elemJuego">
                <h3>Stardew Valley</h3>
                <img src="" alt="">
                <p class="descripcion">Abandona la ciudad para empezar una nueva vida en el campo en este juego de simulación de granja.</p>
                <p class="plataforma">(PC, PlayStation 4, Xbox One, Nintendo Switch, iOS, Android)</p>
                <p class="genero">rol</p>
                <a href="https://www.stardewvalley.net/">Click aquí</a>
            </li>
            <li class="elemJuego">
                <h3>Among Us</h3>
                <img src="" alt="">
                <p class="descripcion">Descubre quién es el impostor a bordo de una nave espacial en este juego multijugador en línea.</p>
                <p class="plataforma">(PC, iOS, Android, Nintendo Switch)</p>
                <p class="genero">estrategia</p>
                <a href="https://innersloth.com/gameAmongUs.php">Click aquí</a>
            </li>
            <li class="elemJuego">
                <h3>Cuphead</h3>
                <img src="" alt="">
                <p class="descripcion">Ayuda a Cuphead y Mugman a vencer al diablo en este juego de plataformas retro con un estilo visual único.</p>
                <p class="plataforma">(PC, Xbox One, Nintendo Switch, PlayStation 4)</p>
                <p class="genero">Acción</p>
                <a href="https://www.cupheadgame.com/">Click aquí</a>
            </li>
            <li class="elemJuego">
                <h3>The Last of Us Part II</h3>
                <img src="" alt="">
                <p class="descripcion">Sobrevive en un mundo postapocalíptico infestado de infectados en esta secuela del aclamado juego de 2013.</p>
                <p class="plataforma">(PlayStation 4, PlayStation 5)</p>
                <p class="genero">aventura</p>
                <a href="https://www.thelastofus.playstation.com/part-ii/">Click aquí</a>
            </li>
        </ul>
    </body>
    <footer>Lorenzo Gomez Garese - Nicolás Musante <br>Alumnos de segundo año de la UNLP<br> Todos los derechos reservados</footer>
</body>
</html>