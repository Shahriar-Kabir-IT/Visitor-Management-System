<?php
include('includes/checklogin.php');
check_login();
?>
<!DOCTYPE html>
<html lang="en">
<?php @include("includes/headajl.php");?>
<style>
    /* Style to increase eye icon size */
    .eye-icon {
        font-size: 1.3rem; /* Increased from default size */
    }
</style>
<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <?php @include("includes/headerajl.php");?>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <!-- partial:../../partials/_sidebar.html -->
      <?php @include("includes/sidebarajl.php");?>
      <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
               
                <!--  start  modal -->
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
                        <?php @include("view_visitor_detailsajl.php");?>
                      </div>
                      <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                      </div>
                      <!-- /.modal-content -->
                    </div>
                    <!-- /.modal-dialog -->
                  </div>
                  <!-- /.modal -->
                </div>
                <!--   end modal -->
                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover table-bordered" id="dataTableHover">
                    <thead>
                      <tr>
                        <th class="text-center">No</th>
                        <th>Full Name</th>
                        <th>Contact Number</th>
                        <th>Visitor Pass Number</th>
                        <th class="text-center">Reg Date</th>
                        <th class="text-center">Entry Time</th>
                        <th class="text-center" style="width: 15%;">Action</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $sql="SELECT * from tblvisitorajl ORDER BY id DESC";
                      $query = $dbh -> prepare($sql);
                      $query->execute();
                      $results=$query->fetchAll(PDO::FETCH_OBJ);
                      $cnt=1;
                      if($query->rowCount() > 0)
                      {
                        foreach($results as $row)
                        { 
                          ?>
                          <tr>
                            <td class="text-center"><?php echo htmlentities($cnt);?></td>
                            <td><?php echo htmlentities($row->FullName);?></td>
                            <td class="text-center">0<?php echo htmlentities($row->MobileNumber);?></td>
                            <td class="text-center"><?php echo htmlentities($row->Email);?></td>
                            <td class="text-center"><?php echo htmlentities(date("d-m-Y", strtotime($row->EnterDate)));?></td>
                            <td class="text-center"><?php echo htmlentities(date("H:i:s", strtotime($row->EnterDate))); ?></td>
                            <td class="text-center">
                              <a href="#" class="edit_data5" id="<?php echo ($row->ID); ?>" title="click to view">
                                <i class="mdi mdi-eye eye-icon" aria-hidden="true"></i>
                              </a>
                            </td>
                          </tr>
                          <?php 
                          $cnt=$cnt+1;
                        }
                      } ?>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- content-wrapper ends -->
        <!-- partial:../../partials/_footer.html -->
        <?php @include("includes/footer.php");?>
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <?php @include("includes/foot.php");?>
  <!-- End custom js for this page -->
  <script type="text/javascript">
    $(document).ready(function(){
      $(document).on('click','.edit_data5',function(){
        var edit_id5=$(this).attr('id');
        $.ajax({
          url:"view_visitor_detailsajl.php",
          type:"post",
          data:{edit_id5:edit_id5},
          success:function(data){
            $("#info_update5").html(data);
            $("#editData5").modal('show');
          }
        });
      });
    });
  </script>
</body>
</html>