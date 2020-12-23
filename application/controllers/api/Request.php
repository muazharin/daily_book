<?php

defined('BASEPATH') or exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';

class Request extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('M_request');
    }

    public function submitRequest_post()
    {
        if ($this->M_request->submitRequest()) {
            $this->response([
                'status' => true,
                'message' => 'Request sent succesfully!'
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Request failed to send!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
    public function submitEditRequest_post()
    {
        if ($this->M_request->submitEditRequest()) {
            $this->response([
                'status' => true,
                'message' => 'Request updated succesfully!'
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Request failed to update!'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    public function recentRequest_post()
    {
        if ($this->M_request->recentRequest()) {
            $this->response([
                'status' => true,
                'message' => 'Get request data succesfully',
                'data' => $this->M_request->recentRequest()
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => 'There is no data data request',
                'data' => null
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
    public function delRequest_post()
    {
        if ($this->M_request->delRequest()) {
            $this->response([
                'status' => true,
                'message' => 'Data successfully deleted!',
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => 'A delete error occurred',
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}
