<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');

function check_login()
{
    if(strlen($_SESSION['odmsaid']) == 0)
    {	
        $host = $_SERVER['HTTP_HOST'];
        $uri  = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
        $extra = "index.php";		
        $_SESSION["id"] = "";
        header("Location: http://$host$uri/$extra");
        exit();
    } 
    else 
    {
        $current_file = basename($_SERVER['PHP_SELF']);
        $factory = strtoupper($_SESSION['factory']);

        // Factory prefix check
        $allowed_prefix = '';
        switch ($factory) {
            case "ABM":
                $allowed_prefix = 'abm';
                break;
            case "AJL":
                $allowed_prefix = 'ajl';
                break;
                case "PWPL":
                $allowed_prefix = 'pwpl';
                break;
            case "AGL":
                $allowed_prefix = 'agl';
                break;
            case "HEAD OFFICE":
                return; // Allow all for head office
            default:
                header("Location: index.php");
                exit();
        }

        // Redirect if page is not for the correct factory
        if (!str_contains($current_file, $allowed_prefix)) {
            $redirect_page = "dashboard_" . strtolower($allowed_prefix) . ".php";
            header("Location: $redirect_page");
            exit();
        }
    }
}
?>
