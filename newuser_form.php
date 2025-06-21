<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

if(!empty($_POST["fullname"])) {
    $fullname= $_POST["fullname"];
    
    $sql ="SELECT UserName FROM tbladmin WHERE UserName=:fullname";
    $query= $dbh -> prepare($sql);
    $query-> bindParam(':fullname', $fullname, PDO::PARAM_STR);
    $query-> execute();

    if($query -> rowCount() > 0) {
        echo "<script>alert('Username already exists. try another one');</script>";
    } else {
        if(isset($_POST['signup'])) { 
            $fname = $_POST['fullname'];
            $firstname = $_POST['firstname'];
            $lastname = $_POST['lastname'];
            $email = $_POST['emailid']; 
            $staffid = $_POST['staffid']; 
            $mobile = $_POST['mobileno'];
            $dignity = $_POST['dignity']; 
            $factory = $_POST['factory'];  // <-- Added factory here
            $password = md5($_POST['password']);  // keep md5 hashing

            $sql = "INSERT INTO tbladmin(Staffid, AdminName, UserName, FirstName, LastName, Email, MobileNumber, Password, Factory) 
                    VALUES(:staffid, :dignity, :fname, :firstname, :lastname, :email, :mobile, :password, :factory)";
            $query = $dbh->prepare($sql);
            $query->bindParam(':staffid', $staffid, PDO::PARAM_STR);
            $query->bindParam(':dignity', $dignity, PDO::PARAM_STR);
            $query->bindParam(':fname', $fname, PDO::PARAM_STR);
            $query->bindParam(':firstname', $firstname, PDO::PARAM_STR);
            $query->bindParam(':lastname', $lastname, PDO::PARAM_STR);
            $query->bindParam(':email', $email, PDO::PARAM_STR);
            $query->bindParam(':mobile', $mobile, PDO::PARAM_STR);
            $query->bindParam(':password', $password, PDO::PARAM_STR);
            $query->bindParam(':factory', $factory, PDO::PARAM_STR);
            
            if($query->execute()) {
                echo "<script>alert('Registration successfull. Now you can login');</script>";
            } else {
                echo "<script>alert('Something went wrong. Please try again');</script>";
            }
        }
    }
}
?>

<script>
function checkAvailability() {
    $("#loaderIcon").show();
    jQuery.ajax({
        url: "check_availability.php",
        data:'emailid='+$("#emailid").val(),
        type: "POST",
        success:function(data) {
            $("#user-availability-status").html(data);
            $("#loaderIcon").hide();
        },
        error:function (){}
    });
}

function checkAvailability2() {
    $("#loaderIcon").show();
    jQuery.ajax({
        url: "check_availability.php",
        data:'fullname='+$("#fullname").val(),
        type: "POST",
        success:function(data) {
            $("#user-availability-status2").html(data);
            $("#loaderIcon").hide();
        },
        error:function (){}
    });
}

function valid() {
    if(document.signup.password.value != document.signup.confirmpassword.value) {
        alert("Password and Confirm Password Field do not match  !!");
        document.signup.confirmpassword.focus();
        return false;
    }
    return true;
}
</script>

<div class="card-body">
    <form method="post" name="signup" onSubmit="return valid();">
        <div class="row ">
            <div class="form-group col-md-6">
                <select class="form-control" name="dignity" id="dignity" required>
                    <option value="">Select permissions</option>
                    <option value="Admin">Admin</option>
                    <option value="User">User</option>
                </select>
            </div>
            <div class="form-group col-md-6">
                <input type="text" class="form-control" name="staffid" placeholder="Staff ID" required>
            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-6">
                <input type="text" class="form-control" name="fullname" id="fullname" placeholder="User Name" onBlur="checkAvailability2()" required>
                <span id="user-availability-status2" style="font-size:12px;"></span>
            </div>
            <div class="form-group col-md-6">
                <input type="text" class="form-control" name="firstname" placeholder="First Name" required>
            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-6">
                <input type="text" class="form-control" name="lastname" placeholder="Last Name" required>
            </div>
            <div class="form-group col-md-6">
                <input type="text" class="form-control" name="mobileno" placeholder="Mobile Number" maxlength="10" required>
            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-6">
                <input type="email" class="form-control" name="emailid" id="emailid" onBlur="checkAvailability()" placeholder="Email Address" required>
                <span id="user-availability-status" style="font-size:12px;"></span> 
            </div>
            
            <div class="form-group col-md-6">
                <select class="form-control" name="factory" id="factory" required>
                    <option value="">Select Factory</option>
                    <option value="ABM">ABM</option>
                    <option value="AJL">AJL</option>
                    <option value="AGL">AGL</option>
                    <option value="Head Office">Head Office</option>
                </select>
            </div>
        </div>
        
        <div class="row">
            <div class="form-group col-md-6">
                <input type="password" class="form-control" name="password" placeholder="Password" required>
            </div>
            
            <div class="form-group col-md-6">
                <input type="password" class="form-control" name="confirmpassword" placeholder="Confirm Password" required>
            </div>
        </div>
        
        <div class="form-group">
            <input type="submit" value="Register" name="signup" id="submit" class="btn btn-info">
        </div>
    </form>
</div>
