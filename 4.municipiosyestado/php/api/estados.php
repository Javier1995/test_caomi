<?php
  if($_SERVER['REQUEST_METHOD'] == 'GET'){
    require_once '../conexion.php';
    header('Content-Type: application/json');
    $estados =  $db->prepare("SELECT id, estado FROM estados");
    
    $data = array( 'error'=>array(), 'success'=> array('data'=>array()));
    
    if($estados->execute()){
      array_push($data['success']['data'] ,$estados->fetchAll(PDO::FETCH_ASSOC));
      http_response_code(201);
    } else {
      array_push($data['error'] ,'Error al cargar los datos');
      http_response_code(504);
    }

    
    echo json_encode($data, true);
  }