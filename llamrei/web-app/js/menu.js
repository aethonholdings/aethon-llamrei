

 
    function hideAll() {
      if(document.getElementById("operatorServiceMenu")!=null) document.getElementById("operatorServiceMenu").style.display = 'none';
      if(document.getElementById("adminServiceMenu")!=null) document.getElementById("adminServiceMenu").style.display = 'none';
    }
   
    function activate(id) {
      hideAll();
      var e = document.getElementById(id); 
      e.style.position = 'absolute';
      e.style.display = 'block';
    }
 

