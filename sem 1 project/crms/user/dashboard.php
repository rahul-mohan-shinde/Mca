<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
error_reporting(0);
if (strlen($_SESSION['crmsuid']==0)) {
  header('location:logout.php');
  } else{ ?>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>Campus Recruitment Management System-User Dashboard</title>
    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/app.css">
    <style>
        .loader {
            position: fixed;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: #F5F8FA;
            z-index: 9998;
            text-align: center;
        }

        .plane-container {
            position: absolute;
            top: 50%;
            left: 50%;
        }
    </style>
</head>
<body class="light">
<!-- Pre loader -->
<div id="loader" class="loader">
    <div class="plane-container">
        <div class="preloader-wrapper small active">


    
        </div>
    </div>
</div>
<div id="app">
<?php include_once('includes/sidebar.php');?>

<div class="page has-sidebar-left">
   
    <?php include_once('includes/header.php');?>

    <div class="container-fluid animatedParent animateOnce my-3">
        <div class="animated fadeInUpShort">
            <div class="card">
                <div class="card-header white">
                    <h6> User Dashboard </h6>
                </div>








              
            </div>

<div class="row my-3">

<?php                    
//Total Vacancy
 $query4=mysqli_query($con,"select ID from tblvacancy");
$count_total_vacancy=mysqli_num_rows($query4); ?>

     <div class="col-md-4" >
           <a href="view-vacancy.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                         <span class="icon icon-note-list text-light-blue s-48"></span>
                                </div>
                                <div class="counter-title">Listed Vacancies/Jobs</div>
                                <h5 class="sc-counter mt-3"><?php echo $count_total_vacancy;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div>
                    </a>
                    </div>


<?php $uid=$_SESSION['crmsuid'];
//Total applied Jobs
 $query3=mysqli_query($con,"select ID from tblapplyjob where UserId='$uid'");
$count_total_appjob=mysqli_num_rows($query3);
 ?>

                    <div class="col-md-4">
                          <a href="histroy-applied-job.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                    <span class="icon icon-mail-envelope-open s-48"></span>
                                </div>
                                <div class="counter-title ">Total Applied Jobs </div>
                                <h5 class="sc-counter mt-3"><?php echo $count_total_appjob;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div>
                    </a>
                    </div>

<?php 
//todays applied Jobs
 $query=mysqli_query($con,"select ID from tblapplyjob where UserId='$uid' && date(ApplyDate)=CURDATE();");
$count_today_appjob=mysqli_num_rows($query);
 ?> 



                    <div class="col-md-4">
                           <a href="histroy-applied-job.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-blue s-48"></span>
                                </div>
                                <div class="counter-title">Today's Applied Jobs</div>
                                <h5 class="sc-counter mt-3"><?php echo $count_today_appjob;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div>
                    </a>
                    </div>
<hr />
<?php  $query2=mysqli_query($con,"select ID from tblapplyjob where UserId='$uid' && date(ApplyDate)=DATE(NOW()) - INTERVAL 1 DAY");
$count_yesterday_appjob=mysqli_num_rows($query2);
?>

                    <div class="col-md-4" style="margin-top:2%;">
                        <a href="histroy-applied-job.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-yellow s-48"></span>
                                </div>
                                <div class="counter-title">Yesterdays Applied Jobs</div>
                                <h5 class="sc-counter mt-3"><?php echo $count_yesterday_appjob;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div></a>
                    </div>






<?php  $query2=mysqli_query($con,"select ID from tblapplyjob where UserId='$uid' && date(ApplyDate)=DATE(NOW()) - INTERVAL 1 DAY");
$count_sevenday_appjob=mysqli_num_rows($query2);
?>

                    <div class="col-md-4" style="margin-top:2%;">
                         <a href="histroy-applied-job.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-green s-48"></span>
                                </div>
                                <div class="counter-title">Applied Jobs in Last 7 Days</div>
                                <h5 class="sc-counter mt-3"><?php echo $count_sevenday_appjob;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div></a>
                    </div>



        












                </div>
            </div>
         
        </div>
    </div>
</div>

<div class="control-sidebar-bg shadow white fixed"></div>
</div>
<!--/#app -->
<script src="assets/js/app.js"></script>
</body>
</html>

<?php } ?>