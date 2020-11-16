<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class User extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_user');
    }

    public function index_get()
    {
        $id = $this->get('id');
        if ($id === null) {
            $user = $this->M_user->getUser();
        } else {
            $user = $this->M_user->getUser($id);
        }
        if ($user) {
            $this->response([
                'status' => true,
                'data' => $user
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'message' => 'id not found'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
    }

    public function index_post()
    {
        if ($this->M_user->cekUser() > 0) {
            $this->response([
                'status' => false,
                'message' => 'Username sudah ada! Silahkan gunakan username lain'
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {

            if ($this->M_user->createUser() > 0) {
                $this->response([
                    'status' => true,
                    'message' => 'User berhasil ditambahkan'
                ], REST_Controller::HTTP_CREATED);
            } else {
                $this->response([
                    'status' => false,
                    'message' => 'Gagal menambahkan user'
                ], REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }
}
