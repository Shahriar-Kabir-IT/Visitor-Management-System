<?php
include('includes/checklogin.php');
check_login();

// CSV Export Block
if (isset($_POST['download_csv']) && !empty($_POST['fromdate']) && !empty($_POST['todate'])) {
  $fdate = $_POST['fromdate'];
  $tdate = $_POST['todate'];

  header('Content-Type: text/csv');
  header('Content-Disposition: attachment; filename="visitor_report_' . $fdate . '_to_' . $tdate . '.csv"');

  $output = fopen("php://output", "w");
  fputcsv($output, ['Full Name', 'Mobile Number', 'Whom to Visit', 'Reason to Meet', 'Company Name & Address', 'Entry Date', 'Entry Time', 'Exit Time']);

  $sql = "SELECT * FROM tblvisitor WHERE date(EnterDate) BETWEEN :fdate AND :tdate";
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
<style>
  /* Add custom CSS for center alignment */
  .centered-table td,
  .centered-table th {
    text-align: center;
    vertical-align: middle;
  }

  .centered-table thead th {
    text-align: center;
  }
</style>

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
                  <h5 class="modal-title" style="float: left;">Between Dates Reports</h5>
                </div>
                <div class="col-md-12 mt-4">
                  <form class="forms-sample" method="post" enctype="multipart/form-data" class="form-horizontal">
                    <div class="row">
                      <div class="form-group col-md-6">
                        <label for="exampleInputPassword1">From Date</label>
                        <input type="date" id="fromdate" name="fromdate" value="" class="form-control" required="">
                      </div>
                      <div class="form-group col-md-6">
                        <label for="exampleInputName1">To Date </label>
                        <input type="date" id="todate" name="todate" value="" class="form-control" required="">
                      </div>
                    </div>
                    <button type="submit" name="search" id="submit" class="btn btn-primary btn-sm mb-4">Search</button>
                    <button type="submit" name="download_csv" class="btn btn-warning btn-sm mb-4" style="margin-left: 10px;">Download CSV</button>
                  </form>
                </div>
              </div>
            </div>

            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div id="editData5" class="modal fade">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">View Visitor details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body" id="info_update5">
                        <?php @include("view_visitor_details.php"); ?>
                      </div>
                      <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                      </div>
                    </div>
                  </div>
                </div>

                <?php if (isset($_POST['search']) && !empty($_POST['fromdate'])): ?>
                  <div class="table-responsive p-3">
                    <?php
                    $fdate = $_POST['fromdate'];
                    $tdate = $_POST['todate'];
                    ?>
                    <h5 align="center" style="color:blue">Report from <?php echo $fdate ?> to <?php echo $tdate ?></h5>
                    <hr />
                    <table class="table align-items-center table-flush table-hover table-bordered centered-table" id="dataTableHover">
                      <thead>
                        <tr>
                          <th>No</th>
                          <th>Full Name</th>
                          <th>Contact Number</th>
                          <th>Whom to Visit</th>
                          <th>Reason to Meet</th>
                          <th>Company Name & Address</th>
                          <th>Entry Date</th>
                          <th>Entry Time</th>
                          <th>Exit Time</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $sql = "SELECT * FROM tblvisitor WHERE date(EnterDate) BETWEEN :fdate AND :tdate";
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
                              <td>0<?php echo htmlentities($row->MobileNumber); ?></td>
                              <td><?php echo htmlentities($row->WhomtoMeet); ?></td>
                              <td><?php echo htmlentities($row->ReasontoMeet); ?></td>
                              <td><?php echo htmlentities($row->Address); ?></td>
                              <td><?php echo htmlentities(date("d-m-Y", strtotime($row->EnterDate))); ?></td>
                              <td><?php echo htmlentities(date("H:i:s", strtotime($row->EnterDate))); ?></td>
                              <td><?php echo !empty($row->outtime) ? htmlentities(date("H:i:s", strtotime($row->outtime))) : '-'; ?></td>
                              <td>
                                <a href="#" class="edit_data5" id="<?php echo ($row->ID); ?>" title="click to view">
                                  <i class="mdi mdi-eye" aria-hidden="true" style="font-size: 1.2rem;"></i>
                                </a>
                              </td>
                            </tr>
                        <?php
                            $cnt++;
                          }
                        } else {
                          echo '<tr><td colspan="10" class="text-center">No records found</td></tr>';
                        }
                        ?>
                      </tbody>
                    </table>
                  </div>
                <?php else: ?>
                  <div class="table-responsive p-3">
                    <table class="table align-items-center table-flush table-hover table-bordered centered-table" id="dataTableHover">
                      <thead>
                        <tr>
                          <th>No</th>
                          <th>Full Name</th>
                          <th>Contact Number</th>
                          <th>Whom to Visit</th>
                          <th>Reason to Meet</th>
                          <th>Company Name & Address</th>
                          <th>Entry Date</th>
                          <th>Entry Time</th>
                          <th>Exit Time</th>
                          <th>Action</th>
                        </tr>
                      </thead>
                      <tbody>
                        <?php
                        $sql = "SELECT * FROM tblvisitor ORDER BY id DESC";
                        $query = $dbh->prepare($sql);
                        $query->execute();
                        $results = $query->fetchAll(PDO::FETCH_OBJ);
                        $cnt = 1;

                        if ($query->rowCount() > 0) {
                          foreach ($results as $row) {
                        ?>
                            <tr>
                              <td><?php echo htmlentities($cnt); ?></td>
                              <td><?php echo htmlentities($row->FullName); ?></td>
                              <td>0<?php echo htmlentities($row->MobileNumber); ?></td>
                              <td><?php echo htmlentities($row->WhomtoMeet); ?></td>
                              <td><?php echo htmlentities($row->ReasontoMeet); ?></td>
                              <td><?php echo htmlentities($row->Address); ?></td>
                              <td><?php echo htmlentities(date("d-m-Y", strtotime($row->EnterDate))); ?></td>
                              <td><?php echo htmlentities(date("H:i:s", strtotime($row->EnterDate))); ?></td>
                              <td><?php echo !empty($row->outtime) ? htmlentities(date("H:i:s", strtotime($row->outtime))) : '-'; ?></td>
                              <td>
                                <a href="#" class="edit_data5" id="<?php echo ($row->ID); ?>" title="click to view">
    <i class="mdi mdi-eye" aria-hidden="true" style="font-size: 1.2rem;"></i>
</a>
                              </td>
                            </tr>
                        <?php
                            $cnt++;
                          }
                        } else {
                          echo '<tr><td colspan="10" class="text-center">No records found</td></tr>';
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

  <script type="text/javascript">
    $(document).ready(function() {
      $(document).on('click', '.edit_data5', function() {
        var edit_id5 = $(this).attr('id');
        $.ajax({
          url: "view_visitor_details.php",
          type: "post",
          data: {
            edit_id5: edit_id5
          },
          success: function(data) {
            $("#info_update5").html(data);
            $("#editData5").modal('show');
          },
          error: function(xhr, status, error) {
            console.error("AJAX Error: " + status + " - " + error);
          }
        });
      });
    });
  </script>
</body>

</html>