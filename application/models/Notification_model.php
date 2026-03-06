<?php
if (!defined('BASEPATH')) exit('No direct script access allowed');
class Notification_model extends CI_Model
{

    public function add_notification($data)
    {
        $data = escape_array($data);
        $notification_data = array(
            'title' => $data['title'],
            'message' => $data['message'],
            'type' => $data['type'],
            'send_to' => $data['send_to'],
            'users_id' => (isset($data['users_id']) && !empty($data['users_id'])) ? $data['users_id'] : 0,
        );

        if (isset($data['type']) && $data['type'] == 'categories') {
            $notification_data['type_id'] = $data['category_id'];
        }
        if (isset($data['type']) && $data['type'] == 'products') {
            $notification_data['type_id'] = $data['product_id'];
        }
        if (isset($data['type']) && $data['type'] == 'notification_url') {
            $notification_data['link'] = $data['link'];
        }
        if (isset($data['send_to']) && $data['send_to'] == 'specific_user') {
            $notification_data['users_id'] = stripslashes($data['select_user_id']);
        }

        if (isset($data['image']) && !empty($data['image'])) {
            $notification_data['image'] = $data['image'];
        }
        return $this->db->insert('notifications', $notification_data);
    }

    function get_notifications($offset, $limit, $sort, $order, $user_id = null)
    {
        $notification_data = [];

        // Build the base query for count
        $this->db->select('COUNT(id) as `total`');
        if ($user_id !== null) {
            $this->db->group_start()
                ->where("JSON_CONTAINS(users_id, '\"$user_id\"')")
                ->or_where("users_id", '0')
                ->group_end();
        } else {
            $this->db->where("users_id", '0');
        }
        $count_res = $this->db->get('notifications')->result_array();

        // Build the search query
        $this->db->select('*')->order_by($sort, $order)->limit($limit, $offset);
        if ($user_id !== null) {
            $this->db->group_start()
                ->where("JSON_CONTAINS(users_id, '\"$user_id\"')")
                ->or_where("users_id", '0')
                ->group_end();
        } else {
            $this->db->where("users_id", '0');
        }
        $search_res = $this->db->get('notifications')->result_array();

        for ($i = 0; $i < count($search_res); $i++) {
            $search_res[$i]['title'] = output_escaping($search_res[$i]['title']);
            $search_res[$i]['message'] = output_escaping($search_res[$i]['message']);
            $search_res[$i]['send_to'] = output_escaping($search_res[$i]['send_to']);
            $search_res[$i]['users_id'] = output_escaping($search_res[$i]['users_id']);

            if (empty($search_res[$i]['image'])) {
                $search_res[$i]['image'] = '';
            } else {
                if (file_exists(FCPATH . $search_res[$i]['image']) == FALSE) {
                    $search_res[$i]['image'] = base_url() . NO_IMAGE;
                } else {
                    $search_res[$i]['image'] = base_url() . $search_res[$i]['image'];
                }
            }
            if (empty($search_res[$i]['link'])) {
                $search_res[$i]['link'] = '';
            }
        }
        $notification_data['total'] = $count_res[0]['total'];
        $notification_data['data'] = $search_res;

        return $notification_data;
    }


    public function get_notifications_data($offset = 0, $limit = 10, $sort = 'read_by', $order = 'ASC')
    {

        $multipleWhere = '';
        if (isset($_GET['offset']))
            $offset = $_GET['offset'];
        if (isset($_GET['limit']))
            $limit = $_GET['limit'];

        if (isset($_GET['sort']))
            if ($_GET['sort'] == 'read_by') {
                $sort = "read_by";
            } else {
                $sort = $_GET['sort'];
            }
        if (isset($_GET['order']))
            $order = $_GET['order'];

        if (isset($_GET['search']) and $_GET['search'] != '') {
            $search = $_GET['search'];
            $multipleWhere = ['id' => $search, 'title' => $search, 'message' => $search];
        }

        if (isset($_GET['message_type']) && ($_GET['message_type'] != '')) {
            $where = ('read_by =' . $_GET['message_type']);
        }

        $count_res = $this->db->select(' COUNT(id) as `total` ');

        if (isset($multipleWhere) && !empty($multipleWhere)) {
            $count_res->or_like($multipleWhere);
        }
        if (isset($where) && !empty($where)) {
            $count_res->where($where);
        }
        $city_count = $count_res->get('system_notification')->result_array();

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

        $city_search_res = $search_res->order_by($sort, $order)->limit($limit, $offset)->get('system_notification')->result_array();

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
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">';

            // Check if type is not 'flash sale' before adding the edit button
            if ($row['type'] !== 'flash_sale') {
                $operate .= '<a class="dropdown-item" href=' . base_url('admin/orders/edit_orders') . '?edit_id=' . $row['type_id'] . '><i class="fa fa-pen"></i> Edit</a>';
            }

            $operate .= '<a href="javascript:void(0)" class="delete_system_noti dropdown-item" data-id=' . $row['id'] . ' title="Delete" ><i class="fa fa-trash"></i> Delete</a></div>';

            $tempRow['id'] = $row['id'];
            $tempRow['title'] = $row['title'];
            $tempRow['message'] = $row['message'];
            $tempRow['type'] = str_replace('_', ' ', $row['type']);
            $tempRow['type_id'] = $row['type_id'];
            $tempRow['read_by'] = ($row['read_by'] == 1) ? '<label class="badge bg-primary">Read</label>' : '<label class="badge bg-secondary">Un-Read</label>';
            $tempRow['operate'] = $operate;
            $rows[] = $tempRow;
        }

        $bulkData['rows'] = $rows;
        print_r(json_encode($bulkData));
    }

    public function get_notification_list($offset = 0, $limit = 10, $sort = 'id', $order = 'ASC')
    {
        $multipleWhere = '';
        if (isset($_GET['offset']))
            $offset = $_GET['offset'];
        if (isset($_GET['limit']))
            $limit = $_GET['limit'];

        if (isset($_GET['sort']))
            $sort = ($_GET['sort'] == 'id') ? "id" : $this->db->escape($_GET['sort']);
        if (isset($_GET['order']))
            $order = $_GET['order'];

        if (isset($_GET['search']) && $_GET['search'] != '') {
            $search = $_GET['search'];
            $multipleWhere = ['id' => $search, 'title' => $search, 'message' => $search, 'type' => $search, 'send_to' => $search];
        }

        $count_res = $this->db->select('COUNT(id) as `total`');

        if (!empty($multipleWhere)) {
            $count_res->or_like($multipleWhere);
        }

        if (isset($_GET['type']) && $_GET['type'] != null) {
            $count_res->where("type", $_GET['type']);
        }

        $city_count = $count_res->get('notifications')->result_array();
        $total = 0;
        if (!empty($city_count)) {
            $total = $city_count[0]['total'];
        }

        $search_res = $this->db->select('*');
        if (!empty($multipleWhere)) {
            $search_res->or_like($multipleWhere);
        }
        if (isset($_GET['type']) && $_GET['type'] != null) {
            $search_res->where("type", $_GET['type']);
        }

        $city_search_res = $search_res->order_by($sort, $order)->limit($limit, $offset)->get('notifications')->result_array();
        $bulkData = array();
        $bulkData['total'] = $total;
        $rows = array();

        foreach ($city_search_res as $row) {
            $row = output_escaping($row);
            // echo "<pre>";
            // print_r($row);
            $operate = '<div class="dropdown">
            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <a href="javascript:void(0)" class="delete_notifications dropdown-item" data-id=' . $row['id'] . ' title="Delete" ><i class="fa fa-trash"></i> Delete</a></div>';

            $tempRow = array();
            $tempRow['id'] = $row['id'];
            $tempRow['title'] = $row['title'];
            $tempRow['type'] = (str_replace('_', " ", $row['type']));
            $tempRow['message'] = $row['message'];
            $tempRow['send_to'] = ucwords(str_replace('_', " ", $row['send_to']));
            $tempRow['users_id'] = str_replace(array('[', ']', '"'), '', $row['users_id']);

            $type_id = $row['type_id'];

            if ($row['type'] == 'categories') {
                $category_details = fetch_details('categories', ['id' => $type_id], 'id,slug');
                if (!empty($category_details) && isset($category_details[0]['id'])) {
                    $tempRow['type_id'] = $category_details[0]['id'];
                    $row['link'] = base_url('products/category/' . $category_details[0]['slug']);
                }
            } elseif ($row['type'] == 'products') {
                $product_details = fetch_details('products', ['id' => $type_id], 'id,slug');
                if (!empty($product_details) && isset($product_details[0]['id'])) {
                    $tempRow['type_id'] = $product_details[0]['id'];
                    $row['link'] = base_url('products/' . $product_details[0]['slug']);
                }
            } elseif ($row['type'] == 'notification_url') {
                $row['link'] = $row['link'];
            } else {
                $tempRow['type_id'] = ""; // For other types, just use the type_id directly
                $row['link'] = '';
            }

            $user_names = array();
            if (isset($row['users_id']) && $row['users_id'] != 0 && !empty($row['users_id'])) {
                $json_array = $row['users_id'];
                $users = json_decode($json_array, true);
                foreach ($users as $user_id) {
                    $username = fetch_details('users', ['id' => $user_id], 'username');
                    if (!empty($username)) {
                        $user_names[] = $username[0]['username'];
                    }
                }
                $tempRow['users_id'] = implode(' ', $user_names);
            }

            if (empty($row['image'])) {
                $row['image'] = '';
            } else {
                if (file_exists(FCPATH . $row['image']) == FALSE) {
                    $row['image'] = base_url() . NO_IMAGE;
                } else {
                    $row['image'] = base_url() . $row['image'];
                }
            }

            $tempRow['link'] = isset($row['link']) ? $row['link'] : '';
            $tempRow['link'] = '<a href="' . $tempRow['link'] . '" target="_blank" class="text-primary">' . $tempRow['link'] . '</a>';
            $tempRow['image_src'] = $row['image'];
            $tempRow['image'] = "<div class='image-box-100' ><a href='" . $row['image'] . "' data-toggle='lightbox'> <img src='" . $row['image'] . "' class='img-fluid rounded col-md-3'></a></div>";

            $tempRow['operate'] = $operate;
            $rows[] = $tempRow;
        }

        $bulkData['rows'] = $rows;
        print_r(json_encode($bulkData));
    }


    public function mark_all_as_read()
    {
        if (update_details(['read_by' => '1'], ['read_by' => 0], 'system_notification')) {
            $response_data['error'] =  false;
            $response_data['message'] =  'All notifications marked as read successfully.';
        } else {
            $response_data['error'] =  true;
            $response_data['message'] =  'Opps! Something went wrong.';
        }
        print_r(json_encode($response_data));
    }
}
