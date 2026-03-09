<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Crops extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->library(['ion_auth', 'form_validation', 'upload']);
        $this->load->helper(['url', 'language', 'file']);
        $this->load->model(['crops_model']);

        if (!has_permissions('read', 'crops')) {
            $this->session->set_flashdata('authorize_flag', PERMISSION_ERROR_MSG);
            redirect('admin/home', 'refresh');
        }
    }



    public function get_crops()
    {
        // $ignore_status = isset($_GET['ignore_status']) && $_GET['ignore_status'] == 1 ? 1 : '';
        $response['data'] = $this->data['category_result'] = $this->crops_model->get_crops_data();
        echo json_encode($response);
        return;
    }


    public function create_crops()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->data['main_page'] = FORMS . 'crops';
            $settings = get_settings('system_settings', true);
            $id = $this->input->get('id', true);
            if (isset($id) && !empty($id)) {
                $this->data['base_category_url'] = base_url() . 'admin/crops/crops_list?id=' . $id;
            } else {
                $this->data['base_category_url']  = base_url() . 'admin/crops/crops_list';
            }
            $this->data['category_result'] = $this->crops_model->get_crops();
            $this->data['title'] = (isset($_GET['edit_id']) && !empty($_GET['edit_id'])) ? 'Edit Crops | ' . $settings['app_name'] : 'Add Crops | ' . $settings['app_name'];
            $this->data['meta_description'] = 'Add Crops , Create Crops | ' . $settings['app_name'];
            if (isset($_GET['edit_id']) && !empty($_GET['edit_id'])) {
                $this->data['fetched_data'] = fetch_details(TBL_CROP_MASTER, ['id' => $_GET['edit_id']]);
            }

            $this->data['categories'] = $this->crops_model->get_crops();

            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function crops_order()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->data['main_page'] = TABLES . 'crops-order';
            $settings = get_settings('system_settings', true);
            $this->data['title'] = 'Crops Order | ' . $settings['app_name'];
            $this->data['meta_description'] = 'Crops Order | ' . $settings['app_name'];
            $this->data['categories'] = $this->crops_model->get_crops_data();
            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }
    
    public function delete_crops()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
    
            if (print_msg(!has_permissions('delete', 'crops'), PERMISSION_ERROR_MSG, 'crops')) {
                return false;
            }
			
			$id = $this->input->get('id', TRUE); // Get the ID from the GET request
			
			$delete_status = $this->crops_model->delete_crops($id);
			if ($delete_status) {
				$this->response['error'] = false;
				$this->response['message'] = 'Crops deleted successfully.';
			} else {
				$this->response['error'] = true;
				$this->response['message'] = 'Crops not deleted, pleaqse try again.';
			}
			    
            $this->response['csrfName'] = $this->security->get_csrf_token_name();
            $this->response['csrfHash'] = $this->security->get_csrf_hash();
            print_r(json_encode($this->response));
        } else {
            redirect('admin/login', 'refresh');
        }
    }
    


    public function crops_list()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {

            return $this->crops_model->get_crops_list();
        } else {
            redirect('admin/login', 'refresh');
        }
    }



    public function add_crops()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
    
            $edit_crops = $this->input->post('edit_crops', true);
            if (null !== $edit_crops) {
                if (print_msg(!has_permissions('update', 'crops'), PERMISSION_ERROR_MSG, 'crops')) {
                    return false;
                }
            } else {
                if (print_msg(!has_permissions('create', 'crops'), PERMISSION_ERROR_MSG, 'crops')) {
                    return false;
                }
            }
            
            $this->form_validation->set_rules('crop_title', 'Crop Title', 'trim|required|xss_clean');
            $this->form_validation->set_rules('crop_category_id', 'Crop Category', 'trim|required|xss_clean');
            // $this->form_validation->set_rules('banner', 'Banner', 'trim|xss_clean');
    
            $editCategory = $this->input->post('edit_crops', true);
            if (isset($editCategory) && !empty($editCategory)) {
                 $this->form_validation->set_rules('crops_input_image', 'Image', 'trim|xss_clean');
            } else {
                $this->form_validation->set_rules('crops_input_image', 'Category Image', 'trim|required|xss_clean');
            }
    
            if (!$this->form_validation->run()) {
                $this->response['error'] = true;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $this->response['message'] = validation_errors();
                print_r(json_encode($this->response));
            } else {
                // Check if crop_title already exists
                $edit_crops = $this->input->post('edit_crops', true);
                if (null !== $edit_crops) {
                    if (is_exist(['crop_title' => $this->input->post('crop_title', true)], TBL_CROP_MASTER, $this->input->post('edit_crops', true))) {
                        $response["error"] = true;
                        $response['csrfName'] = $this->security->get_csrf_token_name();
                        $response['csrfHash'] = $this->security->get_csrf_hash();
                        $response["message"] = "Crop Already Exists!";
                        $response["data"] = array();
                        echo json_encode($response);
                        return false;
                    }
                } else {
                    if (is_exist(['crop_title' =>$this->input->post('crop_title', true)], TBL_CROP_MASTER)) {
                        $response["error"] = true;
                        $response['csrfName'] = $this->security->get_csrf_token_name();
                        $response['csrfHash'] = $this->security->get_csrf_hash();
                        $response["message"] = "Crop Already Exists!";
                        $response["data"] = array();
                        echo json_encode($response);
                        return false;
                    }
                }

                // Proceed to add or update the crop
                $data = array(
                    'edit_crops' => $this->input->post('edit_crops', true),
                    'crop_category_id' => $this->input->post('crop_category_id', true),
                    'crop_title' => $this->input->post('crop_title', true),
                    'crops_input_image' => $this->input->post('crops_input_image', true),
                );

                $this->crops_model->add_crops($data);
                $this->response['error'] = false;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $message = (null !== $this->input->post('edit_crops', true)) ? 'Crop Updated Successfully' : 'Crop Added Successfully';
                $this->response['message'] = $message;
                $this->response['reload'] = true;
                print_r(json_encode($this->response));
            }
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function update_crops_order()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            if (print_msg(!has_permissions('update', 'crops_order'), PERMISSION_ERROR_MSG, 'crops_order', false)) {
                return false;
            }
            $i = 0;
            $temp = array();
            foreach ($_GET['category_id'] as $row) {
                $temp[$row] = $i;
                $data = [
                    'row_order' => $i
                ];
                $data = escape_array($data);
                $this->db->where(['id' => $row])->update('categories', $data);
                $i++;
            }

            $response['error'] = false;
            $response['message'] = 'Category Order Saved !';

            print_r(json_encode($response));
        } else {
            redirect('admin/login', 'refresh');
        }
    }
}
