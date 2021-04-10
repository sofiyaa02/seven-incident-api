<?php

require APPPATH.'libraries/REST_Controller.php';

class Incident extends REST_Controller{

  public function __construct(){

    parent::__construct();
    //load database
    $this->load->database();
    $this->load->model(array("api/incident_model"));
    $this->load->helper("security");
  }
 
  public function index_get(){
    // list data method
   
    $students = $this->incident_model->get_incidents();
 
foreach ($students as $row) {
    $category = $row->incident_id;

$people_details = $this->incident_model->get_people_list($category);

    if (!isset($results[$category])) {
        $results[$category] = ['id' => $category, 'location' => [],'title'=>$row->incident_title,'category'=>$row->incident_cat_id, 'people'=>$people_details,'comments'=>$row->incident_comment,'incidentDate'=>$row->incident_date,'createDate'=>$row->incident_cdate,'modifyDate'=>$row->incident_mdate];
    }

    $results[$category]['location'][] = ['latitude' => $row->incident_lant, 'longitude' => $row->incident_long];



}
echo json_encode(array_values($results));



  }

  public function index_post(){
    // insert data method

   
//$data= json_decode(file_get_contents("https://run.mocky.io/v3/c840350a-b9a9-4dd5-8645-f572e81fea96"),true); 
$data= json_decode(file_get_contents("php://input"),true); 

foreach($data as $product) {
   $title = $product[0]['title'];

    $comments = $product[0]['comments'];


if(empty ($product[0]['createDate'])) {$product[0]['createDate'] = date('Y-m-d h:i:s');}
if(empty ($product[0]['modifyDate'])) {$product[0]['modifyDate'] = date('Y-m-d h:i:s');}

  if(empty($product[0]['category'])){ // validate category

       echo  json_encode(array(
            "status" => 0,
            "message" => "category id is missing"
          ), REST_Controller::HTTP_NOT_FOUND);
        }
// validate location
      else if (empty($product[0]['location']['latitude']) || empty($product[0]['location']['longitude'])) 

          {

       echo  json_encode(array(
            "status" => 0,
            "message" => "Location cannot be empty. "
          ), REST_Controller::HTTP_NOT_FOUND);
        }
        // validate location is numberic
        else if(!is_numeric($product[0]['location']['latitude']) ||(!is_numeric($product[0]['location']['longitude']))){

           echo  json_encode(array(
            "status" => 0,
            "message" => "enter numberic value. "
          ), REST_Controller::HTTP_NOT_FOUND);
        }

        else if (empty($product[0]['incidentDate'])){

       echo  json_encode(array(
            "status" => 0,
            "message" => "Incident date is empty or invalid!"
          ), REST_Controller::HTTP_NOT_FOUND);
        }
 else {

$i_data = array('incident_title' =>$title ,
                'incident_cat_id'=>$product[0]['category'],
                'incident_lant'=>$product[0]['location']['latitude'],
                'incident_long'=>$product[0]['location']['longitude'],
                'incident_comment'=>$product[0]['comments'],
                'incident_date'=>$product[0]['incidentDate'],
                'incident_cdate'=>$product[0]['createDate'],
                'incident_mdate'=>$product[0]['modifyDate']
                   );

$i_id = $this->incident_model->insert('incident_details', $i_data);  // insert data


$people = $product[0]['people'];

                   foreach ($people as $pvalue) {
                       
                         $p_name = $pvalue['name'];  echo "\n";
                         $p_type =  $pvalue['type'];
                        $this->incident_model->insert('people_details', array('p_incident_id' =>$i_id ,'p_name'=>$p_name,'p_type'=>$p_type )); // people details

                    }

   echo  json_encode(array(
            "status" => 0,
            "message" => "Incident has been created"
           ), REST_Controller::HTTP_OK);
}//else ends

 } 

}

 ?>
