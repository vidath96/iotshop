<?php 

class Admin extends CI_Controller
{


// public function stock_admin()
// 	{
		
// 		$this->load->view('admin/admin-users',['result'=>$results]);
// 	}


	public function admin_creditors()
	{
		
		$results = $this->Admin_Model->creditors_data();
		$this->load->view('admin/adminCreditors',['results'=>$results]);
	}


	function stock_search()
	{
		$output = '';
		$query = '';
		$branch = '';
		if($this->input->post('query'))
		{
			$query = $this->input->post('query');
		}
		if($this->input->post('branch'))
		{
			$branch = $this->input->post('branch');
		}

		if($branch == 'main'){
			$data = $this->Stock_Model->stock_data1($query);
		}else if($branch == 'branch_1'){
			$data = $this->Stock_Model->stock_data2($query);
		}else if($branch == 'branch_2'){
			$data = $this->Stock_Model->stock_data3($query);
		}

		$output .= '
		<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">Item Code</th>
								<th scope="col">Item Name</th>
								<th scope="col">Description</th>
								<th scope="col">Whole Sale Price</th>
								<th scope="col">Retail Price</th>
								<th scope="col">Quantity</th>
							</tr>
						</thead>
		';
		if($data->num_rows() > 0)
		{
			$i=1;
			foreach($data->result() as $row)
			{
				$output .= '
						<tr>
							<td>'.$i++.'</td>
							<td>'.$row->item_code.'</td>
							<td>'.$row->item_name.'</td>
							<td>'.$row->item_description.'</td>
							<td>'.$row->whole_sale_price.'</td>
							<td>'.$row->retail_price.'</td>
							<td>'.$row->stock.'</td>
						</tr>
				';
			}
		}
		else
		{
			$output .= '<tr>
							<td colspan="5">No Data Found</td>
						</tr>';
		}
		$output .= '</table></div>';
		echo $output;
	}


	public function admin_stocks()
	{
		
		// $this->load->view('admin/admin-stocks',['result'=>$results]);
		$this->load->view('admin/admin-stocks');
	}


	public function profile_admin()
	{
		
		$this->load->view('admin/admin-users',['result'=>$results]);
	}

	public function profile_one($id)
	{
		$results = $this->Common_Model->view_profile($id);
		$this->load->view('admin/admin-users_update',['result'=>$results]);
	}

	public function admin_edited_profile($uid)
	{

		$pass = $this->input->post('password');
		$cpass = $this->input->post('repassword');
		if($pass == '' && $cpass == ''){
		$data = array(
			'first_name' => $_POST['fname'],
			'last_name' => $_POST['lname'], 
			'nic' => $_POST['nic'],
			'address' => $_POST['address'],
			'gender' => $_POST['gender'],
			'email' => $_POST['email'],
			'contact_no' => $_POST['contact']);
	
			
		$this->Common_Model->profile_update($uid,$data);
		$this->session->set_flashdata('update_success','Profile Updated Successfully..!');
		redirect('Common/profile_admin');
		//$this->one_item($id);
		}else if($pass == $cpass){
		$enccpass = md5($cpass);
		$data = array(
			'first_name' => $_POST['fname'],
			'last_name' => $_POST['lname'], 
			'nic' => $_POST['nic'],
			'address' => $_POST['address'],
			'gender' => $_POST['gender'],
			'email' => $_POST['email'],
			'contact_no' => $_POST['contact'],
			'password' => $enccpass);
	
		$this->Common_Model->profile_update($uid,$data);
		$this->session->set_flashdata('password_success','Password matched ..!');
		$this->session->set_flashdata('update_success','Profile Updated Successfully..!');
		redirect('Common/profile_admin');	
		}else if($pass != $cpass){
		$this->session->set_flashdata('password_fail','Password does not matched ..!');
		redirect('Common/profile_admin');	
		}
	}


	function monthly_sales_view(){

		$result = $this->Admin_Model->monthly_sales_data();
		$res = $this->Admin_Model->get_yr();
		
		$this->load->view('admin/adminDashboard',['yr_list' => $res]);
	}

	function create_user_account(){
		$user_name = "";
		if ($_POST['position'] == "Admin") {
			$names = $this->Admin_Model->get_users("Admin");
			$nums = array();
			foreach ($names as $value) {
				if (!in_array($value->user_id[6], $nums)) {
					array_push($nums, $value->user_id[6]);
				}
			}
			rsort($nums);
			$o = intval($nums[0]);
			$o = $o + 1;
			$user_name = "IOTAD0" .  $o;
		} else if ($_POST['position'] == "Cashier") {
			$names = $this->Admin_Model->get_users("Cashier");
			$nums = array();
			foreach ($names as $value) {
				if (!in_array($value->user_id[6], $nums)) {
					array_push($nums, $value->user_id[6]);
				}
			}
			rsort($nums);
			$o = intval($nums[0]);
			$o = $o + 1;
			$user_name = "IOTCA0" .  $o;
		} else {
			$names = $this->Admin_Model->get_users("SManager");
			$nums = array();
			foreach ($names as $value) {
				if (!in_array($value->user_id[6], $nums)) {
					array_push($nums, $value->user_id[6]);
				}
			}
			rsort($nums);
			$o = intval($nums[0]);
			$o = $o + 1;
			$user_name = "IOTSM0" .  $o;
		}
		$data = array(
			'user_id' => $user_name,
			'first_name' => $_POST['fname'],
			'last_name' => $_POST['lname'], 
			'nic' => $_POST['nic'],
			'address' => $_POST['address'],
			'gender' => $_POST['gender'],
			'email' => $_POST['email'],
			'contact_no' => $_POST['contact'],
			'password' => $_POST['password'],
			'position' => $_POST['position'],
			'status' => 'active',
		);
		$this->Admin_Model->insert_users($data);
		$this->monthly_sales_view();
	}

	function all_user_view(){
		$results=$this->Admin_Model->get_allusers();
		$this->load->view('admin/admin-users',['results'=>$results]);

	}

	function get_sales_json(){
		$result = $this->Admin_Model->get_sales_js();
		header('Content-Type: application/json');
		echo json_encode($result);

	}

	function get_sales_json_yr($yr){
		$result = $this->Admin_Model->get_sales_js_yr($yr);
		header('Content-Type: application/json');
		echo json_encode($result);

	}

	function get_sales_json_option($op, $y){
		$result = $this->Admin_Model->get_sales_js_op($op, $y);
		header('Content-Type: application/json');
		echo json_encode($result);

	}

	function navigate_report(){
	
		$this->load->view('admin/admin_report');

	}

	function daily_sales_report(){
		$today = date("Y/m/d");
		$day = explode("/", $today);
		$d = intval($day[2]) - 1;
		$yesterday = $day[0] . "-" . $day[1] . "-" . $d;
		$results=$this->Admin_Model->get_sales($yesterday);
		$pdf = new PDF();
		$pdf->AliasNbPages();
		$pdf->AddPage('L');
		$pdf->SetFont('Arial', 'B', 10);
		$pdf->daily_sales($results);

		$pdf->Output();
		//var_dump($yesterday);

	}

	function monthly_sales_report(){
		$today = date("Y/m/d");
		$month = explode("/", $today);
		
		$results=$this->Admin_Model->get_sales_monthly($month[1]);
		$pdf = new PDF();
		$pdf->AliasNbPages();
		$pdf->AddPage('L');
		$pdf->SetFont('Arial', 'B', 10);
		$pdf->monthly_sales($results);

		$pdf->Output();
		//var_dump($yesterday);

	}

}

?>