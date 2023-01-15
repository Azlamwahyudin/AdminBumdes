<?php
include '../koneksi.php';
$id_transaksi = $_POST['id_transaksi'];
$barang = $_POST['barang']; // ini ID barang nya
$pecah_barang = explode(".", $barang);
$kode_barang = $pecah_barang[0];
$nama_barang = $pecah_barang[1];
$id_transaksi = $_POST['id_transaksi'];
$tgl_keluar = $_POST['tgl_keluar'];
$jml_keluar = $_POST['jml_keluar'];
$penerima = $_POST['penerima'];
$hrg_jual =$_POST['hrg_jual'];
$total_hrg =$_POST['total_hrg'];

if ($barang === "-- Pilih Barang --") {
  echo "<script>alert('Terjadi Kesalahan : Tidak ada Barang yang terpilih');window.location='newBarangKeluar.php';</script>";
  exit;
}

$dt = mysqli_query($koneksi, "select * from data_brg where id_brg='$kode_barang'");
$data = mysqli_fetch_array($dt);
$sisa = $data['jml_stok'] - $jml_keluar;
$query1 = mysqli_query($koneksi, "update data_brg set jml_stok='$sisa' where id_brg='$kode_barang'");

$query2 = mysqli_query($koneksi, "INSERT INTO data_klr (id_transaksi,tgl_keluar,id_brg,barang,penerima,jml_keluar,hrg_jual, total_hrg) 
                      VALUES ('$id_transaksi','$tgl_keluar','$kode_barang','$nama_barang','$penerima','$jml_keluar','$hrg_jual', '$total_hrg')");

if ($query1 && $query2) {
  echo "<script>alert('Data berhasil ditambah.');window.location='../barangKeluar.php';</script>";
} else {
  echo "<script>alert('Data gagal ditambah.');window.location='../barangKeluar.php';</script>";
}


?>