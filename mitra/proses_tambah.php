<?php

include '../koneksi.php';

// membuat variabel untuk menampung data dari form
$kode_mitra = $_POST['kd_mitra'];
$nama_mitra   = $_POST['nama_mitra'];
$alamat  = $_POST['alamat'];
$nomer_telepon    = $_POST['no_tlp'];
$tgl_gabung    = $_POST['tgl_gabung'];
$barang     = $_POST['barang'];

if (isset($_POST['bsimpan'])) {
	$simpan = mysqli_query($koneksi, "INSERT INTO data_mitra (kd_mitra, nama_mitra, alamat, no_tlp, tgl_gabung, barang) VALUES ('$kode_mitra', '$nama_mitra', '$alamat', '$nomer_telepon', '$tgl_gabung', '$barang')");

	if ($simpan) //jika simpan sukses
	{
		echo "<script>
						alert('Simpan data suksess!');
						document.location='../mitra.php';
				     </script>";
	} else {
		echo "error $sql" . mysqli_error($koneksi);
	}
}
