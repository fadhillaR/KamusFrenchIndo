<?php
 $koneksi = mysqli_connect("localhost", "root", "", "db_kamus");
 if($koneksi) {
    // echo "Berhasil konek ke database";
 } else {
    echo "Gagal koneksi";
 }
?>