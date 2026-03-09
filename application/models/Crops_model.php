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

}
