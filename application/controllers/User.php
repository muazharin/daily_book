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

        // var_dump($data);
        $this->template->load('template', 'v_user', $data);
    }

    public function tambah()
    {
        # code...

        $username = $this->input->post('user');
        $pass = md5($this->input->post('pw'));
        // $hash = $this->bcrypt->hash_password($pass);
        $devisi = $this->input->post('devisi');
        $lvl = $this->input->post('lvl');


        $data = array(

            'username' => $username,
            'password	' => $pass,
            'devisi	' => $devisi,
            'level	' => $lvl


        );
        $this->M_user->add_user($data);
        $this->session->set_flashdata("pesan", "<div class=\"alert alert-success alert-dismissible show fade\">
                    <div class=\"alert-body\">
                    <button class=\"close\" data-dismiss=\"alert\">
                        <span>×</span>
                    </button>
                    Data Admin Berhasil Disimpan
                    </div>
                </div>");

        redirect(base_url('User'));




        $this->template->load('template', 'v_user', $data);
    }

    public function editpost()
    {
        $id = $this->input->post('id');
        $username = $this->input->post('user');
        // $pass = md5($this->input->post('pw'));
        $devisi = $this->input->post('devisi');
        $lvl = $this->input->post('lvl');




        $data = array(

            'username' => $username,
            // 'password	' => $pass,
            'devisi	' => $devisi,
            'level	' => $lvl


        );
        $this->M_user->update_user($id, $data);
        $this->session->set_flashdata("pesan", "<div class=\"alert alert-success alert-dismissible show fade\"><div class=\"alert-body\"><button class=\"close\" data-dismiss=\"alert\"><span>×</span></button>Data Admin Berhasil Diubah</div></div>");

        redirect(base_url('User'));

        $this->template->load('template', 'v_user', $data);
    }

    public function hapus()
    {
    }
}

/* End of file User.php */