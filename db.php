<?php
header("Content-Type: application/json; charset=utf-8"); header("Cache-Control: no-store"); session_start();
try{$pdo=new PDO("mysql:host=localhost;dbname=jobhub;charset=utf8mb4","root","",[PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]);}catch(Throwable $e){http_response_code(500);echo json_encode(["success"=>false,"message"=>"Database connection failed. Import database/jobhub.sql and check php/db.php."]);exit;}
function input(){return json_decode(file_get_contents("php://input"),true)?:[];}
function current_user(){return $_SESSION["user"]??null;}
function require_role($roles){$u=current_user();if(!$u||!in_array($u["role"],(array)$roles,true)){http_response_code(401);echo json_encode(["success"=>false,"message"=>"Please log in with an authorized account."]);exit;}return $u;}
function done($data){echo json_encode($data);exit;}
?>