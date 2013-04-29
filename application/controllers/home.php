<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller{

    public function __construct(){
        parent::__construct();
        //$this->load->helper('form');
        $this->load->model('DataModel');
    }
    
    public function index(){
        $data['title'] = '[CTC HERMOSILLO]';
        $data['main_content'] = 'home/index';
	$this->load->view('includes/template', $data);
    }
        
    public function showData(){
        $colonia = $this->input->post('colonia');
        $Neighbordhood = $this->DataModel->findNeighborhood($colonia);
        $html = '<td>'.$Neighbordhood[0]->NumNodo.'</td><td>'.$Neighbordhood[0]->Ubicacion.'</td><td>'.$Neighbordhood[0]->Nivel.'</td>';
        echo $html;
        /*$NhArray = array();
        echo "<br><br><br>";
        var_dump($Neighbordhood);
        foreach($Neighbordhood as $nh){
            $NhArray = array(
                'NumNodo'       =>      $nh->NumNodo,
                'Ubicacion'     =>      $nh->Ubicacion,
                'Nivel'         =>      $nh->Nivel
            );
        }
        echo "<br><br><br><br><br><br><br><br>";
        var_dump($NhArray);
        exit;*/
    }
}