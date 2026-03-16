<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Crops_model extends CI_Model
{
    public function __construct()
    {
        $this->load->database();
        $this->load->library(['ion_auth', 'form_validation']);
        $this->load->helper(['url', 'language', 'function_helper']);
    }
    public function get_crops($id = NULL, $limit = '', $offset = '', $sort = 'sort_order', $order = 'ASC', $slug = '', $ignore_status = '')
    {
		$categories = CROP_CATEGORIES;
        return  json_decode(json_encode($categories), 1);
    }
    public function get_crops_data()
    {		
        $sort = 'id';
        $order = 'ASC';
		$where = ['crop_status !=' => NULL];
		if (isset($_GET['id']))
            $where['id'] = $_GET['id'];
		$search_res = $this->db->select(' * ');
        if (isset($where) && !empty($where)) {
            $search_res->where($where);
        }

        $cat_search_res = $search_res->order_by($sort, "desc")->get(TBL_CROP_MASTER)->result_array();
		
		$data = [];

		foreach ($cat_search_res as $row) {
			$data[] = [
				'id'   => $row['id'],
				'text' => $row['crop_title'],
				'crop_title' => $row['crop_title'],
				'sort_order' => $row['sort_order'],
				'crop_image' => $row['crop_image']
			];
		}

		// $response['data'] = $data;

		return  json_decode(json_encode($data), 1);
    }

    public function delete_crops($id)
    {
        // Escape the ID to prevent SQL injection
        $id = escape_array($id);
    
        // Proceed with the deletion
        $this->db->trans_start();
        $this->db->where('id', $id)->delete(TBL_CROP_MASTER);
        $this->db->trans_complete();
    
        // Return the transaction status
        return $this->db->trans_status();
    }

    public function get_crops_list()
    {
        $offset = 0;
        $limit = 10;
        $sort = 'id';
        $order = 'ASC';
        $multipleWhere = '';
        $where = ['crop_status !=' => NULL];

        if (isset($_GET['id']))
            $where['id'] = $_GET['id'];
        if (isset($_GET['offset']))
            $offset = $_GET['offset'];
        if (isset($_GET['limit']))
            $limit = $_GET['limit'];

        if (isset($_GET['sort']))
            if ($_GET['sort'] == 'id') {
                $sort = "id";
            } else {
                $sort = $_GET['sort'];
            }
        if (isset($_GET['order']))
            $order = $_GET['order'];

        if (isset($_GET['search']) and $_GET['search'] != '') {
            $search = $_GET['search'];
            $multipleWhere = ['`id`' => $search, '`crop_title`' => $search];
        }

        $count_res = $this->db->select(' COUNT(id) as `total` ');

        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $count_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $count_res->where($where);
        }
        $cat_count = $count_res->get(TBL_CROP_MASTER)->result_array();

        foreach ($cat_count as $row) {
            $total = $row['total'];
        }

        $search_res = $this->db->select(' * ');
        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $search_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $search_res->where($where);
        }

        $cat_search_res = $search_res->order_by($sort, "desc")->limit($limit, $offset)->get(TBL_CROP_MASTER)->result_array();
        $bulkData = array();
        $bulkData['total'] = $total;
        $rows = array();
        $tempRow = array();


        foreach ($cat_search_res as $row) {



            $operate = '<div class="dropdown">
            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a class="dropdown-item" href=' . base_url('admin/crops/create_crops') . '?edit_id=' . $row['id'] . '><i class="fa fa-pen"></i> Edit</a>
              <a href="javascript:void(0)" class="delete-crops dropdown-item" data-id=' . $row['id'] . ' title="Delete" ><i class="fa fa-trash"></i> Delete</a></div>';

            $tempRow['id'] = $row['id'];

            $tempRow['crop_title'] = output_escaping($row['crop_title']);
            if ($row['crop_status'] == '1') {
                $tempRow['crop_status'] = '<a class="badge bg-success text-white" ></a>';
                $tempRow['crop_status'] .= '<a class="form-switch update_active_status_crops " data-table="'.TBL_CROP_MASTER.'" title="Deactivate" href="javascript:void(0)" data-id="' . $row['id'] . '" data-status="' . $row['crop_status'] . '" ><input class="form-check-input " type="checkbox" role="switch" checked></a>';
            } else {
                $tempRow['crop_status'] = '<a class="badge bg-danger text-white" ></a>';
                $tempRow['crop_status'] .= '<a class="form-switch update_active_status_crops mr-1 mb-1" data-table="'.TBL_CROP_MASTER.'" title="Deactivate" href="javascript:void(0)" data-id="' . $row['id'] . '" data-status="' . $row['crop_status'] . '" ><input class="form-check-input " type="checkbox" role="switch" ></a>';
            }
            if (empty($row['crop_image']) || file_exists(FCPATH  . $row['crop_image']) == FALSE) {
                $row['crop_image'] = base_url() . NO_IMAGE;
                $row['image_main'] = base_url() . NO_IMAGE;
            } else {
                $row['image_main'] = base_url($row['crop_image']);
                $row['crop_image'] = get_image_url($row['crop_image'], 'thumb', 'sm');
            }
            $tempRow['crop_image'] = "<div class='image-box-100'><a href='" . $row['image_main'] . "' data-toggle='lightbox' data-gallery='gallery'> <img src='" . $row['crop_image'] . "' class='h-25 w-75' ></a></div>";

            $tempRow['operate'] = $operate;
            $rows[] = $tempRow;
        }
        $bulkData['rows'] = $rows;
        print_r(json_encode($bulkData));
    }

    public function add_crops($data)
    {
        $data = escape_array($data);

        if (isset($data['edit_crops']) && !empty($data['edit_crops'])) {
            $crops_id = fetch_details(TBL_CROP_MASTER, ['id' => $data['edit_crops']]);
            $crops_name = $crops_id[0]['crop_title'];
        } else {
            $crops_id = "";
            $crops_name = "";
        }
        if ($crops_name != $data['crop_title']) {
            $cat_data = [
                'crop_title' => $data['crop_title'],
                'crop_category_id' => (isset($data['crop_category_id']) && !empty($data['crop_category_id'])) ? $data['crop_category_id'] : '0',
                'crop_status' => '1',
            ];
        } else {
            $cat_data = [
                'crop_title' => $data['crop_title'],
                'crop_category_id' => (isset($data['crop_category_id']) && !empty($data['crop_category_id'])) ? $data['crop_category_id'] : '0',
                'crop_status' => '1',
            ];
        }

        if (isset($data['edit_crops']) && !empty($data['edit_crops'])) {

            unset($cat_data['crop_status']);
            if (isset($data['crops_input_image']) && !empty($data['crops_input_image'])) {
                $cat_data['crop_image'] = $data['crops_input_image'];
            }

            $this->db->set($cat_data)->where('id', $data['edit_crops'])->update(TBL_CROP_MASTER);
        } else {
            if (isset($data['crops_input_image']) && ($data['crops_input_image'])) {
                $cat_data['crop_image'] = $data['crops_input_image'];
            }
            $this->db->insert(TBL_CROP_MASTER, $cat_data);
        }
    }
	
	public function add_cropstep($data='', $files='')
    {
        $data = escape_array($data);
		
		//echo "<pre>";print_r($files);
		//echo "<pre>";print_r($data);
		//echo "<pre>";print_r($data['description']);die;
		$cropstep_data = [
            'service_id' => $data['service_id'],
            'crop_id' => $data['crop_id'],
            'steps_title' => $data['steps_title'],
            'no_of_days' => $data['no_of_days'],
            'steps_image' => isset($data['cropstep_input_image']) ? $data['cropstep_input_image'] :''
        ];
		
        
		if (isset($data['edit_cropstep']) && !empty($data['edit_cropstep'])) {
			$this->db->set($cropstep_data)->where('id', $data['edit_cropstep'])->update(TBL_CROP_STEPS);
			
			//echo "<pre>";print_r($files);
			//echo "<pre>";print_r($data);die;
			//echo "<pre>";print_r($data['description']);die;
			//$this->db->where('crop_step_id', $data['edit_cropstep'])->delete(TBL_CROP_STEPS_DETAILS);
			
			if(!empty($data['description'][0]))
			{
				foreach($data['description'] as $key => $desc)
				{
					// file upload 
					
					$image_name = '';

					if(!empty($_FILES['images']['name'][$key])){

						$_FILES['file']['name']     = $_FILES['images']['name'][$key];
						$_FILES['file']['type']     = $_FILES['images']['type'][$key];
						$_FILES['file']['tmp_name'] = $_FILES['images']['tmp_name'][$key];
						$_FILES['file']['error']    = $_FILES['images']['error'][$key];
						$_FILES['file']['size']     = $_FILES['images']['size'][$key];

						$config['upload_path']   = './uploads/cropstep/';
						$config['allowed_types'] = 'jpg|jpeg|png|gif';

						$this->load->library('upload', $config);
						$this->upload->initialize($config);

						if($this->upload->do_upload('file')){
							$uploadData = $this->upload->data();
							$image_name = $uploadData['file_name'];
						}
					}
					
					// end file upload
					
					$cropstep_details_data = [
						'crop_step_id' => $data['edit_cropstep'],
						'image' => $image_name,
						'step_details' => $desc,
						'preventive_measures_details' => $data['preventive'][$key] ?? '',
						'control_measures_details' => $data['control'][$key] ?? ''
						
					];
					
					$this->db->insert(TBL_CROP_STEPS_DETAILS, $cropstep_details_data);
				}
			}
			
			
			foreach($data['edit_description'] as $key => $editdesc)
			{
				//echo 'hello '.$editdesc; die;
				// file upload 
				$edit_image_name = '';

				if(!empty($_FILES['edit_images']['name'][$key])){

					$_FILES['file']['name']     = $_FILES['edit_images']['name'][$key];
					$_FILES['file']['type']     = $_FILES['edit_images']['type'][$key];
					$_FILES['file']['tmp_name'] = $_FILES['edit_images']['tmp_name'][$key];
					$_FILES['file']['error']    = $_FILES['edit_images']['error'][$key];
					$_FILES['file']['size']     = $_FILES['edit_images']['size'][$key];

					$config['upload_path']   = './uploads/cropstep/';
					$config['allowed_types'] = 'jpg|jpeg|png|gif';

					$this->load->library('upload', $config);
					$this->upload->initialize($config);

					if($this->upload->do_upload('file')){
						$uploadData = $this->upload->data();
						$edit_image_name = $uploadData['file_name'];
					}
				}
				
				// end file upload
				if(!empty($edit_image_name))
				{
					$cropstep_details_edit_data = [
						//'crop_step_id' => $last_added_id,
						'image' => $edit_image_name,
						'step_details' => $editdesc,
						'preventive_measures_details' => $data['edit_preventive'][$key] ?? '',
						'control_measures_details' => $data['edit_control'][$key] ?? ''
						
					];
				}
				else{
					$cropstep_details_edit_data = [
						//'crop_step_id' => $last_added_id,
						'step_details' => $editdesc,
						'preventive_measures_details' => $data['edit_preventive'][$key] ?? '',
						'control_measures_details' => $data['edit_control'][$key] ?? ''
						
					];
				}
				
				$this->db->set($cropstep_details_edit_data)->where('id', $data['cropstep_dtls_id'][$key])->update(TBL_CROP_STEPS_DETAILS);
			}
			
				
			
		}
		else
		{
			$this->db->insert(TBL_CROP_STEPS, $cropstep_data);
			$last_added_id = $this->db->insert_id();
			
			foreach($data['description'] as $key => $desc)
			{
				
				// file upload 
				
				$image_name = '';

				if(!empty($_FILES['images']['name'][$key])){

					$_FILES['file']['name']     = $_FILES['images']['name'][$key];
					$_FILES['file']['type']     = $_FILES['images']['type'][$key];
					$_FILES['file']['tmp_name'] = $_FILES['images']['tmp_name'][$key];
					$_FILES['file']['error']    = $_FILES['images']['error'][$key];
					$_FILES['file']['size']     = $_FILES['images']['size'][$key];

					$config['upload_path']   = './uploads/cropstep/';
					$config['allowed_types'] = 'jpg|jpeg|png|gif';

					$this->load->library('upload', $config);
					$this->upload->initialize($config);

					if($this->upload->do_upload('file')){
						$uploadData = $this->upload->data();
						$image_name = $uploadData['file_name'];
					}
				}
				
				// end file upload
				
				$cropstep_details_data = [
					'crop_step_id' => $last_added_id,
					'image' => $image_name,
					'step_details' => $desc,
					'preventive_measures_details' => $data['preventive'][$key] ?? '',
					'control_measures_details' => $data['control'][$key] ?? ''
					
				];
				
				$this->db->insert(TBL_CROP_STEPS_DETAILS, $cropstep_details_data);
			}
		}
		
		
		// end code
	}
	
	public function add_cropstep_11_03_2026($data='', $files='')
    {
        $data = escape_array($data);
		
		echo "<pre>";print_r($files);
		echo "<pre>";print_r($data);die;
		
		$cropstep_data = [
            'service_id' => $data['service_id'],
            'crop_id' => $data['crop_id'],
            'steps_title' => $data['steps_title'],
            'no_of_days' => $data['no_of_days'],
            'steps_image' => $data['cropstep_input_image']
        ];
		
		$arr = array();
		$desc_count = 0;
		if(isset($data['description']))
		{
			foreach($data['description'] as $val)
			{
				if($val != '')
				{
					$arr['description'][] = $val; //description
					
				}
			}
			
			
		}
		else{
			$arr['description'] = '';
		}
		
		$arr['preventive'] = $data['preventive'][0];
		$arr['control'] = $data['control'][0];
		
		
		//echo "<pre>";print_r($arr);die;
		if(isset($arr['description']))
		{
			$desc_count = count($arr['description']);
		}
		
		if($desc_count == 1)
		{
			$count = count($files['images']['name']);

			for ($i = 0; $i < $count; $i++) {

				// Skip empty upload
				if ($files['images']['error'][$i] == 4) {
					continue;
				}

				$_FILES['file']['name']     = $files['images']['name'][$i];
				$_FILES['file']['type']     = $files['images']['type'][$i];
				$_FILES['file']['tmp_name'] = $files['images']['tmp_name'][$i];
				$_FILES['file']['error']    = $files['images']['error'][$i];
				$_FILES['file']['size']     = $files['images']['size'][$i];

				$config['upload_path']   = 'uploads/cropstep/';
				$config['allowed_types'] = 'jpg|jpeg|png|gif';

				$this->load->library('upload', $config);
				$this->upload->initialize($config);

				if ($this->upload->do_upload('file')) {

					$uploadData = $this->upload->data();
					$picture = $uploadData['file_name'];

				} else {

					echo $this->upload->display_errors();
				}
			}
		}
        
		if (isset($data['edit_cropstep']) && !empty($data['edit_cropstep'])) {
			$this->db->set($cropstep_data)->where('id', $data['edit_cropstep'])->update(TBL_CROP_STEPS);
			
			echo "<pre>";print_r($files);
			echo "<pre>";print_r($data);die;
			 $this->db->where('crop_step_id', $data['edit_cropstep'])->delete(TBL_CROP_STEPS_DETAILS);
			
			foreach($arr['description'] as $k=>$val)
			{
				
				// file upload 
				
				 // Skip empty upload
				/*if ($files['images']['error'][$k] == 4) {
					continue;
				}*/
				if($desc_count>1)
				{
					$picture = null;
					
					$_FILES['file']['name']     = $files['images']['name'][$k];
					$_FILES['file']['type']     = $files['images']['type'][$k];
					$_FILES['file']['tmp_name'] = $files['images']['tmp_name'][$k];
					$_FILES['file']['error']    = $files['images']['error'][$k];
					$_FILES['file']['size']     = $files['images']['size'][$k];

					$config['upload_path']   = 'uploads/cropstep/';
					$config['allowed_types'] = 'jpg|jpeg|png|gif';

					$this->load->library('upload', $config);
					$this->upload->initialize($config);

					if ($this->upload->do_upload('file')) {

						$uploadData = $this->upload->data();
						$picture = $uploadData['file_name'];

					} 
					/*else {

						echo $this->upload->display_errors();
					}*/
				}
				
				// end file upload
				
				$cropstep_details_data = [
					'crop_step_id' => $data['edit_cropstep'],
					'image' => $picture,
					'step_details' => $val,
					'preventive_measures_details' => $arr['preventive'],
					'control_measures_details' => $arr['control']
					
				];
				
				$this->db->insert(TBL_CROP_STEPS_DETAILS, $cropstep_details_data);
			}
			
		}
		else
		{
			$this->db->insert(TBL_CROP_STEPS, $cropstep_data);
			$last_added_id = $this->db->insert_id();
			
			foreach($arr['description'] as $k=>$val)
			{
				
				// file upload 
				
				 // Skip empty upload
				/*if ($files['images']['error'][$k] == 4) {
					continue;
				}*/
				if($desc_count>1)
				{
					$picture = null;
					
					$_FILES['file']['name']     = $files['images']['name'][$k];
					$_FILES['file']['type']     = $files['images']['type'][$k];
					$_FILES['file']['tmp_name'] = $files['images']['tmp_name'][$k];
					$_FILES['file']['error']    = $files['images']['error'][$k];
					$_FILES['file']['size']     = $files['images']['size'][$k];

					$config['upload_path']   = 'uploads/cropstep/';
					$config['allowed_types'] = 'jpg|jpeg|png|gif';

					$this->load->library('upload', $config);
					$this->upload->initialize($config);

					if ($this->upload->do_upload('file')) {

						$uploadData = $this->upload->data();
						$picture = $uploadData['file_name'];

					} 
					/*else {

						echo $this->upload->display_errors();
					}*/
				}
				
				// end file upload
				
				$cropstep_details_data = [
					'crop_step_id' => $last_added_id,
					'image' => $picture,
					'step_details' => $val,
					'preventive_measures_details' => $arr['preventive'],
					'control_measures_details' => $arr['control']
					
				];
				
				$this->db->insert(TBL_CROP_STEPS_DETAILS, $cropstep_details_data);
			}
		}
		
		
		// end code
	}
	
	public function get_cropstep_list($offset = 0, $limit = 10, $sort = 'id', $order = 'ASC')
    {
        $multipleWhere = '';

        if (isset($_GET['offset']))
            $offset = $_GET['offset'];
        if (isset($_GET['limit']))
            $limit = $_GET['limit'];

        if (isset($_GET['sort']))
            if ($_GET['sort'] == 'id') {
                $sort = "crstp.id";
            } else {
                $sort = $_GET['sort'];
            }
        if (isset($_GET['order']))
            $order = $_GET['order'];

        if (isset($_GET['search']) and $_GET['search'] != '') {
            $search = $_GET['search'];
            $multipleWhere = ['crstp.id' => $search, 'sm.service_title' => $search, 'crstp.steps_title' => $search , 'crpm.crop_title'=> $search];
        }

        $count_res = $this->db->select(' COUNT(crstp.id) as `total` ')->join(TBL_SERVICE_MASTER . ' sm', 'crstp.service_id=sm.id', 'left')->join(TBL_CROP_MASTER .' crpm', 'crstp.crop_id=crpm.id', 'left');

        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $count_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $count_res->where($where);
        }

        $attr_count = $count_res->get(TBL_CROP_STEPS .' crstp')->result_array();
		

        foreach ($attr_count as $row) {
            $total = $row['total'];
        }
		//echo 'total-> '.$total;die;

        $search_res = $this->db->select(' crstp.*,sm.service_title as service_name, crpm.crop_title as crop_name')->join(TBL_SERVICE_MASTER . ' sm', 'crstp.service_id=sm.id', 'left')->join(TBL_CROP_MASTER .' crpm', 'crstp.crop_id=crpm.id', 'left');
        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $search_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $search_res->where($where);
        }

        $city_search_res = $search_res->order_by($sort, $order)->limit($limit, $offset)->get(TBL_CROP_STEPS .' crstp')->result_array();
        $bulkData = array();
        $bulkData['total'] = $total;
        $rows = array();
        $tempRow = array();
		//echo "<pre>";print_r($city_search_res);die;
        foreach ($city_search_res as $row) {
            $row = output_escaping($row);
			
			
			$operate = '<div class="dropdown">
            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">

            <a href=" '. base_url('admin/crops_step'). '?edit_id=' . $row['id'] . ' " class="edit_btn-n dropdown-item" title="View"><i class="fa fa-pen"></i>Edit</a>
			
			<a href="javascript:void(0)" class="delete-cropstep dropdown-item" title="Delete" data-id="' . $row['id'] . '"> <i class="fa fa-trash"></i> Delete </a>';
			
            $tempRow['id'] = $row['id'];
            $tempRow['service'] = $row['service_name'];
            $tempRow['crops'] = $row['crop_name'];
            $tempRow['title'] = $row['steps_title'];
            $tempRow['nodays'] = $row['no_of_days'];
            $tempRow['operate'] = $operate;
			
			
			if (empty($row['steps_image']) || file_exists(FCPATH  . $row['steps_image']) == FALSE) {
                $row['steps_image'] = base_url() . NO_IMAGE;
                $row['image_main'] = base_url() . NO_IMAGE;
            } else {
                $row['image_main'] = base_url($row['steps_image']);
                $row['steps_image'] = get_image_url($row['steps_image'], 'thumb', 'sm');
            }
            $tempRow['cropstep_image'] = "<div class='image-box-100'><a href='" . $row['image_main'] . "' data-toggle='lightbox' data-gallery='gallery'> <img src='" . $row['steps_image'] . "' class='h-25 w-75' ></a></div>";
			
            $rows[] = $tempRow;
        }
        $bulkData['rows'] = $rows;
        print_r(json_encode($bulkData));
    }
	
	public function delete_cropstep($id)
    {
        // Escape the ID to prevent SQL injection
        $id = escape_array($id);
    
        // Proceed with the deletion
        $this->db->trans_start();
        $this->db->where('id', $id)->delete(TBL_CROP_STEPS);
        $this->db->trans_complete();
    
        // Return the transaction status
        return $this->db->trans_status();
    }
	
	public function delete_cropstep_details($id)
    {
        // Escape the ID to prevent SQL injection
        $id = escape_array($id);
    
        // Proceed with the deletion
        $this->db->trans_start();
        $this->db->where('id', $id)->delete(TBL_CROP_STEPS_DETAILS);
        $this->db->trans_complete();
    
        // Return the transaction status
        return $this->db->trans_status();
    }

}
