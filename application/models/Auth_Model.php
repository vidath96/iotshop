<?php
	class Auth_Model extends CI_Model {

        //Retrieve Userinfo from the Database
		public function login_user($userid, $encPassword){
    		//$sql = "SELECT * FROM admin a_id='".$userid."' AND a_pwd='".$password."'";
    		//$query = $this->db->query($sql);
    		//return $query->result();
    		$this->db->select('*');
            $this->db->from('user');
            $this->db->where('user_id', $userid);
            $this->db->where('password', $encPassword);
            $this->db->where('status', 'active');
            if ($query = $this->db->get()) {
                return $query->row_array();
            } else {
                return false;
            }

    	}

        //Retrieve Branchinfo from the Database
        public function branch($bid){
            $this->db->select('*');
            $this->db->from('branch');
            $this->db->where('branch_id',$bid);
            if ($query = $this->db->get()) {
                return $query->row_array();
            } else {
                return false;
            }        
        }

        public function cbranch(){
            $this->db->select('*');
            $this->db->from('shop_mac');
            
            if ($query = $this->db->get()) {
                return $query->row_array();
            } else {
                return false;
            }        
        }
        
        public function temp_mac($data){
            $this->db->insert('shop_mac',$data);  
        }
        
        public function branchid(){
            $this->db->select('b_id','s_mac');
            $this->db->from('shop_mac');
            
            if ($query = $this->db->get()) {
                return $query->row_array();
            } else {
                return false;
            }        
        }
        
	}
?>