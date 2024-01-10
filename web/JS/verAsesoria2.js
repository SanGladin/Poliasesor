/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */





        document.addEventListener('contextmenu', event => event.preventDefault());

        function a(e){

   
            Swal.fire({
                title: '¿Seguro que deseas Eliminar esta Asesoria?',
                
                showCancelButton: true,
                confirmButtonText: 'Si',
                cancelButtonText: 'No',
              }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if (result.isConfirmed) {
                    document.getElementById("form1").setAttribute('action', './eliminada.html')
                    document.forms["form1"].submit();
                   
                }
              })
            }
            

        function error() {
          
          
            if ( document.getElementById("descripcion").value != "") {  
                
                if (document.getElementById("temas").value != "") {
                    if (document.getElementById("zoom").value != "") {
                        if (document.getElementById("material").value != "") {
                            if (document.getElementById("nombre").value != "") {
                        
                            if (document.getElementById("luneshora").value != "" ||
                            document.getElementById("marteshora").value != "" ||
                            document.getElementById("miercoleshora").value != ""||
                            document.getElementById("jueveshora").value != "" ||
                            document.getElementById("vierneshora").value != "" ||
                            document.getElementById("sabhora").value != "" ||
                            document.getElementById("domhora").value != "") {
                                
                                if (document.getElementById("cupMax").value != 0){
        
                                    Swal.fire(
                                        'Exito',
                                        'Asesoria Creada',
                                        'success',
                
                                    ).then(function(){
                                        window.location= "misasesorias.html";
                                    })
                                    
                                }else{
                                    Swal.fire(
                                        'Error',
                                        'No puede existir un cupo maximo de 0',
                                        'error',
                
                                    )
                                }
                            
                            } else {
            
            
                                Swal.fire(
                                    'Error',
                                    'No ha seleccionado aunque sea un horario.',
                                    'error',
            
                                )
                            }
                                
                            } else {
            
            
                                Swal.fire(
                                    'Error',
                                    'No ha llenado el Campo de Nombre',
                                    'error',
            
                                )
                            }
                           
                        } else {
        
        
                            Swal.fire(
                                'Error',
                                'No ha llenado el Campo de Material',
                                'error',
        
                            )
                        }
        
                    } else {
        
        
                        Swal.fire(
                            'Error',
                            'No ha llenado el Campo de Aula',
                            'error',
        
                        )
                    }
        
                } else {
        
        
                    Swal.fire(
                        'Error',
                        'No ha llenado el Campo de Temas',
                        'error',
        
                    )
                }
            } else {
        
        
                Swal.fire(
                    'Error',
                    'No ha llenado el Campo de Descripcion',
                    'error',
        
                )
            }
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
        }
        function myFunction1() {
            document.getElementById("myDropdown1").classList.toggle("show");
        }
        
        
       
        
        window.onload = function (){
            
            var myInput = document.getElementById('descripcion');
            myInput.onpaste = function (e) {
                e.preventDefault();
        
            };
        
            myInput.oncopy = function (e) {
                e.preventDefault();
        
            };
            var myInput = document.getElementById('temas');
            myInput.onpaste = function (e) {
                e.preventDefault();
        
            };
        
            myInput.oncopy = function (e) {
                e.preventDefault();
        
            };
            var myInput = document.getElementById('zoom');
            myInput.onpaste = function (e) {
                e.preventDefault();
        
            };
        
            myInput.oncopy = function (e) {
                e.preventDefault();
        
            };
            var myInput = document.getElementById('material');
            myInput.onpaste = function (e) {
                e.preventDefault();
        
            };
        
            myInput.oncopy = function (e) {
                e.preventDefault();
        
            };
            var myInput = document.getElementById('nombre');
            myInput.onpaste = function (e) {
                e.preventDefault();
        
            };
        
            myInput.oncopy = function (e) {
                e.preventDefault();
        
            };
            var myInput = document.getElementById('cupMax');
            myInput.onpaste = function (e) {
                e.preventDefault();
        
            };
        
            myInput.oncopy = function (e) {
                e.preventDefault();
        
            };
        
        
        
        
        
            
        
        
        
            
          
            if (window.screen.width < 1200) {
             var img = document.getElementById("imgpoli");
             img.style.visibility="hidden";
             img.style.marginRight="0vw";
            
           }
        
          
           
         }
         window.onresize = function(){
           
            if (window.screen.width < 1200) {
              var img = document.getElementById("imgpoli");
              img.style.visibility = "hidden";
              img.style.marginRight="0vw";
        
            }else if (window.screen.width> 1200){
              var img = document.getElementById("imgpoli");
              img.style.visibility = "visible";
              img.style.marginRight="16vw";
              
        
            }
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
        
        
        
        
        function verififcar() {
            var desc = document.getElementById("descripcion").value;
            if (desc == null) {
                swal("error")
            } else {
                window.alert("error")
            }
        }
        
        
        
        document.addEventListener('contextmenu', event => event.preventDefault());
        function borrartodo(){
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
            function a(){
                Swal.fire({
                    title: '¿Seguro que deseas Eliminar esta Asesoria?',
                    
                    showCancelButton: true,
                    confirmButtonText: 'Si',
                    cancelButtonText: 'No',
                  }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        document.getElementById("form1").setAttribute('action', './eliminada.html')
                        document.forms["form1"].submit();
                       
                    }
                  })
                }


