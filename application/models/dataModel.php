<?php

class DataModel extends CI_Model{
    
    public function __construct(){
        parent::__construct();
        $this->load->database();
        $this->load->helper('security');
    }
    
    public function findNeighborhood($colonia){
        $this->db->select('NombreColonia, NumNodo, Ubicacion, Nivel');
        $this->db->from('relaciones');
        $this->db->join('colonias c', 're_idColonia = id_colonia', 'inner');
        $this->db->join('nodos n', 're_idNodo = id_nodo', 'inner');
        $this->db->where('NombreColonia', $colonia);
        $query = $this->db->get();
        /*var_dump($colonia);
        echo "<br>";
        var_dump($this->db->last_query());
        echo "<br>";
        var_dump($query->result());
        exit;*/
        //SELECT NombreColonia,NumNodo,Ubicacion,Nivel FROM relaciones r INNER JOIN colonias c ON c.id_colonia=re_idColonia 
        //INNER JOIN nodos n ON n.id_nodo=re_idNodo WHERE NombreColonia='4 Olivos';
        /*
        ANTES DE QUE EL MARIO CAMBIARA LA BD, CHE MINERO!
        $this->db->select('NumNodo, Ubicacion, Nivel, NombreColonia');
        $this->db->from('colonias c');
        $this->db->join('nodos n', 'n.id_nodo = c.id_nodos');
        $this->db->where('c.NombreColonia', $colonia);
        $query = $this->db->get();*/
        if($query->num_rows() > 0){
            return $query->result();
        }else{
            return false;
        }
    }
    
}