<?php

defined('BASEPATH') or exit('No direct script access allowed');
class Featured_section_model extends CI_Model
{
    function add_featured_section($data)
    {
        $data = escape_array($data);

        if (isset($data['product_ids']) && !empty($data['product_ids']) && trim($data['product_type']) == 'custom_products') {
            $product_ids = implode(',', $data['product_ids']);
        } elseif (isset($data['digital_product_ids']) && !empty($data['digital_product_ids']) && trim($data['product_type']) == 'digital_product') {
            $product_ids = implode(',', $data['digital_product_ids']);
        } else {
            $product_ids = null;
        }

        // Prepare data for insertion or update
        $featured_data = [
            'title' => $data['title'],
            'short_description' => $data['short_description'],
            'product_type' => $data['product_type'],
            'categories' => (isset($data['categories']) && !empty($data['categories'])) ? implode(',', $data['categories']) : null,
            'product_ids' => $product_ids,
            'style' => $data['style']
        ];

        // Insert or update the database
        if (isset($data['edit_featured_section'])) {
            if (strtolower(trim($data['product_type'])) != 'custom_products' && strtolower(trim($data['product_type'])) != 'digital_product') {
                $featured_data['product_ids'] = null;
            }
            
            $this->db->set($featured_data)->where('id', $data['edit_featured_section'])->update('sections');
        } else {
            $this->db->insert('sections', $featured_data);
        }
    }


    public function get_section_list()
    {
        $offset = 0;
        $limit = 10;
        $sort = 'u.id';
        $order = 'ASC';
        $multipleWhere = '';

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
            $multipleWhere = ['id' => $search, 'title' => $search, 'short_description' => $search];
        }

        $count_res = $this->db->select(' COUNT(id) as `total` ');

        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $count_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $count_res->where($where);
        }

        $city_count = $count_res->get('sections')->result_array();

        foreach ($city_count as $row) {
            $total = $row['total'];
        }

        $search_res = $this->db->select(' * ');
        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $search_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $search_res->where($where);
        }

        $city_search_res = $search_res->order_by($sort, "asc")->limit($limit, $offset)->get('sections')->result_array();
        $bulkData = array();
        $bulkData['total'] = $total;
        $rows = array();
        $tempRow = array();
        foreach ($city_search_res as $row) {
            $row = output_escaping($row);

            $operate = '<div class="dropdown">
            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <a href="' . base_url('admin/featured-sections/?edit_id=' . $row['id']) . '" class="btn dropdown-item" title="Edit">
            <i class="fa fa-pen"></i> Edit
            </a>
              <a href="javascript:void(0)" class=" dropdown-item" id="delete-featured-section" data-id=' . $row['id'] . ' title="Delete" ><i class="fa fa-trash"></i> Delete</a></div>';


            $category_ids = explode(',', $row['categories']);
            $category_names = [];
            foreach ($category_ids as $id) {
                $category_name = fetch_details('categories', ['id' => $id], 'name');
                $category_names[] = isset($category_name) && !empty($category_name) ? output_escaping($category_name[0]['name']) : '';
            }


            $tempRow['id'] = $row['id'];
            $tempRow['title'] = $row['title'];
            $tempRow['short_description'] = $row['short_description'];
            $tempRow['style'] = ucfirst(str_replace('_', ' ', $row['style']));
            $tempRow['product_ids'] = $row['product_ids'];
            $tempRow['categories'] = isset($category_names) && !empty($category_names) ? implode(',', $category_names) : '';
            $tempRow['product_type'] = ucwords(str_replace('_', ' ', $row['product_type']));
            $tempRow['date'] = date('d-m-Y', strtotime($row['date_added']));

            $tempRow['operate'] = $operate;
            $rows[] = $tempRow;
        }

        $bulkData['rows'] = $rows;
        print_r(json_encode($bulkData));
    }
}
