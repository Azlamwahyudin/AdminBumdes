<?php
session_start();
if (!isset($_SESSION['LOGIN'])) {
    header("location: login.php");
    exit();
}

if (isset($_GET['aksi'])) {
    $aksi = $_GET['aksi'];

    if ($aksi == "logout") {
        if (isset($_SESSION['LOGIN'])) {
            unset($_SESSION['LOGIN']);
            session_unset();
            session_destroy();
            $_SESSION = array();
        }
        header("location: login.php");
        exit();
    }
}
require('koneksi.php');
$sesName = $_SESSION['name'];

?>

<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8">
    <title> Transaksi Barang Keluar </title>
    <link rel="stylesheet" href="style/style.css">
    <!-- Boxicons CDN Link -->
    <link href='https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css' rel='stylesheet'>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css" />
</head>

<body>
    <div class="sidebar">
        <div class="logo-details">
            <img src="assets/img/bumdeslogo.png" alt="bumdes" width="40" >
            <span class="logo_name">BUMDES</span>
        </div>
        <ul class="nav-links">
            <li>
                <a href="index2.php" class="">
                    <i class='bx bx-grid-alt'></i>
                    <span class="links_name">Dashboard</span>
                </a>
            </li>
            <li>
                <a href="barang.php" class="">
                    <i class='bx bx-box'></i>
                    <span class="links_name">Product</span>
                </a>
            </li>
            <li>
                <a href="mitra.php" class="">
                    <i class='bx bx-badge-check'></i>
                    <span class="links_name">Mitra</span>
                </a>
            </li>
            <li>
                <a href="reseller.php">
                    <i class='bx bxs-collection'></i>
                    <span class="links_name">Reseller</span>
                </a>
            </li>
            <li>
                <a href="barangMasuk.php">
                    <i class='bx bxs-cart-add'></i>
                    <span class="links_name">Transaksi Masuk</span>
                </a>
            </li>
            <li>
                <a href="barangKeluar.php" class="active">
                    <i class='bx bxs-cart-download'></i>
                    <span class="links_name">Transaksi Keluar</span>
                </a>
            </li>
            <li>
                <a href="preOrder.php" class="">
                    <i class='bx bxs-basket'></i>
                    <span class="links_name">Pre Order</span>
                </a>
            </li>
            <li>
                <a href="reportMasuk.php" class="">
                    <i class='bx bxs-archive-in'></i>
                    <span class="links_name">Laporan Masuk</span>
                </a>
            </li>
            <li>
                <a href="reportKeluar.php" class="">
                    <i class='bx bxs-archive-out'></i>
                    <span class="links_name">Laporan Keluar</span>
                </a>
            </li>
            <li class="log_out">
                <a href="barangKeluar.php?aksi=logout" onclick="return confirm('Apakah anda akan keluar?')">
                    <i class='bx bx-log-out'></i>
                    <span class="links_name">Log out</span>
                </a>
            </li>
        </ul>
    </div>
    <section class="home-section">
        <nav>
            <div class="sidebar-button">
                <i class='bx bx-menu sidebarBtn'></i>
                <span class="dashboard">Barang Keluar</span>
            </div>
            <div class="profile-details">
                <span class="admin_name"><?php echo $sesName; ?></span>
            </div>
        </nav>

        <div class="home-content">
            <div class="sales-boxes">
                <div class="recent-sales1 box">
                    <div class="card-header1">
                        <h3>Order list</h3>
                        <button>
                            <a href="barangKeluar/newBarangKeluar.php" style="text-decoration: none;">Tambah Barang keluar</a>
                            <span class="bx bx-right-arrow-alt"></span>
                        </button>
                    </div>
                    <div class="card-body1">
                        <div class="table-responsive">
                            <table width="100%">
                                <thead>
                                    <tr>
                                        <th>No</th>
                                        <th>ID Transaksi</th>
                                        <th>Tanggal</th>
                                        <th>Penerima</th>
                                        <th>Barang</th>
                                        <th>Jumlah</th>
                                        <th>Total Harga</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php
                                    $brg = mysqli_query($koneksi, "SELECT * FROM data_klr");
                                    $no = 1;
                                    while ($b = mysqli_fetch_array($brg)) {
                                        // $idb = $b['id_transaksi'];
                                        $id = $b['id'];
                                    ?>
                                        <tr>
                                            <td align="center"><?php echo $no; ?></td>
                                            <td><?php echo $b['id_transaksi'] ?></td>
                                            <td><?php $tanggals = $b['tgl_keluar'];
                                                echo date("d-M-Y", strtotime($tanggals)) ?></td>
                                            <td><?php echo $b['penerima'] ?></td>
                                            <td><?php echo $b['barang'] ?></td>
                                            <td><?php echo $b['jml_keluar'] ?> </td>
                                            <td><?php echo $b['total_hrg'] ?></td>
                                            <td>
                                                <a href="barangKeluar/editBarangkeluar.php?id=<?php echo $b['id'] ?>" class="btn-edit"><i class='bx bxs-edit'></i></a>
                                                <a href="barangKeluar/pindah_Data.php?id=<?php echo $b['id'] ?>" class="btn-selesai" onclick="return confirm('Apakah anda yakin ingin menyelesaikan transaksi keluar ini? *Data akan dipindahkan ke laporan keluar')"><i class='bx bx-check-circle'></i></a>
                                            </td>
                                        </tr>
                                    <?php
                                        $no++; //untuk nomor urut terus bertambah 1
                                    }
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script>
        let sidebar = document.querySelector(".sidebar");
        let sidebarBtn = document.querySelector(".sidebarBtn");
        sidebarBtn.onclick = function() {
            sidebar.classList.toggle("active");
            if (sidebar.classList.contains("active")) {
                sidebarBtn.classList.replace("bx-menu", "bx-menu-alt-right");
            } else
                sidebarBtn.classList.replace("bx-menu-alt-right", "bx-menu");
        }
    </script>

    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.6.0/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            $('table').DataTable({
                // "paging":   false,
                "ordering": false,
                "info": false,
                "pagingType": "full_numbers",
                "lengthMenu": [
                    [10, 25, 50, -1],
                    [10, 25, 50, "All"]
                ],
                responsive: true,
                language: {
                    search: "_INPUT_",
                    searchPlaceholder: "Search Your Data",
                }
            });
        });
    </script>

</body>

</html>