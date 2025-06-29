<?php
include('includes/checklogin.php');
check_login();
?>
<!DOCTYPE html>
<html lang="en">
<?php @include("includes/head.php");?>
<body>
  <div class="container-scroller">
    <?php @include("includes/header.php");?>
    <div class="container-fluid page-body-wrapper">
      <?php @include("includes/sidebar.php");?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">

                  <!-- ✅ Modal -->
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
                          <?php @include("view_visitor_details.php");?>
                        </div>
                        <div class="modal-footer">
                          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- ✅ End Modal -->

                  <!-- ✅ Search Form 
                  <form method="post" class="mb-4">
                    <div class="form-row justify-content-end">
                      <div class="col-auto">
                        <input type="text" name="searchdata" class="form-control" placeholder="Search Name or Mobile..." required>
                      </div>
                      <div class="col-auto">
                        <button type="submit" name="search" class="btn btn-primary">Search</button>
                      </div>
                    </div>
                  </form> -->

                  <div class="table-responsive">
                    <?php
                    if (isset($_POST['search']) && !empty($_POST['searchdata'])) {
                      $sdata = trim($_POST['searchdata']);
                      $sdata_normalized = ltrim($sdata, '0'); // remove leading 0 from mobile number
                    ?>
                      <h4 align="center">Result for "<?php echo htmlentities($sdata); ?>"</h4>
                      <hr />
                      <table class="table table-bordered table-hover" id="dataTableHover">
                        <thead>
                          <tr>
                            <th class="text-center">No</th>
                            <th>Full Name</th>
                            <th>Contact Number</th>
                            <th>Whom to Visit</th>
                            <th>Entry Date</th>
                            <th>Entry Time</th>
                            <th>Exit Time</th>
                            <th class="text-center">Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php
                          $sql = "SELECT * FROM tblvisitor WHERE FullName LIKE :sdata OR MobileNumber LIKE :sphone";
                          $query = $dbh->prepare($sql);
                          $like_name = "%$sdata%";
                          $like_phone = "%$sdata_normalized%";
                          $query->bindParam(':sdata', $like_name, PDO::PARAM_STR);
                          $query->bindParam(':sphone', $like_phone, PDO::PARAM_STR);
                          $query->execute();
                          $results = $query->fetchAll(PDO::FETCH_OBJ);
                          $cnt = 1;
                          if ($query->rowCount() > 0) {
                            foreach ($results as $row) {
                              $entryDate = date("d-m-Y", strtotime($row->EnterDate));
                              $entryTime = date("h:i A", strtotime($row->EnterDate));
                              $exitTime  = $row->outtime ? date("h:i A", strtotime($row->outtime)) : '-';
                              ?>
                              <tr>
                                <td class="text-center"><?php echo htmlentities($cnt); ?></td>
                                <td><?php echo htmlentities($row->FullName); ?></td>
                                <td class="text-center">0<?php echo htmlentities($row->MobileNumber); ?></td>
                                <td class="text-center"><?php echo htmlentities($row->WhomtoMeet); ?></td>
                                <td class="text-center"><?php echo $entryDate; ?></td>
                                <td class="text-center"><?php echo $entryTime; ?></td>
                                <td class="text-center"><?php echo $exitTime; ?></td>
                                <td class="text-center">
                                  <a href="#" class="edit_data5" id="<?php echo ($row->ID); ?>" title="Click to view">
                                    <i class="mdi mdi-eye" aria-hidden="true"></i>
                                  </a>
                                </td>
                              </tr>
                              <?php
                              $cnt++;
                            }
                          } else {
                            echo '<tr><td colspan="8" class="text-center">No record found</td></tr>';
                          }
                          ?>
                        </tbody>
                      </table>
                    <?php } ?>
                  </div>

                </div>
              </div>
            </div>
          </div>
        </div>
        <?php @include("includes/footer.php");?>
      </div>
    </div>
  </div>
  <?php @include("includes/foot.php");?>

  <!-- ✅ JS for Modal View -->
  <script type="text/javascript">
    $(document).ready(function(){
      $(document).on('click','.edit_data5',function(){
        var edit_id5 = $(this).attr('id');
        $.ajax({
          url: "view_visitor_details.php",
          type: "post",
          data: { edit_id5: edit_id5 },
          success: function(data){
            $("#info_update5").html(data);
            $("#editData5").modal('show');
          }
        });
      });
    });
  </script>
</body>
</html>
