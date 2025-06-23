<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

$toastMessage = ''; // Toast message holder

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
                        $toastMessage = "Unknown factory.";
                        break;
                }
            } 
            else 
            { 
                $toastMessage = "Your account was deactivated. Approach Admin.";
            }
        } 
    } 
    else {
        $toastMessage = "Invalid login details or location mismatch.";
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
                                <h3>Visitor Management System</h3>
                            </div>
                            <form role="form" method="post" enctype="multipart/form-data" class="form-horizontal" onsubmit="return validateForm()">  
                                <div class="form-group mb-3">
                                    <input type="text" id="username" class="form-control form-control-lg" name="username" placeholder="Username" style="background-color: #e6f0ff; border: 2px solid #007bff; font-weight: bold; color: #000;">
                                </div>
                                <div class="form-group mt-3">
                                    <input type="password" id="password" name="password" class="form-control form-control-lg" placeholder="Password" style="background-color: #e6f0ff; border: 2px solid #007bff; font-weight: bold; color: #000;">
                                </div>
                                <div class="form-group mt-3">
                                    <select class="form-control form-control-lg" name="factory" id="factory" style="background-color: #e6f0ff; border: 2px solid #007bff; font-weight: bold; color: #000;">
                                        <option value="">Select Location</option>
                                        <option value="Head Office">Ananta Companies Head Office</option>
                                        <option value="ABM">ABM Fashions Limited</option>
                                        <option value="AJL">Ananta Jeanswear Limited</option>
                                        <option value="AGL">Ananta Garments Limited</option>
                                    </select>
                                    <div class="mt-3">
                                        <button name="login" class="btn btn-block btn btn-info btn-lg font-weight-medium auth-form-btn">
                                            SIGN IN
                                        </button>
                                    </div>
                                </div>  
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- ✅ Custom Toast Box -->
    <div id="toast" style="
        visibility: hidden;
        min-width: 250px;
        background-color: #dc3545;
        color: #fff;
        text-align: center;
        border-radius: 8px;
        padding: 14px;
        position: fixed;
        z-index: 9999;
        left: 50%;
        bottom: 30px;
        transform: translateX(-50%);
        font-weight: bold;
        box-shadow: 0 0 10px rgba(0,0,0,0.3);
        font-size: 16px;
        transition: visibility 0.3s ease-in-out;
    ">
        Validation message here
    </div>

    <script>
        function showToast(message) {
            const toast = document.getElementById("toast");
            toast.innerText = message;
            toast.style.visibility = "visible";
            setTimeout(() => {
                toast.style.visibility = "hidden";
            }, 3000);
        }

        function validateForm() {
            const username = document.getElementById('username').value.trim();
            const password = document.getElementById('password').value.trim();
            const factory = document.getElementById('factory').value;

            if (username === "") {
                showToast("Please enter your username.");
                return false;
            }
            if (password === "") {
                showToast("Please enter your password.");
                return false;
            }
            if (factory === "") {
                showToast("Please select a Location.");
                return false;
            }
            return true;
        }
    </script>

    <?php if (!empty($toastMessage)): ?>
    <script>
        window.onload = function() {
            showToast("<?php echo $toastMessage; ?>");
        };
    </script>
    <?php endif; ?>
</body>
</html>
