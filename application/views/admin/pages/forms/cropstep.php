<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <!-- Main content -->
    <section class="content-header mt-4">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-8">
                    <h4>Crops step</h4>
                </div>
                <div class="col-sm-4 d-flex justify-content-end">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="<?= base_url('admin/home') ?>">Home</a></li>
                        <li class="breadcrumb-item active">Crops</li>
                    </ol>
                </div>
            </div>
        </div> <!-- /.container-fluid -->

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5">
                    <div class="card card-info">
                        <!-- form start -->
                        <form class="form-horizontal form-submit-event" action="<?= base_url('admin/crops_step/add_crops'); ?>" method="POST" enctype="multipart/form-data">
                            <div class="row">
                                <div class="card-body">
                                    <?php if (isset($fetched_data[0]['id'])) { ?>
                                        <input type="hidden" name="edit_cropstep" value="<?= @$fetched_data[0]['id'] ?>">
                                    <?php } ?>
                                    <div class="d-flex flex-wrap form-group gap-2">
                                        <label for="attribute_set" class="col-sm-3 col-form-label">Select Service <span class='text-danger text-sm'>*</span></label>
                                        <div class="col-sm-5">
                                            <select class="form-control" id="service_id" name="service_id">
                                                <option value=""> None </option>
                                                <?php foreach ($services_master as $row) { ?>
                                                    <option value="<?= $row['id'] ?>" <?php echo  isset($fetched_data[0]['service_id']) && $fetched_data[0]['service_id'] == $row['id'] ? 'selected' : ''; ?>> <?= $row['service_title']; ?> </option>
                                                <?php } ?>
                                            </select>
											<span class="text-danger"><?php echo form_error('service_id'); ?></span>
                                        </div>
										
										
										
                                        <?php if (empty($fetched_data[0]['id'])) { ?>
                                            <!--<div class="col-md-3">
                                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#attributeSet_add"><i class="fas fa-plus"></i></a>
                                                <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#attributeSet_list"><i class="fas fa-list"></i></a>
                                            </div>-->
                                        <?php } ?>
                                    </div>
									
									
									
									<div class="form-group row mt-2">
										<label for="attribute_set" class="col-sm-3 col-form-label">Select Crops <span class='text-danger text-sm'>*</span></label>
											<div class="col-sm-5">
												<select class="form-control" id="crop_id" name="crop_id">
													<option value=""> None </option>
													<?php foreach ($crop_master as $row) { ?>
														<option value="<?= $row['id'] ?>" <?php echo  isset($fetched_data[0]['crop_id']) && $fetched_data[0]['crop_id'] == $row['id'] ? 'selected' : ''; ?>> <?= $row['crop_title'] ?> </option>
													<?php } ?>
												</select>
												<span class="text-danger"><?php echo form_error('crop_id'); ?></span>
											</div>
                                    </div>
									
                                    <div class="form-group row mt-1">
                                        <label for="name" class="col-sm-3 col-form-label">Title <span class='text-danger text-sm'>*</span></label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" id="steps_title" placeholder="Name" name="steps_title" value="<?= @$fetched_data[0]['steps_title'] ?>">
											<span class="text-danger"><?php echo form_error('steps_title'); ?></span>
                                        </div>
                                    </div> <!-- attribute value  -->
									
									<div class="form-group row mt-2">
                                        <label for="name" class="col-sm-3 col-form-label">No. of days <span class='text-danger text-sm'>*</span></label>
                                        <div class="col-sm-5">
                                            <input type="text" class="form-control" id="no_of_days" placeholder="Name" name="no_of_days" value="<?= @$fetched_data[0]['no_of_days'] ?>">
											<span class="text-danger"><?php echo form_error('no_of_days'); ?></span>
                                        </div>
                                    </div>
									
									<!--<div class="form-group row mt-2">
                                        <label for="name" class="col-sm-3 col-form-label">Step images<span class='text-danger text-sm'>*</span></label>
                                        <div class="col-sm-5">
                                            <input type="file" id="steps_image" name="steps_image" class="form-control">
                                        </div>
                                    </div>-->
									
									<div class="form-group" ?>
                                    <label for="image">Main Image <span class='text-danger text-sm'>*</span><small> (Recommended Size : 131 x 131 pixels)</small></label>
                                    <div class="col-sm-10">
                                        <div class='col-md-3'><a class="uploadFile img btn btn-primary text-white btn-sm mt-2 mb-2" data-input='cropstep_input_image' data-isremovable='0' data-is-multiple-uploads-allowed='0' data-toggle="modal" data-target="#media-upload-modal" value="Upload Photo"><i class='fa fa-upload'></i> Upload</a></div>
                                        <?php
                                        if (file_exists(FCPATH . @$fetched_data[0]['steps_image']) && !empty(@$fetched_data[0]['steps_image'])) {
                                        ?>
                                            <label class="text-danger mt-3">*Only Choose When Update is necessary</label>
                                            <div class="container-fluid row image-upload-section">
                                                <div class="col-md-3 col-sm-12 shadow p-3 mb-5 bg-white rounded m-4 text-center grow image">
                                                    <div class='image-upload-div'><img class="img-fluid mb-2" src="<?= BASE_URL() . $fetched_data[0]['steps_image'] ?>" alt="Image Not Found"></div>
                                                    <input type="hidden" name="cropstep_input_image" value='<?php echo $fetched_data[0]['steps_image'] ?>'>
                                                </div>
                                            </div>
                                        <?php
                                        } else { ?>
                                            <div class="container-fluid row image-upload-section">
                                                <div class="col-md-3 col-sm-12 shadow p-3 mb-5 bg-white rounded m-4 text-center grow image d-none"></div>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
									
                                    
                                    <br>

                                    <div class="form-group">
                                        <button type="reset" class="btn btn-warning">Reset</button>
                                        <button type="submit" class="btn btn-success update_attri" id="submit_btn"><?= (isset($fetched_data[0]['id'])) ? 'Update Cropstep' : 'Add Cropstep' ?></button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div> <!--/.card-->
                </div>
				
				<div class="col-md-7">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                        </div>
                        <div class="card-innr">
                            <div class="card-head">
                                <h4 class="card-title">Attributes</h4>
                            </div>
                            <div class="gaps-1-5x"></div>
                            <table class='table-striped' id='category_table' data-toggle="table" data-url="<?= base_url('admin/crops_step/cropstep_list') ?>" data-click-to-select="true" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-show-columns="true" data-show-refresh="true" data-trim-on-search="false" data-sort-name="id" data-sort-order="desc" data-mobile-responsive="true" data-toolbar="" data-show-export="true" data-maintain-selected="true" data-export-types='["txt","excel","csv"]' data-export-options='{
                                "fileName": "attributes-list",
                                "ignoreColumn": ["operate"] 
                            }' data-query-params="queryParams">
                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="service" data-sortable="false">Service</th>
                                        <th data-field="crops" data-sortable="true">Crops</th>
                                        <th data-field="title" data-sortable="false">Title</th>
                                        <th data-field="cropstep_image" data-sortable="false">Image</th>
                                        <th data-field="nodays" data-sortable="false">Days</th>
                                        <th data-field="operate" data-sortable="false">Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div> 
                    </div>
                </div>
				
				<!--<div class="col-md-7">
                    <div class="card content-area p-4">
                        <div class="card-header border-0">
                        </div>
                        <div class="card-innr">
                            <div class="card-head">
                                <h4 class="card-title">Attributes</h4>
                            </div>
                            <div class="gaps-1-5x"></div>
                            <table class='table-striped' id='category_table' data-toggle="table" data-url="<?= base_url('admin/attribute_value/attribute_value_list') ?>" data-click-to-select="true" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-show-columns="true" data-show-refresh="true" data-trim-on-search="false" data-sort-name="id" data-sort-order="desc" data-mobile-responsive="true" data-toolbar="" data-show-export="true" data-maintain-selected="true" data-export-types='["txt","excel","csv"]' data-export-options='{
                                "fileName": "attributes-list",
                                "ignoreColumn": ["operate"] 
                            }' data-query-params="queryParams">
                                <thead>
                                    <tr>
                                        <th data-field="id" data-sortable="true">ID</th>
                                        <th data-field="attributes" data-sortable="false">Attributes</th>
                                        <th data-field="name" data-sortable="true">Name</th>
                                        <th data-field="status" data-sortable="false">Status</th>
                                        <th data-field="operate" data-sortable="false">Action</th>
                                    </tr>
                                </thead>
                            </table>
                        </div> 
                    </div>
                </div>--> <!--/.col-md-12-->
            </div> <!-- /.row -->
        </div> <!-- /.container-fluid -->

        <!-- Edit Attribute Modal -->
        <div class="modal fade edit-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="UpdateAttributeModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="ss">Edit Attribute here</h5>
                        <button type="button" id="attribute_modal_close" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body p-0">
                    </div>
                </div>
            </div>
        </div>
    </section> <!-- /.content -->
</div>

<?php if (empty($fetched_data[0]['id'])) { ?>

    <!-- Attribute Set Add Modal -->
    <div class="modal fade" id="attributeSet_add" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Add Attribute Set</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- form start -->
                                    <form class="form-horizontal form-submit-event" action="<?= base_url('admin/attribute_set/add_attribute_set'); ?>" method="POST" enctype="multipart/form-data">
                                        <div class="">
                                            <?php if (isset($fetched_data[0]['id'])) { ?>
                                                <input type="hidden" name="edit_attribute_set" value="<?= @$fetched_data[0]['id'] ?>">
                                            <?php } ?>
                                            <div class="form-group row">
                                                <label for="name" class="col-sm-2 col-form-label">Name <span class='text-danger text-sm'>*</span></label>
                                                <div class="col-md-6">
                                                    <input type="text" class="form-control" id="name" placeholder="Name" name="name" value="<?= @$fetched_data[0]['name'] ?>">
                                                </div>
                                            </div>
                                            <div class="d-flex flex-wrap form-group gap-2 mt-4">
                                                <button type="reset" class="btn btn-warning">Reset</button>
                                                <button type="submit" class="btn btn-success" id="submit_btn"><?= (isset($fetched_data[0]['id'])) ? 'Update Attribute Set' : 'Add Attribute Set' ?></button>
                                            </div>
                                        </div>
                                    </form>
                                </div> <!--/.col-md-12-->
                            </div> <!-- /.row -->
                        </div> <!-- /.container-fluid -->
                    </section>
                </div>
            </div>
        </div>
    </div>

    <!-- Attribute Set List Modal -->
    <div class="modal fade" id="attributeSet_list" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">List Of Attribute Set</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="card-body content-area">
                                        <div class="card-innr">
                                            <div class="card-head">
                                                <h4 class="card-title">Attribute Set</h4>
                                            </div>
                                            <div class="gaps-1-5x"></div>
                                            <table class='table-striped' id='category_table' data-toggle="table" data-url="<?= base_url('admin/attribute_set/attribute_set_list') ?>" data-click-to-select="true" data-side-pagination="server" data-pagination="true" data-page-list="[5, 10, 20, 50, 100, 200]" data-search="true" data-show-columns="true" data-show-refresh="true" data-trim-on-search="false" data-sort-name="id" data-sort-order="desc" data-mobile-responsive="true" data-toolbar="" data-show-export="true" data-maintain-selected="true" data-export-types='["txt","excel","csv"]' data-export-options='{
                                                "fileName": "attribute-set-list", 
                                                "ignoreColumn": ["state"]  
                                            }' data-query-params="queryParams">
                                                <thead>
                                                    <tr>
                                                        <th data-field="id" data-sortable="true">ID</th>
                                                        <th data-field="name" data-sortable="false">Name</th>
                                                        <th data-field="status" data-sortable="false">Status</th>
                                                        <th data-field="operate" data-sortable="false">Action</th>
                                                    </tr>
                                                </thead>
                                            </table>
                                        </div> <!-- .card-innr -->
                                    </div> <!-- .card-body -->
                                </div> <!-- /.col-md-12 -->
                            </div> <!-- /.row -->
                        </div> <!-- /.container-fluid -->
                    </section>
                </div>
            </div>
        </div>
    </div>

    <!-- New Edit Attribute Set Modal -->
    <div class="modal fade" id="editAttributeSetModal" tabindex="-1" role="dialog" aria-labelledby="editAttributeSetLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editAttributeSetLabel">Edit Attribute Set</h5>
                    <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-0">
                </div>
            </div>
        </div>
    </div>

<?php } ?>