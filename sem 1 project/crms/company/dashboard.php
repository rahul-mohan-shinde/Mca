<?php session_start();
error_reporting(0);
include('includes/dbconnection.php');
error_reporting(0);
if (strlen($_SESSION['crmscid']==0)) {
  header('location:logout.php');
  } else{ ?>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <title>Campus Recruitment Management System-Company Dashboard</title>
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
                    <h6> Company Dashboard </h6>
                </div>








              
            </div>
      
         
<div class="row my-3">

                            <?php 
$cid=$_SESSION['crmscid'];
$query=mysqli_query($con,"Select * from  tblvacancy where CompanyID='$cid'");
$vaccounts=mysqli_num_rows($query);
?>

                    <div class="col-md-4">
                        <a href="manage-vacancy.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                    <span class="icon icon-note-list text-light-blue s-48"></span>
                                </div>
                                <div class="counter-title">Posted Vacancies</div>
                                <h5 class="sc-counter mt-3"><?php echo $vaccounts;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div></a>
                    </div>


<?php 
$query1=mysqli_query($con,"Select * from  tblapplyjob join tblvacancy on  tblvacancy.ID=tblapplyjob.JobId where tblvacancy.CompanyID='$cid'");
$totalapplications=mysqli_num_rows($query1);
?>

                    <div class="col-md-4">
                          <a href="all-applications.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                    <span class="icon icon-mail-envelope-open s-48"></span>
                                </div>
                                <div class="counter-title ">Total Job Applcation</div>
                                <h5 class="sc-counter mt-3"><?php echo $totalapplications;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div>
                    </a>
                    </div>

<?php 
$query12=mysqli_query($con,"Select * from  tblapplyjob join tbluser on tblapplyjob.UserId=tbluser.ID join tblvacancy on tblapplyjob.JobId=tblvacancy.ID  where tblvacancy.CompanyID='$cid' && tblapplyjob.Status is null and tblvacancy.CompanyID='$cid'");
$newapplication=mysqli_num_rows($query12);
?>



                    <div class="col-md-4">
                           <a href="new-applications.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-blue s-48"></span>
                                </div>
                                <div class="counter-title">New Job Applications</div>
                                <h5 class="sc-counter mt-3"><?php echo $newapplication;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div>
                    </a>
                    </div>

<?php $query3=mysqli_query($con,"Select * from  tblapplyjob join tblvacancy on  tblvacancy.ID=tblapplyjob.JobId where tblvacancy.CompanyID='$cid' and tblapplyjob.Status='Sorted'");
$totalselapp=mysqli_num_rows($query3); ?>

                    <div class="col-md-4" style="margin-top:2%;">
                        <a href="sort-listed-applications.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-yellow s-48"></span>
                                </div>
                                <div class="counter-title">Sort Listed Job Applications</div>
                                <h5 class="sc-counter mt-3"><?php echo $totalselapp;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div></a>
                    </div>






<?php $query3=mysqli_query($con,"Select * from  tblapplyjob join tblvacancy on  tblvacancy.ID=tblapplyjob.JobId where tblvacancy.CompanyID='$cid' and tblapplyjob.Status='Selected'");
$totalselapp=mysqli_num_rows($query3); ?>

                    <div class="col-md-4" style="margin-top:2%;">
                         <a href="selected-applications.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-green s-48"></span>
                                </div>
                                <div class="counter-title">Selected Job Applications</div>
                                <h5 class="sc-counter mt-3"><?php echo $totalselapp;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div></a>
                    </div>
<?php $query4=mysqli_query($con,"Select * from  tblapplyjob join tblvacancy on  tblvacancy.ID=tblapplyjob.JobId where tblvacancy.CompanyID='$cid' and tblapplyjob.Status='Rejected'");
$totalrejapp=mysqli_num_rows($query4); ?>

     <div class="col-md-4" style="margin-top:2%;">
           <a href="rejected-applications.php" target="blank">
                        <div class="counter-box white r-5 p-3">
                            <div class="p-4">
                                <div class="float-right">
                                            <span class="icon icon-mail-envelope-open text-red s-48"></span>
                                </div>
                                <div class="counter-title">Rejected Job Applications</div>
                                <h5 class="sc-counter mt-3"><?php echo $totalrejapp;?></h5>
                            </div>
                            <div class="progress progress-xs r-0">
                                <div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="128"></div>
                            </div>
                        </div>
                    </a>
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