<?php
 header('Access-Control-Allow-Origin: *');
 header('Access-Control-Allow-Methods: GET, POST');
 header("Access-Control-Allow-Headers: X-Requested-With");
 $koneksi = mysqli_connect("localhost", "root", "", "db_kamus");
 if($koneksi) {
    // echo "Berhasil konek ke database";
 } else {
    echo "Gagal koneksi";
 }
?>