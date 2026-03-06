<?php

defined('BASEPATH') or exit('No direct script access allowed');
class Payment_request_model extends CI_Model
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(['ion_auth', 'form_validation']);
        $this->load->helper(['url', 'language', 'function_helper']);
    }

function get_payment_request_list()
{
    $offset = isset($_GET['offset']) ? intval($_GET['offset']) : 0;
    $limit = isset($_GET['limit']) ? intval($_GET['limit']) : 10;
    $sort = isset($_GET['sort']) ? ($_GET['sort'] === 'id' ? 'pr.id' : $_GET['sort']) : 'pr.id';
    $order = isset($_GET['order']) ? $_GET['order'] : 'ASC';
    $search = isset($_GET['search']) ? trim($_GET['search']) : '';

    // Count query
    $this->db->select('COUNT(pr.id) as total');
    $this->db->from('payment_requests pr');
    $this->db->join('users u', 'u.id = pr.user_id');

    if (!empty($search)) {
        $this->db->group_start();
        $this->db->like('pr.id', $search);
        $this->db->or_like('u.username', $search);
        $this->db->or_like('u.email', $search);
        $this->db->or_like('u.mobile', $search);
        $this->db->group_end();
    }

    $count_query = $this->db->get();
    $total = ($count_query->num_rows() > 0) ? $count_query->row()->total : 0;

    // Data query
    $this->db->select('u.username, pr.*');
    $this->db->from('payment_requests pr');
    $this->db->join('users u', 'u.id = pr.user_id');

    if (!empty($search)) {
        $this->db->group_start();
        $this->db->like('pr.id', $search);
        $this->db->or_like('u.username', $search);
        $this->db->or_like('u.email', $search);
        $this->db->or_like('u.mobile', $search);
        $this->db->group_end();
    }

    $this->db->order_by($sort, $order);
    $this->db->limit($limit, $offset);

    $query = $this->db->get();
    $result = $query->result_array();

    $rows = [];
    foreach ($result as $row) {
        $status_labels = [
            '0' => '<span class="badge bg-success">Pending</span>',
            '1' => '<span class="badge bg-primary">Approved</span>',
            '2' => '<span class="badge bg-danger">Rejected</span>',
        ];

        $row = output_escaping($row);

        $operate = '<div class="dropdown">
            <a class="" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              <i class="fas fa-ellipsis-v"></i>
            </a>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
            <a href="javascript:void(0)" class="edit_request dropdown-item" title="Edit" data-target="#payment_request_modal" data-toggle="modal"><i class="fa fa-pen"></i> Edit</a>
            </div>
        </div>';

        $rows[] = [
            'id' => $row['id'],
            'user_id' => $row['user_id'],
            'user_name' => $row['username'],
            'payment_type' => $row['payment_type'],
            'amount_requested' => $row['amount_requested'],
            'payment_address' => $row['payment_address'],
            'remarks' => $row['remarks'],
            'status' => $status_labels[$row['status']] ?? '',
            'date_created' => date('d-m-Y', strtotime($row['date_created'])),
            'operate' => $operate,
        ];
    }

    $bulkData = [
        'total' => $total,
        'rows' => $rows
    ];

    $this->output->set_content_type('application/json')->set_output(json_encode($bulkData));
}



    function update_payment_request($data)
    {

        $data = escape_array($data);
        $request = array(
            'status' => $data['status'],
            'remarks' => (isset($data['update_remarks']) && !empty($data['update_remarks'])) ? $data['update_remarks'] : null,
        );
        $amount = fetch_details("payment_requests", ['id' => $data['payment_request_id']], "amount_requested,user_id");
        if ($data['status'] == 2) {
            update_balance($amount[0]['amount_requested'], $amount[0]['user_id'], "add");
        }
        return $this->db->where('id', $data['payment_request_id'])->update('payment_requests', $request);
    }
}
