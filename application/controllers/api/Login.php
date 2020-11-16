<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class Login extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_login');
    }

    public function index_post()
    {
        if ($this->M_login->cekUserLogin() > 0) {
            $data = $this->M_login->getUserData();
            $this->response([
                'status' => true,
                'value' => 1,
                'message' => 'Login Berhasil',
                'data' => $data
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'value' => 0,
                'message' => 'Username atau password salah!'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }
}
