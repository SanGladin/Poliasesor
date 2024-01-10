/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function verpas() {
    var x = document.getElementById("contrasenue");
    var img = document.getElementById("icon");
    if (x.type === "password") {
        x.type = "text";
        img.src = "img/ver (1).png"
        
    } else {
        x.type = "password";
        img.src = "img/ver.png"
    }
}
window.onload = function () {
    if (window.screen.width < 1200) {
        var img = document.getElementById("imgpoli");
        img.style.visibility = "hidden";

    }
    var myInput = document.getElementById('contraseact');
    myInput.onpaste = function (e) {
        e.preventDefault();

    };

    myInput.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput3 = document.getElementById('contrasenue');

    myInput3.onpaste = function (e) {
        e.preventDefault();

    };

    myInput3.oncopy = function (e) {
        e.preventDefault();

    };
    var myInput2 = document.getElementById('contrasecon');
    myInput2.onpaste = function (e) {
        e.preventDefault();

    };

    myInput2.oncopy = function (e) {
        e.preventDefault();

    };
    

}
window.onresize = function () {

    if (window.screen.width < 1200) {
        var img = document.getElementById("imgpoli");
        img.style.visibility = "hidden";

    } else if (window.screen.width > 1200) {
        var img = document.getElementById("imgpoli");
        img.style.visibility = "visible";


    }
}
window.onclick = function () {
    if (window.screen.width < 1200) {
        var img = document.getElementById("imgpoli");
        img.style.visibility = "hidden";

    } else if (window.screen.width > 1200) {
        var img = document.getElementById("imgpoli");
        img.style.visibility = "visible";
    }
}

document.onkeydown = function (e) {

    // disable F12 key
    if (e.keyCode == 123) {
        return false;
    }


    // disable I key
    if (e.ctrlKey && e.shiftKey && e.keyCode == 73) {
        return false;
    }

    // disable J key
    if (e.ctrlKey && e.shiftKey && e.keyCode == 74) {
        return false;
    }

    // disable U key
    if (e.ctrlKey && e.keyCode == 85) {
        return false;
    }
}

document.addEventListener('contextmenu', event => event.preventDefault());

 function z(){
            
    if (event.charCode == 60 || event.charCode == 62){
        Swal.fire(
            'Error',
            'Simbolo no permitido',
            'warning',

        )
        return (event.charCode !== 60 && event.charCode !== 62);
    }

}
function error(){
    if(document.getElementById("contraseact").value != ""){

    }else{
        Swal.fire(
            'Error',
            'No ha llenado el Campo de Contraseña',
            'error',

        )
    }
}

