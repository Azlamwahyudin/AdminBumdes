<?php
include '../koneksi.php';

$id = $_GET["id"];
// $simpan = mysqli_query($koneksi, "INSERT INTO report_msk (id_transaksi,tgl_msk,id_brg,barang,pengirim,hg_beli,jml_masuk,total_hrg) SELECT id_transaksi,tgl_msk,id_brg,barang,pengirim,hg_beli,jml_masuk,total_hrg FROM data_msk WHERE id ='$_GET[id]'");
// $delete = mysqli_query($koneksi, "DELETE FROM data_msk WHERE id = '$_GET[id]'");
// if (!$delete) {
//         die("Gagal menghapus data: " . mysqli_errno($koneksi) .
//             " - " . mysqli_error($koneksi));
//     } else {
//         echo "<script>alert('Data berhasil dihapus.');window.location='../barangMasuk.php';</script>";
//     }
$find = mysqli_query($koneksi, "SELECT * FROM data_klr WHERE id = '$id'");
$data = mysqli_fetch_assoc($find);
$id_trx = $data['id_transaksi'];
$tgl = $data['tgl_keluar'];
$penerima = $data['penerima'];
$jml_keluar = $data['jml_keluar'];
$barang = $data['barang'];
$total = $data['total_hrg'];
    
mysqli_query($koneksi, "INSERT INTO report_klr (id_transaksi, tgl_transaksi, penerima, jml_keluar, total_transaksi, barang) 
                        VALUES ('$id_trx','$tgl','$penerima','$jml_keluar', '$total', '$barang')");
mysqli_query($koneksi, "DELETE FROM data_klr WHERE id = '$id'");
    
if (mysqli_affected_rows($koneksi) > 0) {
    echo "<script>alert('Berhasil menambahkan Data ke Laporan Transaksi.');window.location='../barangKeluar.php';</script>";
} else {
    die("Gagal memindahkan data: " . mysqli_errno($koneksi) .
        " - " . mysqli_error($koneksi));
}

?>