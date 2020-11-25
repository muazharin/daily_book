<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Pike Admin - Free Bootstrap 4 Admin Template</title>
    <meta name="description" content="Free Bootstrap 4 Admin Theme | Pike Admin">
    <meta name="author" content="Pike Web Development - https://www.pikephp.com">

    <!-- Favicon -->
    <link rel="shortcut icon" href="<?php echo base_url() ?>assets/src/assets/images/favicon.ico">

    <!-- Bootstrap CSS -->
    <link href="<?php echo base_url() ?>assets/src/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />

    <!-- Font Awesome CSS -->
    <link href="<?php echo base_url() ?>assets/src/assets/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

    <!-- Custom CSS -->
    <link href="<?php echo base_url() ?>assets/src/assets/css/style.css" rel="stylesheet" type="text/css" />

    <!-- BEGIN CSS for this page -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />
    <!-- END CSS for this page -->

</head>

<body class="adminbody">

    <div id="main">

        <!-- top bar navigation -->
        <div class="headerbar">

            <!-- LOGO -->
            <div class="headerbar-left">
                <a href="<?= base_url('Home') ?>" class="logo"><img alt="Logo" src="assets/images/logo.png" /> <span>Admin</span></a>
            </div>

            <nav class="navbar-custom">

                <ul class="list-inline float-right mb-0">

                    <li class="list-inline-item dropdown notif">
                        <a class="nav-link dropdown-toggle nav-user" data-toggle="dropdown" href="#" role="button" aria-haspopup="false" aria-expanded="false">
                            <img src="assets/images/avatars/admin.png" alt="Profile image" class="avatar-rounded">
                        </a>
                        <div class="dropdown-menu dropdown-menu-right profile-dropdown ">
                            <!-- item-->
                            <div class="dropdown-item noti-title">
                                <h5 class="text-overflow"><small>Hello, admin</small> </h5>
                            </div>

                            <!-- item-->
                            <a href="pro-profile.html" class="dropdown-item notify-item">
                                <i class="fa fa-user"></i> <span>Profile</span>
                            </a>

                            <!-- item-->
                            <a href="#" class="dropdown-item notify-item">
                                <i class="fa fa-power-off"></i> <span>Logout</span>
                            </a>


                        </div>
                    </li>

                </ul>

                <ul class="list-inline menu-left mb-0">
                    <li class="float-left">
                        <button class="button-menu-mobile open-left">
                            <i class="fa fa-fw fa-bars"></i>
                        </button>
                    </li>
                </ul>

            </nav>

        </div>
        <!-- End Navigation -->


        <!-- Left Sidebar -->
        <div class="left main-sidebar">

            <div class="sidebar-inner leftscroll">

                <div id="sidebar-menu">

                    <ul>

                        <li class="submenu">
                            <a class="active" href="<?= base_url('Home') ?>"><i class="fa fa-fw fa-bars"></i><span> Dashboard </span> </a>
                        </li>

                        <li class="submenu">
                            <a href="<?= base_url('User') ?>"><i class="fa fa-fw fa-area-chart"></i><span> Charts </span> </a>
                        </li>

                        <li class="submenu">
                            <a href="#"><i class="fa fa-fw fa-table"></i> <span> Tables </span> <span class="menu-arrow"></span></a>
                            <ul class="list-unstyled">
                                <li><a href="tables-basic.html">Basic Tables</a></li>
                                <li><a href="tables-datatable.html">Data Tables</a></li>
                            </ul>
                        </li>

                    </ul>

                    <div class="clearfix"></div>

                </div>

                <div class="clearfix"></div>

            </div>

        </div>
        <!-- End Sidebar -->


        <div class="content-page">

            <!-- Start content -->
            <div class="content">

                <?php echo $contents ?>

            </div>
            <!-- END content -->

        </div>
        <!-- END content-page -->

        <footer class="footer">
            <span class="text-right">
                Copyright <a target="_blank" href="#">Your Website</a>
            </span>
            <span class="float-right">
                Powered by <a target="_blank" href="https://www.pikeadmin.com"><b>Pike Admin</b></a>
            </span>
        </footer>

    </div>
    <!-- END main -->

    <script src="<?php echo base_url() ?>assets/src/assets/js/modernizr.min.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/js/jquery.min.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/js/moment.min.js"></script>

    <script src="<?php echo base_url() ?>assets/src/assets/js/popper.min.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/js/bootstrap.min.js"></script>

    <script src="<?php echo base_url() ?>assets/src/assets/js/detect.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/js/fastclick.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/js/jquery.blockUI.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/js/jquery.nicescroll.js"></script>

    <!-- App js -->
    <script src="assets/js/pikeadmin.js"></script>

    <!-- BEGIN Java Script for this page -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

    <!-- Counter-Up-->
    <script src="<?php echo base_url() ?>assets/src/assets/plugins/waypoints/lib/jquery.waypoints.min.js"></script>
    <script src="<?php echo base_url() ?>assets/src/assets/plugins/counterup/jquery.counterup.min.js"></script>

    <script>
        $(document).ready(function() {
            // data-tables
            $('#example1').DataTable();

            // counter-up
            $('.counter').counterUp({
                delay: 10,
                time: 600
            });
        });
    </script>

    <script>
        var ctx1 = document.getElementById("lineChart").getContext('2d');
        var lineChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
                datasets: [{
                    label: 'Dataset 1',
                    backgroundColor: '#3EB9DC',
                    data: [10, 14, 6, 7, 13, 9, 13, 16, 11, 8, 12, 9]
                }, {
                    label: 'Dataset 2',
                    backgroundColor: '#EBEFF3',
                    data: [12, 14, 6, 7, 13, 6, 13, 16, 10, 8, 11, 12]
                }]

            },
            options: {
                tooltips: {
                    mode: 'index',
                    intersect: false
                },
                responsive: true,
                scales: {
                    xAxes: [{
                        stacked: true,
                    }],
                    yAxes: [{
                        stacked: true
                    }]
                }
            }
        });


        var ctx2 = document.getElementById("pieChart").getContext('2d');
        var pieChart = new Chart(ctx2, {
            type: 'pie',
            data: {
                datasets: [{
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    "Red",
                    "Orange",
                    "Yellow",
                    "Green",
                    "Blue"
                ]
            },
            options: {
                responsive: true
            }

        });


        var ctx3 = document.getElementById("doughnutChart").getContext('2d');
        var doughnutChart = new Chart(ctx3, {
            type: 'doughnut',
            data: {
                datasets: [{
                    data: [12, 19, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255,99,132,1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    label: 'Dataset 1'
                }],
                labels: [
                    "Red",
                    "Orange",
                    "Yellow",
                    "Green",
                    "Blue"
                ]
            },
            options: {
                responsive: true
            }

        });
    </script>
    <!-- END Java Script for this page -->

</body>

</html>