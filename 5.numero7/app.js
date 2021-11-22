 const selectEstado = document.querySelector("#estados");
 const selectMunicipio = document.querySelector("#municipios");
 const soloNumero = document.querySelector(".solo-numero");
 const numero_7 = document.querySelector("#numero_7");

 const mensaje_tecla7 = (event) => { 
    let code = event.keyCode || event.which;
     if (code == 55) { //La tecla 7 es 55 en codigo ascii
         let formData = new FormData();
         formData.set('code', code);

         fetch('php/api/numero_7.php', {
                 method: 'POST',
                 body: formData
             })
             .then(res => res.json())
             .then(response => {
                 console.log(response.success.data[0][0]);
                 alert('Mensaje: ' + response.success.data[0][0].mensaje);
             })
             .catch(errors => console.log(errors));
     } else {
         console.log("Se esta presionando otra tecla", code);
     }

 };
//  al oprimir la tecla dispara el manejador de evento, la cual ejecuta la funcion mensaje_tecla7 
 numero_7.addEventListener('keypress', mensaje_tecla7);


 soloNumero.addEventListener("input", function () {
     this.value = this.value.replace(/[^0-9]/g, '');
 });
