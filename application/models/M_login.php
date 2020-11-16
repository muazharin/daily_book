<?php

class M_login extends CI_Model
{
    public function cekUserLogin()
    {
        $this->db->where('username', $this->input->post('username'));
        $this->db->where('password', md5($this->input->post('password')));
        $this->db->get('tb_user');
        return $this->db->affected_rows();
    }

    public function getUserData()
    {
        $this->db->select('id_user');
        $this->db->from('tb_user');
        $this->db->where('username', $this->input->post('username'));
        $this->db->where('password', md5($this->input->post('password')));
        $id = $this->db->get()->row()->id_user;
        $this->db->select('*');
        $this->db->from('tb_user u');
        $this->db->where('u.id_user', $id);
        $this->db->join('tb_profile p', 'u.id_user = p.id_user', 'left');
        $this->db->join('keys k', 'u.id_user = k.user_id', 'left');
        return $this->db->get()->result_array();
    }
}
