<?php
	class Admin_Model extends CI_Model {

        public function monthly_sales_data(){
            $query = $this->db->query('SELECT bill_date,sum(amount) as amount FROM branch1_sales_history group by month(bill_date) order by month(bill_date)');
            return $query->result();
        }

        public function get_users($type){
            return $this->db->get_where('user', ['position' => $type])->result();
        }

        public function insert_users($data){
            return $this->db->insert('user', $data);
        }

        public function get_allusers(){
            $query = $this->db->query('SELECT * FROM user');
            return $query->result();
        }

        public function get_yr(){
            $query = $this->db->get('bill_history');
            return $query->result();
        }

        public function get_sales_js(){
            $query = $this->db->get('bill_history');
            return $query->result();
        }


        public function get_sales_js_yr($y){

            $this->db->like('bill_date', $y);
            $res = $this->db->get('bill_history')->result();
            return $res;
        }


        public function get_sales_js_op($op, $y){
            $this->db->like('bill_date', $y);
            $res = $this->db->get_where('bill_history', ['branch' => $op])->result();
            return $res;
        }

        public function get_sales($id){
            
            return $this->db->get_where('bill_history', ['bill_date' => $id])->result();
        }

        public function get_sales_monthly($id){
            
            $this->db->like('bill_date', $id);
            return $this->db->get('bill_history')->result();
        }

        public function creditors_data(){
            
            $query = $this->db->query('SELECT * FROM debitor');
            return $query->result();
        }

	}
?>