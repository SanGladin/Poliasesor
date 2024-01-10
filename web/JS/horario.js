/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */




window.onload = function(){
    
  
   if (window.screen.width < 1200) {
    var img = document.getElementById("imgpoli");
    img.style.visibility="hidden";
    img.style.marginRight="0vw";
   
  }
 
  
}
function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
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