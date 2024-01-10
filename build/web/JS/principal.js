/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


window.onresize = function(){
   
    if (window.screen.width < 1200) {
      var img = document.getElementById("poliimg");
      img.style.visibility = "hidden";
      img.style.marginRight="0vw";
    }else if (window.screen.width> 1200){
      var img = document.getElementById("poliimg");
      img.style.visibility = "visible";
      img.style.marginRight= "16vw";

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
  window.onload = function(){
  
    if (window.screen.width < 1200) {
      var img = document.getElementById("poliimg");
      img.style.visibility="hidden";
      img.style.marginRight="0vw";
     
    }
   
          var myInput = document.getElementById('nav');
          myInput.onpaste = function (e) {
              e.preventDefault();

          };

          myInput.oncopy = function (e) {
              e.preventDefault();

          };
  }
  function uncheck() {
    var checkbox1 = document.getElementById("asesor");
    var checkbox2 = document.getElementById("asesorado");
    checkbox1.onclick = function () {
      if (checkbox1.checked != false) {
        checkbox2.checked = null;
      }
    }
    checkbox2.onclick = function () {
      if (checkbox2.checked != false) {
        checkbox1.checked = null;
      }
    }
  }
  function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
    document.getElementById("myDropdown1").classList.remove('show');
  }
  function myFunction1() {
    document.getElementById("myDropdown1").classList.toggle("show");
  }

  // Close the dropdown menu if the user clicks outside of it
  window.onclick = function (event) {

    if (!event.target.matches('.dropbtn')) {
      var dropdowns = document.getElementsByClassName("dropdown-content");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
    



  }


  function sumbit1() {
    document.getElementById('form1').setAttribute('action'
            , 'Buscar')
  }
  
  function borrar(a){
    var id = a.id;
    var x = document.getElementById(id);
    x.remove();
    
    
  }
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




  