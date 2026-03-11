<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Crops_step extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->database();
        $this->load->helper(['url', 'language', 'timezone_helper']);
        $this->load->model('crops_model');
        if (!has_permissions('read', 'attribute')) {
            $this->session->set_flashdata('authorize_flag', PERMISSION_ERROR_MSG);
            redirect('admin/home', 'refresh');
        }
    }

    public function index()
    {
		
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->data['main_page'] = FORMS . 'cropstep';
            $settings = get_settings('system_settings', true);
            $this->data['title'] = 'Add Cropstep | ' . $settings['app_name'];
            $this->data['meta_description'] = 'Add Cropstep | ' . $settings['app_name'];
            if (isset($_GET['edit_id'])) {
                $this->data['fetched_data'] = fetch_details('attributes', ['id' => $_GET['edit_id']]);
            }
            $this->data['attribute_set'] = fetch_details('attribute_set',  ['status' => 1]);
			
			$this->data['services_master'] = fetch_details(TBL_SERVICE_MASTER);
			$this->data['crop_master'] = fetch_details(TBL_CROP_MASTER);
			
			if (isset($_GET['edit_id']) && !empty($_GET['edit_id'])) {
                $this->data['fetched_data'] = fetch_details(TBL_CROP_STEPS, ['id' => $_GET['edit_id']]);
            }

            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function manage_attribute()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $this->data['main_page'] = TABLES . 'manage-attribute';
            $settings = get_settings('system_settings', true);
            $this->data['title'] = 'Manage Attribute | ' . $settings['app_name'];
            $this->data['meta_description'] = 'Manage Attribute  | ' . $settings['app_name'];
            $this->load->view('admin/template', $this->data);
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function add_crops_bck()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $edit_attribute = $this->input->post('edit_attribute', true);
            if (null !== $edit_attribute) {
                if (print_msg(!has_permissions('update', 'attribute'), PERMISSION_ERROR_MSG, 'attribute')) {
                    return false;
                }
            } else {
                if (print_msg(!has_permissions('create', 'attribute'), PERMISSION_ERROR_MSG, 'attribute')) {
                    return false;
                }
            }

            $swatche_type = $this->input->post('swatche_type', true);
            $has_color_or_image = false;
            
            // Check if any of the swatch types require validation
            if (is_array($swatche_type)) {
                foreach ($swatche_type as $type) {
                    if ($type == 1 || $type == 2) {
                        $has_color_or_image = true;
                        break;
                    }
                }
            }
            
            if ($swatche_type[0] == 1) {
                $swatch_label = 'Attribute Color';
            } elseif ($swatche_type[0] == 2) {
                $swatch_label = 'Attribute Image';
            } else {
                $swatch_label = 'Attribute Value';
            }
            $this->form_validation->set_rules('name', 'Name', 'trim|required|xss_clean');
            $this->form_validation->set_rules('attribute_set', 'Attribute set', 'trim|required|xss_clean');
            $this->form_validation->set_rules('attribute_value[]', 'Attribute Value', 'trim|required|xss_clean');
            
            // Only validate swatche_value[] if any swatch type requires color or image
            if ($has_color_or_image) {
                $this->form_validation->set_rules('swatche_value[]', $swatch_label, 'trim|required|xss_clean');
            }
            $swatche_type = $this->input->post('swatche_type', true);

            if (!$this->form_validation->run()) {
                $this->response['error'] = true;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $this->response['message'] = validation_errors();
                print_r(json_encode($this->response));
            } else {
                $this->attribute_model->add_attributes($_POST);
                $this->response['error'] = false;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $message = (isset($_POST['edit_attribute'])) ? 'Attribute Updated Successfully' : 'Attribute Added Successfully';
                $this->response['message'] = $message;
                print_r(json_encode($this->response));
            }
        } else {
            redirect('admin/login', 'refresh');
        }
    }
	
	public function add_crops()
	{
		//echo "<pre>";print_r($_FILES);
		//echo "<pre>";print_r($_POST);die;
		 if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $edit_cropstep = $this->input->post('edit_cropstep', true);
            if (null !== $edit_cropstep) {
                if (print_msg(!has_permissions('update', 'cropstep'), PERMISSION_ERROR_MSG, 'cropstep')) {
                    return false;
                }
            } else {
                if (print_msg(!has_permissions('create', 'cropstep'), PERMISSION_ERROR_MSG, 'cropstep')) {
                    return false;
                }
            }

            $swatche_type = $this->input->post('swatche_type', true);
            $has_color_or_image = false;
            
            // Check if any of the swatch types require validation
            if (is_array($swatche_type)) {
                foreach ($swatche_type as $type) {
                    if ($type == 1 || $type == 2) {
                        $has_color_or_image = true;
                        break;
                    }
                }
            }
            
            /*if ($swatche_type[0] == 1) {
                $swatch_label = 'Attribute Color';
            } elseif ($swatche_type[0] == 2) {
                $swatch_label = 'Attribute Image';
            } else {
                $swatch_label = 'Attribute Value';
            }*/
			
			//echo 'hello whow are you';die;
           // $this->form_validation->set_rules('name', 'Name', 'trim|required|xss_clean');
            $this->form_validation->set_rules('service_id', 'Service', 'trim|required|xss_clean');
            $this->form_validation->set_rules('crop_id', 'crop', 'trim|required|xss_clean');
            //$this->form_validation->set_rules('crop_id', 'crop', 'trim|required|xss_clean');
            $this->form_validation->set_rules('steps_title', 'Title', 'trim|required|xss_clean');
            //$this->form_validation->set_rules('no_of_days', 'No of days', 'trim|required|xss_clean');
            
            // Only validate swatche_value[] if any swatch type requires color or image
            /*if ($has_color_or_image) {
                $this->form_validation->set_rules('swatche_value[]', $swatch_label, 'trim|required|xss_clean');
            }
            $swatche_type = $this->input->post('swatche_type', true);*/

            if (!$this->form_validation->run()) {
                $this->response['error'] = true;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $this->response['message'] = validation_errors();
                print_r(json_encode($this->response));
            } else {
				
				//$edit_crops = $this->input->post('edit_cropstep', true);
				//echo "<pre>";print_r($_POST);die;
                $this->crops_model->add_cropstep($_POST, $_FILES);
                $this->response['error'] = false;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $message = (isset($_POST['edit_cropstep'])) ? 'Cropstep Updated Successfully' : 'Cropstep Added Successfully';
                $this->response['message'] = $message;
                print_r(json_encode($this->response));
            }
        } else {
            redirect('admin/login', 'refresh');
        }
	}

    public function attribute_list()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            return $this->attribute_model->get_attribute_list();
        } else {
            redirect('admin/login', 'refresh');
        }
    }

    public function add_attribute_values()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
            $edit_attribute = $this->input->post('edit_attribute', true);
            if (null !== $edit_attribute) {
                if (print_msg(!has_permissions('update', 'cropstep'), PERMISSION_ERROR_MSG, 'cropstep')) {
                    return false;
                }
            } else {
                if (print_msg(!has_permissions('create', 'cropstep'), PERMISSION_ERROR_MSG, 'cropstep')) {
                    return false;
                }
            }

            $this->form_validation->set_rules('name', 'Name', 'trim|required|xss_clean');
            $this->form_validation->set_rules('attribute_set', 'Attribute set', 'trim|required|xss_clean');
            if (!$this->form_validation->run()) {
                $this->response['error'] = true;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $this->response['message'] = validation_errors();
                print_r(json_encode($this->response));
            } else {
                if (isset($_POST['edit_attribute'])) {

                    if (is_exist(['name' => $this->input->post('name', true), 'attribute_set_id' => $this->input->post('attribute_set', true)], 'attributes', $this->input->post('edit_attribute', true))) {
                        $response["error"]   = true;
                        $response['csrfName'] = $this->security->get_csrf_token_name();
                        $response['csrfHash'] = $this->security->get_csrf_hash();
                        $response["message"] = "This Combination Already Exist. Provide a new combination";
                        $response["data"] = array();
                        echo json_encode($response);
                        return false;
                    }
                } else {
                    if (is_exist(['name' => $this->input->post('name', true), 'attribute_set_id' => $this->input->post('attribute_set', true)], 'attributes')) {
                        $response["error"]   = true;
                        $response['csrfName'] = $this->security->get_csrf_token_name();
                        $response['csrfHash'] = $this->security->get_csrf_hash();
                        $response["message"] = "This Combination Already Exist. Provide a new combination";
                        $response["data"] = array();
                        echo json_encode($response);
                        return false;
                    }
                }
                $data =  array(
                    'edit_attribute_value' => $this->input->post('edit_attribute_value', true),
                    'attributes_id' => $this->input->post('attributes_id', true),
                    'swatche_value' => $this->input->post('swatche_value', true),
                    'swatche_type' => $this->input->post('swatche_type', true),
                    'value' => $this->input->post('value', true),
                );

                $this->crops_model->add_attribute_value($data);
                $this->response['error'] = false;
                $this->response['csrfName'] = $this->security->get_csrf_token_name();
                $this->response['csrfHash'] = $this->security->get_csrf_hash();
                $message = (null !== $this->input->post('edit_attribute', true)) ? 'Attribute Updated Successfully' : 'Attribute Added Successfully';
                $this->response['message'] = $message;
                print_r(json_encode($this->response));
            }
        } else {
            redirect('admin/login', 'refresh');
        }
    }
	
	public function cropstep_list()
	{
		if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
			return $this->crops_model->get_cropstep_list();
		} else {
			redirect('admin/login', 'refresh');
		}
	}
	
	public function delete_cropstep()
    {
        if ($this->ion_auth->logged_in() && $this->ion_auth->is_admin()) {
    
            if (print_msg(!has_permissions('delete', 'crops'), PERMISSION_ERROR_MSG, 'crops')) {
                return false;
            }
			
			$id = $this->input->get('id', TRUE); // Get the ID from the GET request
			
			$delete_status = $this->crops_model->delete_cropstep($id);
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
	
}
