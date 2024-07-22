function validarForm(){
    let formulario=document.getElementById("agregar-form")    
    let nombreForm=document.getElementById("nombre")
    let descripForm=document.getElementById("descripcion")
    let imagenForm=document.getElementById("imagen")
    let generoForm=document.getElementById("genero")
    let plataformaForm=document.getElementById("plataforma")
    let urlForm=document.getElementById("url")
    let formValido=true

    formulario.addEventListener("submit", function(evt){
        evt.preventDefault()
    })
    if (nombreForm.value.trim()===""){
        let nombreInvalido=document.getElementById("nombreInvalido")
        nombreInvalido.setAttribute("style", "display:inline")
        
    }
    else {
        formValido=false/* pongo la variable formValido en caso de que luego haya que usarla para saber si hay que enviar en formulario */
        nombreInvalido.setAttribute("style", "display:none")
    }

    
    if (descripForm.value.length > 255){
        let descripInvalida=document.getElementById("descripcionInvalida")
        descripInvalida.setAttribute("style", "display:inline") 
    }
    else {
        formValido=false
        descripcionInvalida.setAttribute("style", "display:none")
    }

    if (imagenForm.value=null){
        let imagenInvalida=document.getElementById("imagenInvalida")
        imagenInvalida.setAttribute("style", "display:inline")
    }
    else{
        formValido=false
        imagenInvalida.setAttribute("style", "display:none")
    }

    if (plataformaForm.selectedIndex=='0'){
        let plataformaInvalida=document.getElementById("plataformaInvalida")
        plataformaInvalida.setAttribute("style", "display:inline")
    }
    else{
        formValido=false
        plataformaInvalida.setAttribute("style", "display:none")
    }

    if (url.value.length > 10){
        let urlInvalida=document.getElementById("urlInvalida")
        urlInvalida.setAttribute("style", "display:inline") 
    }
    else{
        formValido=false
        plataformaInvalida.setAttribute("style", "display:none")
    } 
}