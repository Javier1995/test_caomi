<?php
   
  if($_SERVER['REQUEST_METHOD'] == 'POST' && $_POST['code'] == '55'){
    header('Content-Type: application/json'); 

    require_once '../conexion.php';
    $code = isset($_POST['code'])? json_decode($_POST['code'], true) : NULL;
    $data = array( 'error'=>array(), 'success'=> array('data'=>array()));

    $sql = "SELECT * FROM c_mensaje7 LIMIT 1";

    $numero_7 = $db->prepare($sql);
    if($numero_7->execute()){
      array_push($data['success']['data'] , $numero_7->fetchAll(PDO::FETCH_ASSOC));
      http_response_code(201);
    } else {
      array_push($data['error'] ,'Error al cargar los datos');
      http_response_code(504);
    }

    
    echo json_encode($data , true);
  } else {
    http_response_code(504);
  }