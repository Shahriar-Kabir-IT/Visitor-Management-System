<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

if(isset($_POST['login']))
{
    $username = $_POST['username'];
    $password = md5($_POST['password']);
    $factory  = strtoupper(trim($_POST['factory'])); // Get selected factory

    $sql = "SELECT * FROM tbladmin WHERE UserName = :username AND Password = :password AND Factory = :factory";
    $query = $dbh->prepare($sql);
    $query->bindParam(':username', $username, PDO::PARAM_STR);
    $query->bindParam(':password', $password, PDO::PARAM_STR);
    $query->bindParam(':factory', $factory, PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);

    if($query->rowCount() > 0)
    {
        foreach ($results as $result) 
        {
            if($result->Status == "1")
            { 
                $_SESSION['odmsaid']     = $result->ID;
                $_SESSION['login']       = $result->UserName;
                $_SESSION['names']       = $result->FirstName;
                $_SESSION['permission']  = $result->AdminName;
                $_SESSION['companyname'] = $result->CompanyName;
                $_SESSION['factory']     = strtoupper($result->Factory);

                // Redirect based on factory
                switch ($_SESSION['factory']) {
                    case 'ABM':
                        echo "<script>document.location ='dashboard_abm.php';</script>";
                        break;
                    case 'AJL':
                        echo "<script>document.location ='dashboard_ajl.php';</script>";
                        break;
                    case 'AGL':
                        echo "<script>document.location ='dashboard_agl.php';</script>";
                        break;
                    case 'HEAD OFFICE':
                        echo "<script>document.location ='dashboard.php';</script>";
                        break;
                    default:
                        echo "<script>alert('Unknown factory.');document.location ='index.php';</script>";
                        break;
                }
            } 
            else 
            { 
                echo "<script>
                    alert('Your account was deactivated. Approach Admin.');
                    document.location ='index.php';
                </script>";
            }
        } 
    } 
    else {
        echo "<script>alert('Invalid login details or factory mismatch.');</script>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<?php @include("includes/head.php");?>
<body>
    <div class="container-scroller">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth">
                <div class="row flex-grow">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-left p-5">
                            <div class="brand-logo" align="center">
                                <img class="img-avatar mb-3" src="companyimages/ananta.png" alt="">
                                <h3>Ananta Companies Visitor Management System</h3>
                            </div>
                            <form role="form" method="post" enctype="multipart/form-data" class="form-horizontal">  
                                <div class="form-group mb-3">
                                    <input type="text" class="form-control form-control-lg" name="username" placeholder="Username" required>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="password" name="password" class="form-control form-control-lg" placeholder="Password" required>
                                </div>
                                <!-- ✅ Factory Dropdown including Head Office -->
                                <div class="form-group mt-3">
                                    <select class="form-control form-control-lg" name="factory" required>
                                        <option value="">Select Factory</option>
                                        <option value="Head Office">Head Office</option>
                                        <option value="ABM">ABM</option>
                                        <option value="AJL">AJL</option>
                                        <option value="AGL">AGL</option>
                                    </select>
                                    <div class="mt-3">
  <button name="login" class="btn btn-block btn btn-info btn-lg font-weight-medium auth-form-btn">
    SIGN IN
  </button>
</div>

                                </div>
