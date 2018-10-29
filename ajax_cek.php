<?php
include "class/class.php";
$barang = mysql_fetch_array(mysql_query("select * from barang where kd_barang='$_GET[kd_barang]'"));
$data_barang = array('nama_barang'   	=>  $barang['nama_barang'],
              		'satuan'  	=>  $barang['satuan'],
              		'harga_jual'    		=>  $barang['harga_jual'],);
 echo json_encode($data_barang);