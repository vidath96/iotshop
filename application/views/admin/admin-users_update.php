<!DOCTYPE html>
<html lang="en" >
<head>
    <?php $userSes = $this->session->userdata('username'); ?>
    <?php $userTyp = $this->session->userdata('usertype'); ?>
  <meta charset="UTF-8">
  <title>IoT-Shop</title>
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.2/css/all.css'>
<link rel="stylesheet" href="<?php echo base_url('public/assets/css/nav-style.css'); ?>">

<!-- 
  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css'> -->
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>
<link rel="stylesheet" href="<?php echo base_url('public/assets/css/style.css'); ?>">

<script  src="<?php echo base_url('public/assets/js/script.js'); ?>"></script>

<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <script type="text/javascript" src="<?php echo base_url('public/assets/scripts/jquery-3.2.1.min.js'); ?>"></script>
  <script src="<?php echo base_url('public/assets/scripts/firebase-4.2.0.js'); ?>"></script>
  <script src="<?php echo base_url('public/assets/scripts/firebase-initialize.js'); ?>"></script>


  <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.min.css'>
<link rel="stylesheet" href="<?php echo base_url('public/assets/css/chat.css'); ?>">



<!-- InnnerTabs -->
  <link rel='stylesheet' href='https://s3-us-west-2.amazonaws.com/s.cdpn.io/172203/animate.css'>
   <link rel='stylesheet' href='https://codepen.io/gbhasha/pen/epggea.css'>
    <link rel="stylesheet" href="<?php echo base_url('public/assets/css/tabs.css'); ?>">


  <script  src="<?php echo base_url('public/assets/js/script.js'); ?>"></script>
  <script type="text/javascript" src="<?php echo base_url('public/assets/scripts/jquery-3.2.1.min.js'); ?>"></script>
  <script src="<?php echo base_url('public/assets/scripts/firebase-4.2.0.js'); ?>"></script>
  <script src="<?php echo base_url('public/assets/scripts/firebase-initialize.js'); ?>"></script>




</head>
<body style="background: url('images/bg.png') no-repeat center center fixed; background-size: cover;">


<nav class="navbar navbar-expand-lg navbar-mainbg">
        <a class="navbar-brand navbar-logo" href="#">IoT-Shop</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars text-white"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <div class="hori-selector"><div class="left"></div><div class="right"></div></div>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('Admin/monthly_sales_view'); ?>"><i class="fas fa-tachometer-alt"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('Admin/navigate_report'); ?>"><i class="fa fa-file-text"></i>Reports</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('Admin/admin_stocks'); ?>"><i class="fa fa-area-chart"></i>Stocks</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<?php echo base_url('Admin/admin_creditors'); ?>"><i class="fa fa-users"></i>Debitors</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="<?=base_url('Admin/all_user_view'); ?>"><i class="fa fa-user"></i>Profiles</a>
                </li>
            </ul>
        </div>
    </nav>


<div id="viewport">

    <div id="sidebar">
        <p></p>
        <div class="side-info">
            <div class="date">
                <p id="dt"></p>
            </div>
            <div class="time-container">
                <div class="time">
                    <p id="tm"></p>
                    <p id="apm"></p>
                </div>
            </div>
        </div>


        <input placeholder="Enter username.." type="hidden" name="joinRoomUserNameField" id="joinRoomUserNameField" value=" <?php echo $userTyp.' '.$userSes; ?>"></input>
        <input placeholder="Enter room name.." type="hidden" name="joinRoomNameField" id="joinRoomNameField" value="IoTSHOPChat"></input>


        <div id="messageContainer" class="chat">
            <div class="chat-title">
                <!-- <h2 id="roomName"></h2> -->
                <center><h2>Group Chat</h2></center>

            </div>
            <div class="messages">
            <input type="hidden" id="username" value=" <?php echo $userTyp.' '.$userSes; ?>"></input>
            <input type="hidden" id="roomName" value="IoTSHOPChat"></input>


                <p id="username" style="display:none;"></p>
                <div class="messages-content"><table id="displayTable"></table></div>
            </div>
            <div class="action-box">
                <textarea class="action-box-input" type="text" placeholder="Type message..." name="textField" id="textField" onkeydown="sendMessage(this)"></textarea>
                <button id="sendButton" class="action-box-submit" type="submit"><i class="fa fa-paper-plane"></i></button>
            </div>
        </div>

        <ul class="nav">

            <li>
                <a href="<?=base_url('Common/profile_adn'); ?>"><i class="fa fa-user" aria-hidden="true"> </i><p>Profile</p></a>
            </li>
            <li>
                <a href="<?= base_url().'Auth/logout'?>"><i class="fa fa-sign-out" aria-hidden="true"> </i><p>Log Out</p></a>
            </li>
        </ul>

    </div>

  <div id="content">
    <nav class="navbar navbar-default">
      <div class="container-fluid">
        <ul class="nav navbar-nav navbar-right">
          <li>
            <a href="#"><i class="zmdi zmdi-notifications text-danger"></i>
            </a>
          </li>

        </ul>
      </div>
    </nav>


    <dl id="rtabs" class="responsive-tabs" style="margin-left: 39px; margin-right: 39px; margin-bottom: 10px">

  <dt style="width: 33.3%;">Update Users</dt>
  <dd >


<div class="container-fluid">

        <div class="main-panel">

        <div class="main-panel-content">


            <div class="card" id="sales-summary">
              <div class="title">
                <h2>Users</h2>
                <p class="subtitle">Update users</p>
              </div>
              <div class="content">
                

            <?php foreach($result as $result){ ?>

                 <div class="col-lg-12 well">
        <div class="row">
        <form action="<?=base_url('Admin/admin_edited_profile/'.$result->user_id); ?>" method="post">
          <div class="col-sm-12">
            <div class="row">
              <div class="col-sm-4 form-group">
              <label>Select user id</label>
           <!--  <input type="text" name="position" placeholder="Enter Position Here.." class="form-control"> -->

            <input type="text" class="form-control" name="ID" value="<?= $result->user_id ?>" disabled="disabled">

              </div>
              <div class="col-sm-4 form-group">
                <label>First Name</label>
                <input type="text" name="fname" class="form-control" value="<?= $result->first_name ?>">
              </div>
              <div class="col-sm-4 form-group">
                <label>Last Name</label>
                <input type="text" name="lname" value="<?= $result->last_name ?>" class="form-control">
              </div>
            </div>
                       
            <div class="form-group">
              <label>Address</label>
              <textarea name="address" rows="3" class="form-control"><?= $result->address ?></textarea>
            </div>  
            <div class="row">

              <div class="col-sm-4 form-group">
                <label>NIC</label>
                <input type="text" name="nic" value="<?= $result->nic ?>" class="form-control" >
              </div> 
              
            <div class="col-sm-4 form-group">
            <label>Email Address</label>
              <input type="email" name="email"  value="<?= $result->email ?>" class="form-control">
            </div>   
              <div class="col-sm-4 form-group">
                <label>Contact No</label>
                <input type="text" name="contact" value="<?= $result->contact_no ?>" class="form-control">
              </div>    
            </div>
            <div class="row">
              <div class="col-sm-4 form-group">
                <label>Password</label>
                <input type="password" id="password" value="" onchange="confPass(this.value, document.getElementById('re-password').value);" name="password" placeholder="Enter Password Here.." class="form-control">
              </div>    
              <div class="col-sm-4 form-group">
                <label>Re - Password</label>
                <input type="password" name="re-password" value="" id="re-password" placeholder="Enter Password Again Here.." onchange="confPass(document.getElementById('password').value, this.value);" class="form-control">
              </div>  

              <div class="col-sm-4 form-group">
              <label>Position</label>
            <input type="text" name="position" class="form-control" value="<?= $result->position ?>" readonly>

  <!--           <select name="position" class="form-control">
              <option value="Admin">Admin</option>
              <option value="Cashier">Cashier</option>
              <option value="SManager">Stock manager</option>
            </select> -->
              </div>

            </div> 

        <!--   <div class="form-group">
            <label>Position</label> -->
           <!--  <input type="text" name="position" placeholder="Enter Position Here.." class="form-control"> -->
<!-- 
            <select name="position" class="form-control">
              <option value="Admin">Admin</option>
              <option value="Cashier">Cashier</option>
              <option value="SManager">Stock manager</option>
            </select>
          </div>  -->  
          <div class="row">
              <div class="col-sm-6 form-group">
                <label>Gender</label><br>
                Male : <input type="radio" name="gender" value="male" class="" <?php if($result->gender=='male') {echo "checked";}?>>
                Female : <input type="radio" name="gender" value="female" class="" <?php if($result->gender=='female') {echo "checked";}?>>
              </div>  
         
            </div> 
          <button type="submit" class="btn btn-lg btn-info">Submit</button>         
          </div>
        </form> 
        </div>
  </div>

   <?php } ?>



              </div>
            </div>
          </div>
        
    </div>


  </dd>

  <dt style="width: 33.3%;">All User</dt>
  <dd>

      

  </dd>

  <dt style="width: 33.3%;">Create Users</dt>
  <dd>
   


  </dd>

     
  </dd>
</dl>


    
  </div>
</div>
<!-- partial -->
  <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>
<script  src="<?php echo base_url('public/assets/js/nav-script.js'); ?>"></script>


<script type="text/javascript" src="<?php echo base_url('public/assets/scripts/scripts.js'); ?>"></script>


  <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.3/jquery.mCustomScrollbar.concat.min.js'></script>
<script  src="<?php echo base_url('public/assets/js/chat.js'); ?>"></script>

<!-- Chart -->


  <script src="<?php echo base_url('public/assets/lib/jquery/jquery.min.js'); ?>"></script>

  <script src="<?php echo base_url('public/assets/lib/bootstrap/js/bootstrap.min.js'); ?>"></script>

  <script src="<?php echo base_url('public/assets/lib/jquery.nicescroll.js'); ?>" type="text/javascript"></script>
 
  <script src="<?php echo base_url('public/assets/lib/common-scripts.js'); ?>"></script>
  <script type="text/javascript">
    function confPass(pass, repass) {
      if (pass != repass) {
        if (pass != "" && repass != "") {
          document.getElementById('password').value = '';
          document.getElementById('re-password').value = '';
          alert("Password Missmatch");
        }
        
      }
    }
  </script>


  <!-- Inlinetabs -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://codepen.io/gbhasha/pen/epggea.js'></script><script  src="<?php echo base_url('public/assets/js/tabs.js'); ?>"></script>

</body>
</html>
