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

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
            <div class="card mb-3">
                <div class="card-header">
                    <h3><i class="fa fa-table"></i> Basic data table</h3>
                    DataTables is a plug-in for the jQuery Javascript library. It is a highly flexible tool, based upon the foundations of progressive enhancement, and will add advanced interaction controls to any HTML table: pagination, instant search and multi-column ordering. <a target="_blank" href="https://datatables.net/">(more details)</a>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <div id="example1_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
                            <div class="row">

                                <div class="col-sm-12 col-md-6">
                                    <div id="example1_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example1"></label></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="example1" class="table table-bordered table-hover display dataTable no-footer" role="grid" aria-describedby="example1_info">
                                        <thead>
                                            <tr role="row">
                                                <th class="sorting_asc" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Name: activate to sort column descending" style="width: 52px;">No</th>
                                                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 69px;">Username</th>
                                                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 48px;">Devisi</th>
                                                <th class="sorting" tabindex="0" aria-controls="example1" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending" style="width: 48px;">#</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1;
                                            if (isset($user)) {
                                                foreach ($user as $data) { ?>
                                                    <tr role="row" class="even">
                                                        <td class="sorting_1"><?= $no++ ?></td>
                                                        <td><?= $username ?></td>
                                                        <td><?= $devisi ?></td>

                                                    </tr>
                                            <?php }
                                            } ?>

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div><!-- end card-->
        </div>



    </div>




</div>
<!-- END container-fluid -->