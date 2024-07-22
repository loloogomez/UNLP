<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="altaJuegoEstilos.css">
</head>
<body>
    <header>
        <a href="index.html"> <img src="\imagenes\logo.ico" alt="logo" id="logo"> </a>
    </header>
    <h1>Agregar Juego</h1>
    <form action="" method="post" id="agregar-form">
        <div>
            <label for="Nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" placeholder="Nombre">
        </div>
        <div>
            <label for="Imagen">Imagen:</label>
            <input type="image" id="imagen" name="imagen" placeholder="Imagen">
        </div>
        <div>
            <label for="Descripcion">Descripcion:</label>
            <input type="text" id="descripcion" name="descripcion" placeholder="Descripcion">
        </div>
        <div>
            <label for="plataforma">plataforma:</label>
            <select name="plataforma" id="plataforma">
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
            <label for="Url">Url:</label>
            <input type="text" id="url" name="url" placeholder="Url"/>
        </div>
        <div>
            <label for="Genero">Genero:</label>
            <select name="genero" id="genero">
                <option value="" selected disabled>Seleccione una opción</option>
                <option name="accion" id="accion">Acción</option>
                <option name="rol" id="rol">Rol</option>
                <option name="estrategia" id="estrategia">Estrategia</option>
                <option name="aventura" id="aventura">aventura</option>
            </select>
        </div>
        <div>
            <button type="submit" id="boton-confirmar">Confirmar</button>
        </div>
    </form>

    <footer>Lorenzo Gomez Garese - Nicolás Musante <br>Alumnos de segundo año de la UNLP<br> Todos los derechos reservados</footer>
</body>
</html>