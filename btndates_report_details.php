<?php
session_start();
error_reporting(0);
include('includes/dbconnection.php');
function check_login()
{
	if(strlen($_SESSION['odmsaid'])==0)
	{	
		$host = $_SERVER['HTTP_HOST'];
		$uri  = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
		$extra="index.php";		
		$_SESSION["id"]="";
		header("Location: http://$host$uri/$extra");
	}
}
check_login();

// Handle CSV download
if (isset($_POST['download_csv']) && !empty($_POST['fromdate']) && !empty($_POST['todate']) && !empty($_POST['factory'])) {
  $fdate = $_POST['fromdate'];
  $tdate = $_POST['todate'];
  $factory = $_POST['factory'];
  $table_name = ($factory === 'headoffice') ? "tblvisitor" : "tblvisitor" . $factory;

  header('Content-Type: text/csv');
  header('Content-Disposition: attachment; filename="visitor_report_' . $fdate . '_to_' . $tdate . '_' . $factory . '.csv"');

  $output = fopen("php://output", "w");
  fputcsv($output, ['Full Name', 'Mobile Number', 'Whom to Visit', 'Reason to Meet', 'Company Name & Address', 'Entry Date', 'Entry Time', 'Exit Time']);

  $sql = "SELECT * FROM $table_name WHERE date(EnterDate) BETWEEN :fdate AND :tdate";
  $query = $dbh->prepare($sql);
  $query->bindParam(':fdate', $fdate, PDO::PARAM_STR);
  $query->bindParam(':tdate', $tdate, PDO::PARAM_STR);
  $query->execute();
  $results = $query->fetchAll(PDO::FETCH_OBJ);

  foreach ($results as $row) {
    $entryDate = date("d-m-Y", strtotime($row->EnterDate));
    $entryTime = date("H:i:s", strtotime($row->EnterDate));
    $exitTime = !empty($row->outtime) ? date("H:i:s", strtotime($row->outtime)) : '';

    fputcsv($output, [
      $row->FullName,
      $row->MobileNumber,
      $row->WhomtoMeet,
      $row->ReasontoMeet,
      $row->Address,
      $entryDate,
      $entryTime,
      $exitTime
    ]);
  }

  fclose($output);
  exit;
}
?>
<!DOCTYPE html>
<html lang="en">
<?php @include("includes/head.php"); ?>
<body>
  <div class="container-scroller">
    <?php @include("includes/header.php"); ?>
    <div class="container-fluid page-body-wrapper">
      <?php @include("includes/sidebar.php"); ?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="modal-header">
                  <h5 class="modal-title">Between Dates Reports</h5>
                </div>
                <div class="col-md-12 mt-4">
                  <form class="forms-sample" method="post">
                    <div class="row">
                      <div class="form-group col-md-4">
                        <label>From Date</label>
                        <input type="date" name="fromdate" class="form-control" required>
                      </div>
                      <div class="form-group col-md-4">
                        <label>To Date</label>
                        <input type="date" name="todate" class="form-control" required>
                      </div>
                      <div class="form-group col-md-4">
                        <label>Select Factory</label>
                        <select name="factory" class="form-control" required>
                          <option value="">-- Select Factory --</option>
                          <option value="headoffice">Head Office</option>
                          <option value="abm">ABM</option>
                          <option value="ajl">AJL</option>
                          <option value="agl">AGL</option>
                        </select>
                      </div>
                    </div>
                    <button type="submit" name="search" class="btn btn-primary btn-sm mb-4">Search</button>
                    <button type="submit" name="download_csv" class="btn btn-warning btn-sm mb-4 ml-2">Download CSV</button>
                  </form>
                </div>
              </div>
            </div>

            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <?php if (isset($_POST['search']) && !empty($_POST['fromdate']) && !empty($_POST['factory'])):
                  $fdate = $_POST['fromdate'];
                  $tdate = $_POST['todate'];
                  $factory = $_POST['factory'];
                  $table_name = ($factory === 'headoffice') ? "tblvisitor" : "tblvisitor" . $factory;
                ?>
                <div class="table-responsive p-3">
                  <h5 align="center" style="color:blue">Report from <?php echo $fdate ?> to <?php echo $tdate ?> (<?php echo strtoupper($factory); ?>)</h5>
                  <hr />
                  <table class="table table-bordered">
                    <thead>
                      <tr>
                        <th>No</th>
                        <th>Full Name</th>
                        <th>Contact Number</th>
                        <th>Whom to Visit</th>
                        <th>Reason to Meet</th>
                        <th>Company Address</th>
                        <th>Entry Date</th>
                        <th>Entry Time</th>
                        <th>Exit Time</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $sql = "SELECT * FROM $table_name WHERE date(EnterDate) BETWEEN :fdate AND :tdate ORDER BY ID DESC";
                      $query = $dbh->prepare($sql);
                      $query->bindParam(':fdate', $fdate, PDO::PARAM_STR);
                      $query->bindParam(':tdate', $tdate, PDO::PARAM_STR);
                      $query->execute();
                      $results = $query->fetchAll(PDO::FETCH_OBJ);
                      $cnt = 1;
                      if ($query->rowCount() > 0) {
                        foreach ($results as $row) {
                      ?>
                      <tr>
                        <td><?php echo htmlentities($cnt); ?></td>
                        <td><?php echo htmlentities($row->FullName); ?></td>
                        <td><?php echo htmlentities($row->MobileNumber); ?></td>
                        <td><?php echo htmlentities($row->WhomtoMeet); ?></td>
                        <td><?php echo htmlentities($row->ReasontoMeet); ?></td>
                        <td><?php echo htmlentities($row->Address); ?></td>
                        <td><?php echo htmlentities(date("d-m-Y", strtotime($row->EnterDate))); ?></td>
                        <td><?php echo htmlentities(date("H:i:s", strtotime($row->EnterDate))); ?></td>
                        <td><?php echo !empty($row->outtime) ? htmlentities(date("H:i:s", strtotime($row->outtime))) : '-'; ?></td>
                      </tr>
                      <?php
                          $cnt++;
                        }
                      } else {
                        echo '<tr><td colspan="9" class="text-center">No records found</td></tr>';
                      }
                      ?>
                    </tbody>
                  </table>
                </div>
                <?php endif; ?>
              </div>
            </div>

          </div>
        </div>
        <?php @include("includes/footer.php"); ?>
      </div>
    </div>
  </div>
  <?php @include("includes/foot.php"); ?>
</body>
</html>
