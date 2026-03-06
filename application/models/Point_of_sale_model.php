<?php

defined('BASEPATH') or exit('No direct script access allowed');
class Point_of_sale_model extends CI_Model
{
    function get_users($search_term = "")
    {
        // Fetch users
        $this->db->select('*');
        // Search by username, mobile, or email
        $this->db->group_start();
        $this->db->like('username', $search_term);
        $this->db->or_like('mobile', $search_term);
        $this->db->or_like('email', $search_term);
        $this->db->group_end();
        $this->db->where('active', 1);
        $fetched_records = $this->db->get('users');
        $users = $fetched_records->result_array();

        // Initialize Array with fetched data
        $data = array();
        foreach ($users as $user) {
            $data[] = array("id" => $user['id'], "text" => $user['username'], "number" => $user['mobile'], "email" => $user['email']);
        }
        return $data;
    }
}
