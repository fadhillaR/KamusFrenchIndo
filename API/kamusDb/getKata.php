<?php
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST');
    header("Access-Control-Allow-Headers: X-Requested-With");

    include "koneksi.php";
    $sql = "SELECT * FROM kamus";
    $result = $koneksi->query($sql);
    
    if($result->num_rows > 0){
        $res['is_success'] = true;
        $res['message'] = "Berhasil Menampilkan Kosa Kata";
        $res['data'] = array();

        while ($row = $result->fetch_assoc()) {
            $res['data'][] = $row;
        }
    } else {
        $res['is_success'] = false;
        $res['message'] = "Gagal Menampilkan Kosa Kata";
        $res['data'] = null;
    }
    echo json_encode($res);
 ?>
