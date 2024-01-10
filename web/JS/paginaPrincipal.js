//Para que aparezcan y desaparezcan los filtros
const btnFiltros = document.querySelector('.btn-filtros')

btnFiltros.addEventListener('click', function() {
    document.getElementById('filtros').classList.toggle('active');
    document.getElementById('lista-sesion').classList.remove('sexo');
})

//Para que aparezcan y desaparezcan las opciones "Mi Perfil" y "Cerrar Sesión"
const btnSesiones = document.querySelector('.btnBoleta')

btnSesiones.addEventListener('click', function() {
    document.getElementById('lista-sesion').classList.toggle('sexo');
    document.getElementById('filtros').classList.remove("active");
})