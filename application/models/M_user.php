<?php

class M_user extends CI_Model
{
    public function getUser($id = null)
    {
        if ($id === null) {
            return $this->db->get('tb_user')->result_array();
        } else {
            return $this->db->get('tb_user', ['id_user' => $id])->result_array();
        }
    }

    function add_user($data)
    {
        $this->db->insert('tb_user', $data);
        return TRUE;
    }

    public function createUser()
    {
        date_default_timezone_set("Asia/Jakarta");
        $data = [
            'username' => $this->input->post('username'),
            'password' => md5($this->input->post('password')),
            'devisi' => $this->input->post('devisi'),
            'number' => $this->input->post('number'),
            'photo' => 'avatar.png',
        ];
        $this->db->insert('tb_user', $data);
        $user_id = $this->db->insert_id();
        $key_data = [
            'user_id' => $user_id,
            'key' => base64_encode($this->input->post('password')),
            'level' => 2,
            'ignore_limits' => 0,
            'is_private_key' => 0,
            'date_created' => strtotime(date("Y-m-d H:i:s"))
        ];
        $this->db->insert('keys', $key_data);
        return $this->db->affected_rows();
    }

    public function cekUser()
    {
        $this->db->where('username', $this->input->post('username'));
        $this->db->get('tb_user');
        return $this->db->affected_rows();
    }
}
