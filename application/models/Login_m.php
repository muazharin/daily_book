<?php

class Login_m extends CI_Model
{

    function cek_login($table, $data)
    {
        return $this->db->get_where($table, $data);
    }

    function viewDataByID($username)
    {
        $query = $this->db->where('username', $username);
        $q = $this->db->get('tb_user');
        $data = $q->result();

        return $data;
    }

    function checkDataUsrbyID($id, $pass)
    {
        $this->db->where('id_user', $id);
        $this->db->where('password', $pass);

        return $this->db->get('tb_user')->row();
    }

    function changepassUser($id, $data)
    {
        $this->db->where('id_user', $id);
        $this->db->update('tb_user', $data);

        return TRUE;
    }
}
