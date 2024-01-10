
    /* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



document.addEventListener('contextmenu', event => event.preventDefault());


function cupodisa(){
        var dd;
        var cupomax = document.getElementById("CupoDis").value;

        cupodis = parseInt(cupomax) + 1;
        document.getElementById("CupoDis").value = cupodis;
        
        
}

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
function myFunction1() {
    document.getElementById("myDropdown1").classList.toggle("show");
}

 
   
window.onclick = function (event) {
    

  
    
    
    if (document.getElementById("luneshorain").value != "") {
        document.getElementById("luneshorafin").removeAttribute("readonly");
        document.getElementById("luneshorafin").required = true;
        document.getElementById("luneshorafin").min = document.getElementById("luneshorain").value.toString();
    }

    if (document.getElementById("marteshorain").value != "") {
        document.getElementById("marteshorafin").required = true;
        document.getElementById("marteshorafin").removeAttribute("readonly");
        document.getElementById("marteshorafin").min = document.getElementById("marteshorain").value.toString();
    }
    if (document.getElementById("miercoleshorain").value != "") {
        document.getElementById("miercoleshorafin").removeAttribute("readonly");
        document.getElementById("miercoleshorafin").required = true;
        document.getElementById("miercoleshorafin").min = document.getElementById("miercoleshorain").value.toString();
    }
    if (document.getElementById("jueveshorain").value != "") {
        document.getElementById("jueveshorafin").removeAttribute("readonly");
        document.getElementById("jueveshorafin").required = true;
        document.getElementById("jueveshorafin").min = document.getElementById("jueveshorain").value.toString();
    }
    if (document.getElementById("vierneshorain").value != "") {
        document.getElementById("vierneshorafin").required = true;
        document.getElementById("vierneshorafin").removeAttribute("readonly");
        document.getElementById("viernesmhorafin").min = document.getElementById("vierneshorain").value.toString();
    }
    if (document.getElementById("sabhorain").value != "") {
        document.getElementById("sabhorafin").required = true;
        document.getElementById("sabhorafin").removeAttribute("readonly");
        document.getElementById("sabhorafin").min = document.getElementById("sabhorain").value.toString();
    }

    if (document.getElementById("domhorain").value != "") {
        document.getElementById("domhorafin").required = true;
        document.getElementById("domhorafin").removeAttribute("readonly");
        document.getElementById("domhorafin").min = document.getElementById("domhorain").value.toString();
    }
    if (document.getElementById("domhorain").value == "") {
        document.getElementById("domhorafin").setAttribute("readonly", "true");
        document.getElementById("domhorafin").value = "--:--:--";
        document.getElementById("domhorafin").required = false;
        document.getElementById("domhorafin").min = document.getElementById("domhorain").value.toString();
    }
    if (document.getElementById("luneshorain").value == "") {
        document.getElementById("luneshorafin").setAttribute("readonly", "true");
        document.getElementById("luneshorafin").required = false;
        document.getElementById("luneshorafin").value = "--:--:--";
        document.getElementById("luneshorafin").min = document.getElementById("luneshorain").value.toString();
    }
    if (document.getElementById("marteshorain").value == "") {
        document.getElementById("marteshorafin").setAttribute("readonly", "true");
        document.getElementById("marteshorafin").required = false;
        document.getElementById("marteshorafin").value = "--:--:--";
        document.getElementById("marteshorafin").min = document.getElementById("marteshorain").value.toString();
    }
    if (document.getElementById("miercoleshorain").value == "") {
        document.getElementById("miercoleshorafin").setAttribute("readonly", "true");
        document.getElementById("miercoleshorafin").required = false;
        document.getElementById("miercoleshorafin").value = "--:--:--";
        document.getElementById("miercoleshorafin").min = document.getElementById("miercoleshorain").value.toString();
    }
    if (document.getElementById("jueveshorain").value == "") {
        document.getElementById("jueveshorafin").setAttribute("readonly", "true");
        document.getElementById("jueveshorafin").required = false;
        document.getElementById("jueveshorafin").value = "--:--:--";
        document.getElementById("jueveshorafin").min = document.getElementById("jueveshorain").value.toString();
    }
    if (document.getElementById("vierneshorain").value == "") {
        document.getElementById("vierneshorafin").setAttribute("readonly", "true");
        document.getElementById("vierneshorafin").required = false;
        document.getElementById("vierneshorafin").value = "--:--:--";
        document.getElementById("vierneshorafin").min = document.getElementById("vierneshorain").value.toString();
    }
    if (document.getElementById("sabhorain").value == "") {
        document.getElementById("sabhorafin").setAttribute("readonly", "true");
        document.getElementById("sabhorafin").required = false;
        document.getElementById("sabhorafin").value = "--:--:--";
        document.getElementById("sabhorafin").min = document.getElementById("sabhorain").value.toString();
    }



}










window.onresize = function () {

    if (window.screen.width < 1200) {
        var img = document.getElementById("poliimg");
        img.style.visibility = "hidden";
        img.style.marginRight = "0vw";

    } else if (window.screen.width > 1200) {
        var img = document.getElementById("poliimg");
        img.style.visibility = "visible";
        img.style.marginRight = "16vw";


    }
}


function z() {

    if (event.charCode == 60 || event.charCode == 62) {
        Swal.fire(
                'Error',
                'Simbolo no permitido',
                'warning',
                )
        return (event.charCode !== 60 && event.charCode !== 62);
    }

}




function verififcar() {
    var desc = document.getElementById("descripcion").value;
    if (desc == null) {
        swal("error")
    } else {
        window.alert("error")
    }
}



document.addEventListener('contextmenu', event => event.preventDefault());



function borrartodo() {
    Swal.fire({
        title: '¿Seguro que deseas Eliminar esta Asesoria?',

        showCancelButton: true,
        confirmButtonText: 'Si',
        cancelButtonText: 'No',
    }).then((result) => {
        /* Read more about isConfirmed, isDenied below */
        if (result.isConfirmed) {
            document.getElementById("form1").setAttribute('action', 'borrarasesoria')
            document.forms["form1"].submit();

        }
    })
}



