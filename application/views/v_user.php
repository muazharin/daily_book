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
    <?php echo $this->session->flashdata('pesan'); ?>
    <div class="row">

        <div class="col-md-12 ">
            <div class="card mb-3">
                <div class="card-header">
                    <h4 class="card-title">List User</h4>
                    <button class="btn btn-primary btn-round ml-auto" data-toggle="modal" data-target="#addRowModal">
                        <i class="fa fa-plus"></i>
                        Tambah Data
                    </button>
                </div>

                <div class="card-body">
                    <div class="table-responsive">
                        <div id="example1_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">

                            <div class="row">
                                <div class="col-sm-12">
                                    <table id="example1"
                                        class="table table-bordered table-hover display dataTable no-footer" role="grid"
                                        aria-describedby="example1_info">
                                        <thead>
                                            <tr>
                                                <th style="text-align:center">No</th>
                                                <th style="text-align:center">Username</thing>
                                                <th style="text-align:center">Devisi</th>
                                                <th style="text-align:center" width="160px">#</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php $no = 1;
                                            if (isset($user)) {
                                                foreach ($user as $data) { ?>
                                            <tr role="row" class="even">
                                                <td style="text-align:center"><?= $no++ ?></td>
                                                <td style="text-align:center"><?= $data['username']; ?></td>
                                                <td style="text-align:center"><?= $data['devisi']; ?></td>
                                                <td style="text-align:center">
                                                    <div class="row"></div>
                                                    <div class="button-list">

                                                        <button type="button" title="Edit" data-toggle="modal"
                                                            data-target="#updateRowModal<?= $data['id_user']; ?>"
                                                            class=" btn btn-primary ">
                                                            <i class="fa fa-edit"></i>
                                                        </button>
                                                        <form
                                                            action="<?= base_url() ?>User/hapus/<?= $data['id_user']; ?>"
                                                            method="post">
                                                            <button type="submit" title="Hapus" class="btn btn-danger"
                                                                onclick="return confirm('Apakah Anda Yakin?')">
                                                                <i class="fa fa-times"></i>
                                                            </button>

                                                        </form>
                                                    </div>

                                                </td>
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


    <!-- modal tambah -->
    <div class="modal fade" id="addRowModal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header no-bd">
                    <h5 class="modal-title">
                        <span class="fw-mediumbold">
                            Tambah Data User</span>

                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form action="<?= base_url('User/tambah') ?>" method="post">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label>Username *</label>
                                    <input type="text" class="form-control" autocomplete="off" name="user"
                                        placeholder="Username" required>
                                </div>
                            </div>

                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label>Password *</label>
                                    <input type="password" class="form-control" name="pw" placeholder="Password"
                                        required>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label>Devisi *</label>
                                    <input type="text" class="form-control" autocomplete="off" name="devisi"
                                        placeholder="Devisi" required>
                                </div>
                            </div>
                            <div class="col-sm-12">

                                <div class="form-group">
                                    <label>Level *</label>
                                    <select class="form-control" name="lvl">
                                        <option value="">-Pilih-</option>
                                        <option value="1">A</option>
                                        <option value="2">B</option>
                                        <option value="3">C</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer no-bd">
                            <button type="submit" class="btn btn-success">Add</button>
                            <!-- <button class="btn btn-danger" data-dismiss="modal">Close</button> -->
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>

    <!-- selesai modal tambah -->

    <!-- modal edit -->
    <?php foreach ($user as $data) : ?>
    <div class="modal fade" id="updateRowModal<?= $data['id_user']; ?>" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header no-bd">
                    <h5 class="modal-title">
                        <span class="fw-mediumbold">
                            Update Data User</span>

                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <form action="<?= base_url('User/editpost') ?>" method="post">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label>Username </label>
                                    <input type="hidden" class="form-control" value="<?= $data['id_user']; ?>"
                                        name="id">
                                    <input type="text" class="form-control" autocomplete="off" name="user"
                                        value="<?= $data['username']; ?>">
                                </div>
                            </div>

                            <!-- <div class="col-sm-12">
                                <div class="form-group ">
                                    <label>Password (Kosongkan jika tidak diganti)</label>
                                    <input type="password" class="form-control" name="pw_new">
                                    <input type="hidden" value="<?= $data['password']; ?>" name="pw_lama">
                                </div>
                            </div> -->
                            <div class="col-sm-12">
                                <div class="form-group ">
                                    <label>Devisi </label>
                                    <input type="text" class="form-control" autocomplete="off" name="devisi"
                                        value="<?= $data['devisi']; ?>">
                                </div>
                            </div>
                            <div class="col-sm-12">

                                <div class="form-group">
                                    <label>Level</label>
                                    <input type="hidden" value="<?= $lvl = $data['level']; ?>">
                                    <select class="form-control" name="lvl">
                                        <option <?php echo ($lvl == '1') ? "selected" : "" ?> value="1">A</option>
                                        <option <?php echo ($lvl == '2') ? "selected" : "" ?> value="2">B</option>
                                        <option <?php echo ($lvl == '3') ? "selected" : "" ?> value="3">C</option>
                                    </select>

                                </div>
                            </div>
                        </div>

                        <div class="modal-footer no-bd">
                            <button type="submit" class="btn btn-primary">Update</button>
                            <!-- <button class="btn btn-danger" data-dismiss="modal">Close</button> -->
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <?php endforeach; ?>

</div>
<!-- END container-fluid -->