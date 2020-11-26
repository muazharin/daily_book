<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Home extends CI_Controller
{

    function __construct()
    {
        parent::__construct();
        if ($this->session->userdata('status') != "login") {
            $pemberitahuan = "<div class='alert alert-warning'>Anda harus login dulu ! </div>";
            $this->session->set_flashdata('pesan', $pemberitahuan);
            redirect(base_url("Login"));
        }
    }


    public function index()
    {
        $data = [
            'tittle'          => 'Dashboard',
        ];

        $this->template->load('template', 'dashboard', $data);
    }
}

/* End of file Home.php */
