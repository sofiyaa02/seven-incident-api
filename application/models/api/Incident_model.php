<?php

class Incident_model extends CI_Model{

  public function __construct(){
    parent::__construct();
    $this->load->database();
  }

  public function get_incidents(){

    $this->db->select("ind.*");
    $this->db->from("incident_details ind");
  
    $query = $this->db->get();

    return $query->result();
  }

  public function get_people_list($incident_id){
    $this->db->select("p_name as name,p_type as type");
    $this->db->from("people_details p");
    $this->db->where('p_incident_id',$incident_id);
$query = $this->db->get();

    return $query->result();

  }

public function insert($table, $data) {
    $this->db->insert($table, $data);
    return $this->db->insert_id();
  }

    function get_All_where_Record($tabl_name,$where_data)
  {
    $this->db->select('*');
    $this->db->from($tabl_name);
    $this->db->where($where_data);
    $query = $this->db->get();

    if($query->num_rows()>0)
    {
      return $query->result('object');
    }
    else
    {
      return false;
    }
  }
   // public function insert_student($data = array()){

   //     return $this->db->insert("tbl_students", $data);
   // }

   // public function delete_student($student_id){

   //   // delete method
   //   $this->db->where("id", $student_id);
   //   return $this->db->delete("tbl_students");
   // }

   // public function update_student_information($id, $informations){

   //    $this->db->where("id", $id);
   //    return $this->db->update("tbl_students", $informations);
   // }
}

 ?>
