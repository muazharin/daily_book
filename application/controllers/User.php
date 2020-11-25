<?php

defined('BASEPATH') or exit('No direct script access allowed');

class User extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_user');
        $this->load->library('bcrypt');
    }

    public function index()
    {

        $data = [
            'tittle' => 'Data user',
            'user'              => $this->M_user->getUser()
        ];

        var_dump($data);
        $this->template->load('template', 'v_user', $data);
    }
}

/* End of file User.php */
