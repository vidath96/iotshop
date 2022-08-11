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

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


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
                <li class="nav-item active">
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
                <li class="nav-item">
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
    <div class="container-fluid">

        <div class="main-panel">

        <div class="main-panel-content">


            <div class="card" id="sales-summary">
              <div class="title">
                <h2>Monthly sales</h2>
                <p class="subtitle">Sales Performance for the previous months</p>

                <SELECT class="selectpicker" style="position: right;" onchange="change();" id="branch">
                  <option value="all">All branches</option>

                  <option value="branch1">Branch - 1</option>
                  <option value="branch2">Branch - 2</option>
                  
                </SELECT>

                <SELECT class="selectpicker" style="position: right;" onchange="change();" id="year">
                  <?php
                    $yr = array();
                    foreach ($yr_list as $value) {
                      $yyr = explode('-', $value->bill_date);
                      if (!in_array($yyr[0], $yr)) {
                        array_push($yr, $yyr[0]);
                      }
                    }

                    foreach ($yr as $y) {
                      ?>
                        <option value="<?= $y; ?>"><?= $y; ?></option>
                      <?php
                    }
                    ?>
                  
                </SELECT>
              </div>
              <div class="content">
                
 

                <section id="main-content">

                  <section class="wrapper">
                     <canvas id="bar-chart" width="800" height="450"></canvas>


                      <script>
                        var yr = document.getElementById("year");
                  var optionyr = yr.options[yr.selectedIndex].value;
            $.ajax({
                url: <?= json_encode(base_url()); ?> + "admin/get_sales_json_yr/" + optionyr,
                type: "GET",
                success: function (data) {

                  
                    // Bar chart
                    var salesArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    for (var i = data.length - 1; i >= 0; i--) {
                      var res = data[i].bill_date.split("-");

                      var temp = 0;
                      if (res[1] == 01) {
                        temp = parseInt(salesArray[0]) + parseInt(data[i].amount);
                        salesArray[0] = temp;
                      } else if (res[1] == 02) {
                        temp = parseInt(salesArray[1]) + parseInt(data[i].amount);
                        salesArray[1] = temp;
                      } else if (res[1] == 03) {
                        temp = parseInt(salesArray[2]) + parseInt(data[i].amount);
                        salesArray[2] = temp;
                      } else if (res[1] == 04) {
                        temp = parseInt(salesArray[3]) + parseInt(data[i].amount);
                        salesArray[3] = temp;
                      } else if (res[1] == 05) {
                        temp = parseInt(salesArray[4]) + parseInt(data[i].amount);
                        salesArray[4] = temp;
                      } else if (res[1] == 06) {
                        temp = parseInt(salesArray[5]) + parseInt(data[i].amount);
                        salesArray[5] = temp;
                      } else if (res[1] == 07) {

                        temp = parseInt(salesArray[6]) + parseInt(data[i].amount);
                        salesArray[6] = temp;
                      } else if (res[1] == 08) {
                        temp = parseInt(salesArray[7]) + parseInt(data[i].amount);
                        salesArray[7] = temp;
                      } else if (res[1] == 09) {
                        temp = parseInt(salesArray[8]) + parseInt(data[i].amount);
                        salesArray[8] = temp;
                      } else if (res[1] == 10) {
                        temp = parseInt(salesArray[9]) + parseInt(data[i].amount);
                        salesArray[9] = temp;
                      } else if (res[1] == 11) {
                        temp = parseInt(salesArray[10]) + parseInt(data[i].amount);
                        salesArray[10] = temp;
                      } else if (res[1] == 12) {
                        temp = parseInt(salesArray[11]) + parseInt(data[i].amount);
                        salesArray[11] = temp;
                      }
                    }
                    new Chart(document.getElementById("bar-chart"), {
                        type: 'bar',
                        data: {
                          labels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
                          datasets: [
                            {
                              label: "Sales",
                              backgroundColor: ["#ffc107", "#ffb300","#ffa000","#ff8f00","#c45850","#c45980",,"#ff6f00",,"#ffab00",,"#ffc400 ",,"#ffd740",,"#ffe57f",,"#ffecb3",],
                              data: salesArray
                            }
                          ]
                        },
                        options: {
                          legend: { display: false },
                          title: {
                            display: true,
                            text: 'Monthly sales on IoT-Shop.lk'
                          }
                        }
                    });
                      },
                          error: function (data) {
                            toastr.error('Something went wrong!');
                          }
                        });

            function change() {
              var e = document.getElementById("branch");
              var option = e.options[e.selectedIndex].value;

              var yr = document.getElementById("year");
              var optionyr = yr.options[yr.selectedIndex].value;

              if (option == 'all') {
                $.ajax({
                url: <?= json_encode(base_url()); ?> + "admin/get_sales_json_yr/" + optionyr,
                type: "GET",
                success: function (data) {
                    // Bar chart
                    var salesArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    for (var i = data.length - 1; i >= 0; i--) {
                      var res = data[i].bill_date.split("-");

                      var temp = 0;
                      if (res[1] == 01) {
                        temp = parseInt(salesArray[0]) + parseInt(data[i].amount);
                        salesArray[0] = temp;
                      } else if (res[1] == 02) {
                        temp = parseInt(salesArray[1]) + parseInt(data[i].amount);
                        salesArray[1] = temp;
                      } else if (res[1] == 03) {
                        temp = parseInt(salesArray[2]) + parseInt(data[i].amount);
                        salesArray[2] = temp;
                      } else if (res[1] == 04) {
                        temp = parseInt(salesArray[3]) + parseInt(data[i].amount);
                        salesArray[3] = temp;
                      } else if (res[1] == 05) {
                        temp = parseInt(salesArray[4]) + parseInt(data[i].amount);
                        salesArray[4] = temp;
                      } else if (res[1] == 06) {
                        temp = parseInt(salesArray[5]) + parseInt(data[i].amount);
                        salesArray[5] = temp;
                      } else if (res[1] == 07) {

                        temp = parseInt(salesArray[6]) + parseInt(data[i].amount);
                        salesArray[6] = temp;
                      } else if (res[1] == 08) {
                        temp = parseInt(salesArray[7]) + parseInt(data[i].amount);
                        salesArray[7] = temp;
                      } else if (res[1] == 09) {
                        temp = parseInt(salesArray[8]) + parseInt(data[i].amount);
                        salesArray[8] = temp;
                      } else if (res[1] == 10) {
                        temp = parseInt(salesArray[9]) + parseInt(data[i].amount);
                        salesArray[9] = temp;
                      } else if (res[1] == 11) {
                        temp = parseInt(salesArray[10]) + parseInt(data[i].amount);
                        salesArray[10] = temp;
                      } else if (res[1] == 12) {
                        temp = parseInt(salesArray[11]) + parseInt(data[i].amount);
                        salesArray[11] = temp;
                      }
                    }
                    new Chart(document.getElementById("bar-chart"), {
                        type: 'bar',
                        data: {
                          labels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
                          datasets: [
                            {
                              label: "Sales",
                              backgroundColor: ["linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#c45980",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"#c46250",,"#c49020",,"#c45870",],
                              data: salesArray
                            }
                          ]
                        },
                        options: {
                          legend: { display: false },
                          title: {
                            display: true,
                            text: 'Monthly sales on IoT-Shop.lk'
                          }
                        }
                    });
                      },
                          error: function (data) {
                            toastr.error('Something went wrong!');
                          }
                        });
              
            } else if (option == 'branch1') {
              $.ajax({
                url: <?= json_encode(base_url()); ?> + "admin/get_sales_json_option/branch1/" + optionyr,
                type: "GET",
                success: function (data) {
                    // Bar chart
                    var salesArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    for (var i = data.length - 1; i >= 0; i--) {
                      var res = data[i].bill_date.split("-");

                      var temp = 0;
                      if (res[1] == 01) {
                        temp = parseInt(salesArray[0]) + parseInt(data[i].amount);
                        salesArray[0] = temp;
                      } else if (res[1] == 02) {
                        temp = parseInt(salesArray[1]) + parseInt(data[i].amount);
                        salesArray[1] = temp;
                      } else if (res[1] == 03) {
                        temp = parseInt(salesArray[2]) + parseInt(data[i].amount);
                        salesArray[2] = temp;
                      } else if (res[1] == 04) {
                        temp = parseInt(salesArray[3]) + parseInt(data[i].amount);
                        salesArray[3] = temp;
                      } else if (res[1] == 05) {
                        temp = parseInt(salesArray[4]) + parseInt(data[i].amount);
                        salesArray[4] = temp;
                      } else if (res[1] == 06) {
                        temp = parseInt(salesArray[5]) + parseInt(data[i].amount);
                        salesArray[5] = temp;
                      } else if (res[1] == 07) {

                        temp = parseInt(salesArray[6]) + parseInt(data[i].amount);
                        salesArray[6] = temp;
                      } else if (res[1] == 08) {
                        temp = parseInt(salesArray[7]) + parseInt(data[i].amount);
                        salesArray[7] = temp;
                      } else if (res[1] == 09) {
                        temp = parseInt(salesArray[8]) + parseInt(data[i].amount);
                        salesArray[8] = temp;
                      } else if (res[1] == 10) {
                        temp = parseInt(salesArray[9]) + parseInt(data[i].amount);
                        salesArray[9] = temp;
                      } else if (res[1] == 11) {
                        temp = parseInt(salesArray[10]) + parseInt(data[i].amount);
                        salesArray[10] = temp;
                      } else if (res[1] == 12) {
                        temp = parseInt(salesArray[11]) + parseInt(data[i].amount);
                        salesArray[11] = temp;
                      }
                    }
                    new Chart(document.getElementById("bar-chart"), {
                        type: 'bar',
                        data: {
                          labels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
                          datasets: [
                            {
                              label: "Sales",
                              backgroundColor: ["linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#c45980",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"#c46250",,"#c49020",,"#c45870",],
                              data: salesArray
                            }
                          ]
                        },
                        options: {
                          legend: { display: false },
                          title: {
                            display: true,
                            text: 'Monthly sales on IoT-Shop.lk'
                          }
                        }
                    });
                      },
                          error: function (data) {
                            toastr.error('Something went wrong!');
                          }
                        });
            } else if (option == 'branch2') {
              $.ajax({
                url: <?= json_encode(base_url()); ?> + "admin/get_sales_json_option/branch2/" + optionyr,
                type: "GET",
                success: function (data) {
                    // Bar chart
                    var salesArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
                    for (var i = data.length - 1; i >= 0; i--) {
                      var res = data[i].bill_date.split("-");

                      var temp = 0;
                      if (res[1] == 01) {
                        temp = parseInt(salesArray[0]) + parseInt(data[i].amount);
                        salesArray[0] = temp;
                      } else if (res[1] == 02) {
                        temp = parseInt(salesArray[1]) + parseInt(data[i].amount);
                        salesArray[1] = temp;
                      } else if (res[1] == 03) {
                        temp = parseInt(salesArray[2]) + parseInt(data[i].amount);
                        salesArray[2] = temp;
                      } else if (res[1] == 04) {
                        temp = parseInt(salesArray[3]) + parseInt(data[i].amount);
                        salesArray[3] = temp;
                      } else if (res[1] == 05) {
                        temp = parseInt(salesArray[4]) + parseInt(data[i].amount);
                        salesArray[4] = temp;
                      } else if (res[1] == 06) {
                        temp = parseInt(salesArray[5]) + parseInt(data[i].amount);
                        salesArray[5] = temp;
                      } else if (res[1] == 07) {

                        temp = parseInt(salesArray[6]) + parseInt(data[i].amount);
                        salesArray[6] = temp;
                      } else if (res[1] == 08) {
                        temp = parseInt(salesArray[7]) + parseInt(data[i].amount);
                        salesArray[7] = temp;
                      } else if (res[1] == 09) {
                        temp = parseInt(salesArray[8]) + parseInt(data[i].amount);
                        salesArray[8] = temp;
                      } else if (res[1] == 10) {
                        temp = parseInt(salesArray[9]) + parseInt(data[i].amount);
                        salesArray[9] = temp;
                      } else if (res[1] == 11) {
                        temp = parseInt(salesArray[10]) + parseInt(data[i].amount);
                        salesArray[10] = temp;
                      } else if (res[1] == 12) {
                        temp = parseInt(salesArray[11]) + parseInt(data[i].amount);
                        salesArray[11] = temp;
                      }
                    }
                    new Chart(document.getElementById("bar-chart"), {
                        type: 'bar',
                        data: {
                          labels: ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"],
                          datasets: [
                            {
                              label: "Sales",
                              backgroundColor: ["linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#c45980",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"linear-gradient(to bottom, #FFA62E 0%, #EA4D2C 100%)",,"#c46250",,"#c49020",,"#c45870",],
                              data: salesArray
                            }
                          ]
                        },
                        options: {
                          legend: { display: false },
                          title: {
                            display: true,
                            text: 'Monthly sales on IoT-Shop.lk'
                          }
                        }
                    });
                      },
                          error: function (data) {
                            toastr.error('Something went wrong!');
                          }
                        });
            }
          }
                    </script>

                  </section>
                

                </section>
       
    <!--   <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart">
            <div class="custom-bar-chart">
              <ul class="y-axis">
                <li><span>100000</span></li>
                <li><span>80000</span></li>
                <li><span>60000</span></li>
                <li><span>40000</span></li>
                <li><span>20000</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">JAN</div>
                <div class="value tooltips" data-original-title="8.500" data-toggle="tooltip" data-placement="top">85%</div>
              </div>
              <div class="bar ">
                <div class="title">FEB</div>
                <div class="value tooltips" data-original-title="5.000" data-toggle="tooltip" data-placement="top">50%</div>
              </div>
              <div class="bar ">
                <div class="title">MAR</div>
                <div class="value tooltips" data-original-title="6.000" data-toggle="tooltip" data-placement="top">60%</div>
              </div>
              <div class="bar ">
                <div class="title">APR</div>
                <div class="value tooltips" data-original-title="4.500" data-toggle="tooltip" data-placement="top">45%</div>
              </div>
              <div class="bar">
                <div class="title">MAY</div>
                <div class="value tooltips" data-original-title="3.200" data-toggle="tooltip" data-placement="top">32%</div>
              </div>
              <div class="bar ">
                <div class="title">JUN</div>
                <div class="value tooltips" data-original-title="6.200" data-toggle="tooltip" data-placement="top">62%</div>
              </div>
              <div class="bar">
                <div class="title">JUL</div>
                <div class="value tooltips" data-original-title="7.500" data-toggle="tooltip" data-placement="top">75%</div>
              </div>
            </div>



          
    
      </section> -->

    </section>



              </div>
            </div>
          </div>
        
    </div>
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

  <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

 
</body>
</html>
