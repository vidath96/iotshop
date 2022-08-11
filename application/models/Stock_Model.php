<?php
	class Stock_Model extends CI_Model {

        //Insert  New iten into item table
		public function new_item_in($data){
    		$this->db->insert('item',$data);
    	}

        public function item_last_id($type){

            $category = $type;

            $this->db->select('*');
            $this->db->from('item');
            //$this->db->where('status','active');
            $this->db->where('category', $category);
            $query = $this->db->get();
            $number = $query->num_rows();

            return $number+1;

        }

        function search_data($query){
            $this->db->select("*");
            $this->db->from("item");
            if($query != ''){
                $this->db->like('item_code', $query);
                $this->db->or_like('item_name', $query);
                $this->db->or_like('item_description', $query);
            }
            $this->db->where(['status'=>'active']);
            $this->db->order_by('item_code', 'DESC');
            return $this->db->get();
        }

        public function viewAll_items(){
            return $this->db->get_where('item',['status' => 'active'])->result();
        }

        public function view_item($id){
            return $this->db->get_where('item', ['item_code' => $id , 'status' => 'active'])->result();
        }

        public function item_update($id,$data){
            return $this->db->where(['item_code' => $id])->update('item', $data);
        }

        public function item_delete($id){
            return $this->db->where(['item_code' => $id])->update('item', ['status' => 'deleted']);
        }

        function stock_data1($query){
            $this->db->select("*");
            $this->db->from("main_store");
            if($query != ''){
                $this->db->like('item_code', $query);
                $this->db->or_like('item_name', $query);
                $this->db->or_like('item_description', $query);
            }
            $this->db->order_by('item_code', 'DESC');
            return $this->db->get();
        }

        function stock_data2($query){
            $this->db->select("*");
            $this->db->from("branch_1_store");
            if($query != ''){
                $this->db->like('item_code', $query);
                $this->db->or_like('item_name', $query);
                $this->db->or_like('item_description', $query);
            }
            $this->db->order_by('item_code', 'DESC');
            return $this->db->get();
        }

        function stock_data3($query){
            $this->db->select("*");
            $this->db->from("branch_2_store");
            if($query != ''){
                $this->db->like('item_code', $query);
                $this->db->or_like('item_name', $query);
                $this->db->or_like('item_description', $query);
            }
            $this->db->order_by('item_code', 'DESC');
            return $this->db->get();
        }

        /*function stock_data($query){
            $this->db->select("*");
            $this->db->from("item");
            if($query != ''){
                $this->db->like('item.item_code', $query);
                $this->db->or_like('item.item_name', $query);
                $this->db->or_like('item.item_description', $query);
            }
            $this->db->where(['status'=>'active']);
            $this->db->join('stock','item.item_code=stock.item_code');
            $this->db->order_by('item.item_code', 'DESC');
            return $this->db->get();
        }*/

        public function temp_items_in($data){
            
            $this->db->insert('temp_main_stock',$data);
            $this->db->delete('temp_main_stock',['item_code' => 'images']);
        }

        public function temp_items_view(){
            $this->db->select('*');
            $this->db->from('temp_main_stock');
            $this->db->join('item','temp_main_stock.item_code=item.item_code');
            if($query = $this->db->get()){
                return $query->result();
            }else{
                return false;
            }
            //return $this->db->get_where('temp_main_stock',['item_code' => ''])->result();
        }

        public function temp_item_remove($id){
            $this->db->delete('temp_main_stock',['item_code' => $id]);
        }

        public function add_main_items($temp_data, $basic_data)
        {

            $bill_no = $basic_data['sbill_no'];
            $grn_no = $basic_data['mybill_no'];
            $user = $basic_data['user'];

            $grn_details = array(
                'grn_no' => $grn_no,
                'sup_bill_no' => $bill_no,
                'user_id' => $user
            );

            for ($i=0; $i < count($temp_data); $i++) { 
                $data[] = array(
                    'code' => $temp_data[$i]['code'],
                    'name' => $temp_data[$i]['name'],
                    'description' => $temp_data[$i]['description'],
                    'whole_sale' => $temp_data[$i]['whole_sale'],
                    'retail' => $temp_data[$i]['retail'],
                    'qty' => $temp_data[$i]['qty'],
                    'grn_no' => $grn_no,
                );
            }


            try{

            //Insert data to grn_item table
                for ($i=0; $i < count($temp_data); $i++) { 
                    $this->db->insert('grn_main_items',$data[$i]);

                    $item_code = $data[$i]['code'];

                    $this->db->select('*');
                    $this->db->from('stock');
                    $this->db->where('item_code',$item_code);
                    $query = $this->db->get();
                    $result = $query->row_array();

                    if ($query->num_rows() > 0) {

                            $old_stock = $result['main'];
                            $new_stock = $old_stock+$data[$i]['qty'];

                            $update = array(
                                'main'=>$new_stock
                            );

                            $equal = array(
                                'item_code'=>$item_code
                            );

                            $this->db->update('stock', $update, $equal);

                    }
                    else{
                            $stock = $data[$i]['qty'];

                            $addStock = array(
                                'item_code' => $item_code ,
                                'main' => $stock
                            );

                            $this->db->insert('stock',$addStock);
                    }

                }


                $this->db->insert('grn_main_data',$grn_details);
                $this->db->truncate('temp_main_stock');

                return 'success';

            }
            catch(Exception $e){
                return 'failed';
            }

        } 

        function grn_no()
        {

        $this->db->select('grn_no');
        $this->db->from('grn_main_data');
        $query = $this->db->get();
        $number = $query->num_rows();

        return $number+1;

        }

        public function sup_bill_no(){
            $this->db->select('sbill_no');
            $this->db->from('request_sup_stock');
            $query = $this->db->get();
            $number = $query->num_rows();

            return $number+1;
        }

        public function mail_info_insert($mailinfo){

            $this->db->insert('request_sup_stock',$mailinfo);

        }

        public function mail_stock_insert($msgdata){
            foreach($msgdata as $msgarr){
            $this->db->insert('request_sup_data',$msgarr);
            }
        }

        public function qr_print_data(){
            $query = $this->db->query("SELECT * FROM item where status='active'");
            return $query->result();
        }

        function qr_search_data($query){
            $this->db->select("*");
            $this->db->from("item");
            if($query != ''){
                $this->db->like('item_code', $query);
                $this->db->or_like('item_name', $query);
            }
            $this->db->where(['status'=>'active']);
            $this->db->order_by('item_code', 'DESC');
            return $this->db->get();
        }

        public function chart_data(){

            $query =  $this->db->query("SELECT item_code,SUM(main) as main,SUM(branch_1) as branch1,SUM(branch_2) as branch2 FROM stock"); 
            return $query->result();

        }

        public function orders_pending_data($branch){
            $status ="Pending";

            $this->db->select("*");
            $this->db->from("request_data_temp");
            $this->db->where('branch',$branch);
            $this->db->where('status',$status);
            $this->db->order_by('request_no', 'DESC');
            $this->db->limit('1');
            return $this->db->get();
            // $query =  $this->db->query("SELECT * FROM request_data_temp"); 
            // return $query->result();

        }

        public function orders_pending_item($branch){

            $this->db->select("*");
            $this->db->from("request_item_temp");
            $this->db->where('branch_name',$branch);
            $this->db->order_by('code', 'DESC');
            return $this->db->get();
            /*$query =  $this->db->query("SELECT * FROM request_item_temp WHERE branch_name='".$branch."'"); 
            return $query->result();*/

        }


        public function main_stock($id){

            $query =  $this->db->query("SELECT main FROM stock WHERE item_code='".$id."'"); 
            return $query->result();

        }


        public function orders_approve_data($datareq,$data){

            $this->db->insert('request_data',$data);
            foreach($datareq as $itemarr){
                $this->db->insert('request_item',$itemarr);

                $item_code = $itemarr['code'];
                $send_qty = $itemarr['qty'];
                $this->db->select('*');
                $this->db->from('stock');
                $this->db->where('item_code',$item_code);
                $query = $this->db->get();
                $result = $query->row_array();

                if ($query->num_rows() > 0) {

                $old_stock = $result['main'];
                $new_stock = $old_stock-$send_qty;

                $update = array(
                        'main'=>$new_stock
                        );

                $equal = array(
                        'item_code'=>$item_code
                        );

                $this->db->update('stock', $update, $equal);

                }

                $this->db->where('request_no', $itemarr['request_no']);
                $this->db->where('branch_name', $itemarr['branch_name']);
                $this->db->delete('request_item_temp' );

                $this->db->where('request_no', $data['request_no']);
                $this->db->where('branch', $data['branch']);
                $this->db->delete('request_data_temp' );
            }

            
            
        }

    }
?>