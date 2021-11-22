 const selectEstado = document.querySelector("#estados");
 const selectMunicipio = document.querySelector("#municipios");
 
 document.addEventListener("DOMContentLoaded", init);
 selectEstado.addEventListener("change",catalogoMunicipio);

 function init(){
    
    fetch('php/api/estados.php')
    .then(res => res.json())
    .catch(error => console.error('Error:', error))
    .then(response =>{
        let estados = response.success.data[0];
        estados.unshift({id:'-0',estado:'Ninguno'});
        estados.forEach(element => {
            let opt = document.createElement('option');
            opt.value = element.id;
            opt.innerHTML = element.estado.toUpperCase();
            selectEstado.appendChild(opt);
        });
    });
    let opt = document.createElement('option');
    opt.innerHTML = 'NO SELECCIONADO';
    selectMunicipio.appendChild(opt);
    selectMunicipio.setAttribute('disabled', 'disabled');

 }

  function catalogoMunicipio(){
    let formData = new FormData();
   
    
    if(Number(selectEstado.value)){

      
        formData.set("estados_id", selectEstado.value);
        
        fetch('php/api/municipios.php',{
            method: "POST",
            body: formData
        }).then(res => res.json())
        .catch(error => console.error('Error:', error))
        .then(response =>{
            selectMunicipio.innerHTML = '';
            let municipios = response.success.data[0];
            selectMunicipio.removeAttribute('disabled');
            municipios.unshift({id:'-0', municipio:'Ninguno'});
            municipios.forEach(element => {
                
                let opt = document.createElement('option');
                opt.value = element.id;
                opt.innerHTML = element.municipio.toUpperCase();
                selectMunicipio.appendChild(opt);
            });

            
        });
    } else {
        let opt = document.createElement('option');
        selectMunicipio.innerHTML = '';
        selectMunicipio.setAttribute('disabled', 'disabled');
        opt.innerHTML = 'NO SELECCIONADO'.toUpperCase();
        selectMunicipio.appendChild(opt);
    }
}