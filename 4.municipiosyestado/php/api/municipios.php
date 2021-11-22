<?php
   
  if($_SERVER['REQUEST_METHOD'] == 'POST'){
    header('Content-Type: application/json'); 
    require_once '../conexion.php';
    $estados_id = isset($_POST['estados_id'])? json_decode($_POST['estados_id'], true) : NULL;

    $sql = "SELECT m.id as id, m.municipio as municipio FROM estados_municipios sm INNER JOIN estados e ON sm.estados_id =  e.id INNER JOIN municipios m ON  sm.municipios_id = m.id WHERE  estados_id=:estados_id";

    $municipios = $db->prepare($sql);

    $data = array( 'error'=>array(), 'success'=> array('data'=>array()));
    
    if($municipios->execute(['estados_id' => $estados_id])){
      array_push($data['success']['data'] , $municipios->fetchAll(PDO::FETCH_ASSOC));
      http_response_code(201);
    } else {
      array_push($data['error'] ,'Error al cargar los datos');
      http_response_code(504);
    }

    
    echo json_encode($data , true);
  } else {
    http_response_code(504);
  }