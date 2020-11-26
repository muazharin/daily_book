<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Login extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->model('Login_m');
        // $this->load->library('bcrypt');
    }

    public function index()
    {
        $data = [
            'tittle'          => 'login',
        ];

        // check_already_login();
        $this->load->view('v_login', $data);
    }

    public function proses()
    {
        $username = $this->input->post('username');
        $password = $this->input->post('pass');
        $data = array(
            'username' => $username,
            'password' => md5($password)
        );
        $cek = $this->Login_m->cek_login("tb_user", $data)->num_rows();
        if ($cek > 0) {

            $data_session = array(
                'nama' => $username,
                'status' => "login"
            );

            $this->session->set_userdata($data_session);
            redirect(base_url("Home"));
            // echo "Berhasil !";
        } else {
            $this->session->set_flashdata("pesan", "<div class=\"alert alert-danger\" id=\"alert\"><i class=\"glyphicon glyphicon-remove\"></i> Gagal Login, password salah !</div>");
            // echo "Username dan password salah !";
            redirect(base_url("Login"));
        }
    }

    public function logout()
    {
        $this->session->sess_destroy();
        redirect(base_url('login'));

        # code...
    }
}
