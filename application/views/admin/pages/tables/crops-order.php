<div class="content-wrapper">
    <section class="content-header mt-4">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-8">
                    <h4>Manage Crops Order</h4>
                </div>
                <div class="col-sm-4 d-flex justify-content-end">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= base_url('admin/home') ?>">Home</a></li>
                        <li class="breadcrumb-item active">Crops Orders</li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12 main-content">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                        </div>
                        <div class="card-innr">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6 col-12 offset-md-3">
                                        <label for="subcategory_id" class="col-form-label p-2 fs-5 fw-bold">Category List</label>

                                        <div class="table-responsive">
                                            <table class="table table-borderless table">
                                                <thead>
                                                    <tr>
                                                        <th>Display Order</th>
                                                        <th>Name</th>
                                                        <th>Image</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="move order-container" id="sortable">
                                                    <?php
                                                    $i = 0;
                                                    if (!empty($categories)) {
                                                        foreach ($categories as $row) {
                                                    ?>
                                                            <tr class="bg-gray-light align-items-center h-25" id="category_id-<?= $row['id'] ?>">
                                                                <td><span> <?= $row['sort_order'] ?> </span></td>
                                                                <td><span><?= $row['crop_title'] ?></span></td>
                                                                <td><img src="<?= $row['crop_image'] ?>" class="w-25"></td>
                                                            </tr>
                                                        <?php
                                                            $i++;
                                                        }
                                                    } else {
                                                        ?>
                                                        <li class="list-group-item text-center h-25"> No Categories Exist </li>
                                                    <?php
                                                    }
                                                    ?>

                                                </tbody>
                                            </table>
                                        </div>
                                        <?php if (empty($categories)) { ?>
                                            <div class="text-center mt-3">
                                                <p class="text-muted">No sections available. Please add sections to manage their order.</p>
                                            </div>
                                        <?php } else {?>
                                        <button type="button" class="btn btn-block btn-success btn-lg mt-3" id="save_category_order">Save</button>
                                        <?php } ?>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
    </section>
</div>