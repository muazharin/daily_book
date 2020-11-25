<div class="container-fluid">

    <div class="row">
        <div class="col-xl-12">
            <div class="breadcrumb-holder">
                <h1 class="main-title float-left"><?= $tittle; ?></h1>
                <ol class="breadcrumb float-right">
                    <li class="breadcrumb-item">Home</li>
                    <li class="breadcrumb-item active"><?= $tittle; ?></li>
                </ol>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
    <!-- end row -->



    <div class="row">
        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-default">
                <i class="fa fa-file-text-o float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Orders</h6>
                <h1 class="m-b-20 text-white counter">1,587</h1>
                <span class="text-white">15 New Orders</span>
            </div>
        </div>

        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-warning">
                <i class="fa fa-bar-chart float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Visitors</h6>
                <h1 class="m-b-20 text-white counter">250</h1>
                <span class="text-white">Bounce rate: 25%</span>
            </div>
        </div>

        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-info">
                <i class="fa fa-user-o float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Users</h6>
                <h1 class="m-b-20 text-white counter">120</h1>
                <span class="text-white">25 New Users</span>
            </div>
        </div>

        <div class="col-xs-12 col-md-6 col-lg-6 col-xl-3">
            <div class="card-box noradius noborder bg-danger">
                <i class="fa fa-bell-o float-right text-white"></i>
                <h6 class="text-white text-uppercase m-b-20">Alerts</h6>
                <h1 class="m-b-20 text-white counter">58</h1>
                <span class="text-white">5 New Alerts</span>
            </div>
        </div>
    </div>
    <!-- end row -->

    <!-- chart -->
    <div class="row ">

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h3><i class="fa fa-line-chart"></i> Items Sold Amount</h3>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus non luctus metus. Vivamus fermentum ultricies orci sit amet sollicitudin.
                </div>

                <div class="card-body"><iframe class="chartjs-hidden-iframe" tabindex="-1" style="display: block; overflow: hidden; border: 0px; margin: 0px; top: 0px; left: 0px; bottom: 0px; right: 0px; height: 100%; width: 100%; position: absolute; pointer-events: none; z-index: -1;"></iframe>
                    <canvas id="lineChart" width="640" height="320" style="display: block; width: 320px; height: 160px;"></canvas>
                </div>
                <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
            </div><!-- end card-->
        </div>

    </div>

</div>
<!-- END container-fluid -->