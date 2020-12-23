<?php

class M_request extends CI_Model
{
    public function submitRequest()
    {
        $id_user = $this->input->post('id');
        $keluhan = $this->input->post('keluhan');
        $devisi = $this->input->post('devisi');

        $this->load->library('upload');
        $config['upload_path'] = './assets/images/request';
        $config['allowed_types'] = 'jpg|jpeg|png|JPG|JPEG|PNG';
        $config['file_name'] = $_FILES['foto']['name'];
        $this->upload->initialize($config);
        if (!empty($_FILES['foto']['name'])) {
            if ($this->upload->do_upload('foto')) {
                $foto = $this->upload->data();
                $data = [
                    'id_user' => $id_user,
                    'keluhan' => $keluhan,
                    'devisi' => $devisi,
                    'tanggal_keluhan' => date('Y-m-d H:i:s'),
                    'foto' => $_FILES['foto']['name'],
                    'rate' => 0,
                    'ket' => 'waiting',
                ];
                return $this->db->insert('tb_activity', $data);
            }
        } else {
            return FALSE;
        }
    }
    public function submitEditRequest()
    {
        $id_act = $this->input->post('id_act');
        $keluhan = $this->input->post('keluhan');

        $this->load->library('upload');
        if (!empty($_FILES['foto']['name'])) {
            $config['upload_path'] = './assets/images/request';
            $config['allowed_types'] = 'jpg|jpeg|png|JPG|JPEG|PNG';
            $config['file_name'] = $_FILES['foto']['name'];
            $this->upload->initialize($config);
            if ($this->upload->do_upload('foto')) {
                $foto = $this->upload->data();
                $data = [
                    'keluhan' => $keluhan,
                    'tanggal_keluhan' => date('Y-m-d H:i:s'),
                    'foto' => $_FILES['foto']['name'],
                ];
                $this->db->where('id_activity', $id_act);
                return $this->db->update('tb_activity', $data);
            } else {

                return FALSE;
            }
        } else {
            $data = [
                'keluhan' => $keluhan,
                'tanggal_keluhan' => date('Y-m-d H:i:s'),
            ];
            $this->db->where('id_activity', $id_act);
            return $this->db->update('tb_activity', $data);
        }
    }

    public function recentRequest()
    {
        $id_user = $this->input->post('id');
        $this->db->limit(5);
        $this->db->where('id_user', $id_user);
        return $this->db->get('tb_activity')->result_array();
    }

    public function delRequest()
    {
        $id_activity = $this->input->post('id_activity');
        $foto = $this->input->post('foto');
        $path_foto = './assets/images/request/';
        @unlink($path_foto . $foto);
        $this->db->where('id_activity', $id_activity);
        return $this->db->delete('tb_activity');
        // return true;
    }
}
