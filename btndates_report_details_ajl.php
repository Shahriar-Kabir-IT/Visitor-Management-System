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

// Handle CSV download (kept as POST since you have a download button)
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
<?php @include("includes/headagl.php"); ?>
<body>
  <div class="container-scroller">
    <?php @include("includes/headeragl.php"); ?>
    <div class="container-fluid page-body-wrapper">
      <?php @include("includes/sidebaragl.php"); ?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="modal-header">
                  <h5 class="modal-title">Between Dates Reports</h5>
                </div>
                <div class="col-md-12 mt-4">
                  <!-- Changed method to GET for pagination -->
                  <form class="forms-sample" method="get">
                    <div class="row">
                      <div class="form-group col-md-4">
                        <label>From Date</label>
                        <input type="date" name="fromdate" class="form-control" value="<?php echo isset($_GET['fromdate']) ? htmlentities($_GET['fromdate']) : '' ?>" required>
                      </div>
                      <div class="form-group col-md-4">
                        <label>To Date</label>
                        <input type="date" name="todate" class="form-control" value="<?php echo isset($_GET['todate']) ? htmlentities($_GET['todate']) : '' ?>" required>
                      </div>
                      <div class="form-group col-md-4">
                        <label>Select Factory</label>
                        <select name="factory" class="form-control" required>
                          <option value="">-- Select Factory --</option>
                         
                          <option value="ajl" <?php if(isset($_GET['factory']) && $_GET['factory']=='ajl') echo 'selected'; ?>>AJL</option> 
                         
                        </select>
                      </div>
                    </div>
                    <button type="submit" name="search" value="1" class="btn btn-primary btn-sm mb-4">Search</button>

                    <!-- To keep download working as POST, add hidden inputs with GET values -->
                    <button type="submit" name="download_csv" class="btn btn-warning btn-sm mb-4 ml-2" formmethod="post" 
                      formaction="" 
                      onclick="
                        // Before POST submit, add hidden inputs dynamically
                        var f = this.form;
                        if(!f.download_fromdate){
                          var fromdateInput = document.createElement('input');
                          fromdateInput.type = 'hidden';
                          fromdateInput.name = 'fromdate';
                          fromdateInput.value = f.fromdate.value;
                          f.appendChild(fromdateInput);
                        }
                        if(!f.download_todate){
                          var todateInput = document.createElement('input');
                          todateInput.type = 'hidden';
                          todateInput.name = 'todate';
                          todateInput.value = f.todate.value;
                          f.appendChild(todateInput);
                        }
                        if(!f.download_factory){
                          var factoryInput = document.createElement('input');
                          factoryInput.type = 'hidden';
                          factoryInput.name = 'factory';
                          factoryInput.value = f.factory.value;
                          f.appendChild(factoryInput);
                        }
                      "
                    >Download Data</button>
                  </form>
                </div>
              </div>
            </div>

            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <?php 
                // Pagination logic
                if (isset($_GET['search']) && !empty($_GET['fromdate']) && !empty($_GET['factory'])):
                  $fdate = $_GET['fromdate'];
                  $tdate = $_GET['todate'];
                  $factory = $_GET['factory'];
                  $table_name = ($factory === 'headoffice') ? "tblvisitor" : "tblvisitor" . $factory;

                  // Pagination variables
                  $page = isset($_GET['page']) && is_numeric($_GET['page']) ? (int)$_GET['page'] : 1;
                  $limit = 12;
                  $offset = ($page - 1) * $limit;

                  // Get total records count
                  $sql_count = "SELECT COUNT(*) FROM $table_name WHERE date(EnterDate) BETWEEN :fdate AND :tdate";
                  $query_count = $dbh->prepare($sql_count);
                  $query_count->bindParam(':fdate', $fdate, PDO::PARAM_STR);
                  $query_count->bindParam(':tdate', $tdate, PDO::PARAM_STR);
                  $query_count->execute();
                  $total_rows = $query_count->fetchColumn();
                  $total_pages = ceil($total_rows / $limit);

                  // Fetch data for current page
                  $sql = "SELECT * FROM $table_name WHERE date(EnterDate) BETWEEN :fdate AND :tdate ORDER BY ID DESC LIMIT :limit OFFSET :offset";
                  $query = $dbh->prepare($sql);
                  $query->bindParam(':fdate', $fdate, PDO::PARAM_STR);
                  $query->bindParam(':tdate', $tdate, PDO::PARAM_STR);
                  $query->bindParam(':limit', $limit, PDO::PARAM_INT);
                  $query->bindParam(':offset', $offset, PDO::PARAM_INT);
                  $query->execute();
                  $results = $query->fetchAll(PDO::FETCH_OBJ);
                ?>
                <div class="table-responsive p-3">
                  <h5 align="center" style="color:blue">Report from <?php echo htmlentities($fdate); ?> to <?php echo htmlentities($tdate); ?> (<?php echo strtoupper(htmlentities($factory)); ?>)</h5>
                  <hr />
                  <table class="table table-bordered text-center align-middle">
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
                      $cnt = $offset + 1;
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

                  <!-- Pagination Links -->
                  <?php if ($total_pages > 1): ?>
                  <nav>
                    <ul class="pagination justify-content-center">
                      <?php for ($p = 1; $p <= $total_pages; $p++): ?>
                        <li class="page-item <?php if ($p == $page) echo 'active'; ?>">
                          <a class="page-link" href="?search=1&fromdate=<?php echo urlencode($fdate); ?>&todate=<?php echo urlencode($tdate); ?>&factory=<?php echo urlencode($factory); ?>&page=<?php echo $p; ?>">
                            <?php echo $p; ?>
                          </a>
                        </li>
                      <?php endfor; ?>
                    </ul>
                  </nav>
                  <?php endif; ?>
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