<?php
include('includes/checklogin.php');
check_login();

// --- Pagination setup ---
$limit = 12;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? intval($_GET['page']) : 1;
if ($page < 1) $page = 1;
$offset = ($page - 1) * $limit;

// Count total rows
$sql_count = "SELECT COUNT(*) as total FROM tblvisitoragl";
$query_count = $dbh->prepare($sql_count);
$query_count->execute();
$total_rows = $query_count->fetch(PDO::FETCH_OBJ)->total;
$total_pages = ceil($total_rows / $limit);

// Calculate page range for pagination
$page_range = 5; // Number of pages to show at a time
$current_range = ceil($page / $page_range);
$start_page = ($current_range - 1) * $page_range + 1;
$end_page = min($start_page + $page_range - 1, $total_pages);

// Calculate next and previous jump pages
$next_jump = min($page + $page_range, $total_pages);
$prev_jump = max($page - $page_range, 1);
?>
<!DOCTYPE html>
<html lang="en">
<?php @include("includes/headagl.php");?>
<style>
    .eye-icon {
        font-size: 1.3rem;
    }
</style>
<body>
  <div class="container-scroller">
    <?php @include("includes/headeragl.php");?>
    <div class="container-fluid page-body-wrapper">
      <?php @include("includes/sidebaragl.php");?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">

                <!-- Modal -->
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
                        <?php @include("view_visitor_detailsagl.php");?>
                      </div>
                      <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End modal -->

                <div class="table-responsive p-3">
                  <table class="table align-items-center table-flush table-hover table-bordered" id="dataTableHover">
                    <thead>
                      <tr>
                        <th class="text-center">No</th>
                        <th class="text-center">Full Name</th>
                        <th class="text-center">Contact Number</th>
                        <th class="text-center">Visitor Pass Number</th>
                        <th class="text-center">Reg Date</th>
                        <th class="text-center">Entry Time</th>
                        <th class="text-center">Exit Time</th>
                        <th class="text-center" style="width: 15%;">View Details</th>
                      </tr>
                    </thead>
                    <tbody>
                      <?php
                      $sql = "SELECT * FROM tblvisitoragl ORDER BY id DESC LIMIT $limit OFFSET $offset";
                      $query = $dbh->prepare($sql);
                      $query->execute();
                      $results = $query->fetchAll(PDO::FETCH_OBJ);
                      $cnt = $offset + 1;
                      if ($query->rowCount() > 0) {
                        foreach ($results as $row) {
                          ?>
                          <tr>
                            <td class="text-center"><?php echo htmlentities($cnt); ?></td>
                            <td class="text-center"><?php echo htmlentities($row->FullName); ?></td>
                            <td class="text-center">0<?php echo htmlentities($row->MobileNumber); ?></td>
                            <td class="text-center"><?php echo htmlentities($row->Email); ?></td>
                            <td class="text-center"><?php echo htmlentities(date("d-m-Y", strtotime($row->EnterDate))); ?></td>
                            <td class="text-center"><?php echo htmlentities(date("H:i:s", strtotime($row->EnterDate))); ?></td>
                            <td class="text-center">
                              <?php 
                                echo ($row->outtime != null) 
                                  ? htmlentities(date("H:i:s", strtotime($row->outtime))) 
                                  : '<span class="text-muted">--</span>';
                              ?>
                            </td>
                            <td class="text-center">
                              <a href="#" class="edit_data5" id="<?php echo ($row->ID); ?>" title="click to view">
                                <i class="mdi mdi-eye eye-icon" aria-hidden="true"></i>
                              </a>
                            </td>
                          </tr>
                          <?php
                          $cnt++;
                        }
                      } else {
                        echo '<tr><td colspan="8" class="text-center">No data available.</td></tr>';
                      }
                      ?>
                    </tbody>
                  </table>

                  <!-- Pagination -->
                  <nav aria-label="Page navigation example" style="margin-top: 15px;">
                    <ul class="pagination justify-content-center">
                      <?php if($page > 1): ?>
                        <li class="page-item"><a class="page-link" href="?page=1">&laquo; First</a></li>
                        <li class="page-item"><a class="page-link" href="?page=<?php echo $prev_jump; ?>">&lt; Prev </a></li>
                      <?php endif; ?>

                      <?php for($p = $start_page; $p <= $end_page; $p++): ?>
                        <li class="page-item <?php if($p == $page) echo 'active'; ?>">
                          <a class="page-link" href="?page=<?php echo $p; ?>"><?php echo $p; ?></a>
                        </li>
                      <?php endfor; ?>

                      <?php if($page < $total_pages): ?>
                        <li class="page-item"><a class="page-link" href="?page=<?php echo $next_jump; ?>">Next &gt;</a></li>
                        <li class="page-item"><a class="page-link" href="?page=<?php echo $total_pages; ?>">Last &raquo;</a></li>
                      <?php endif; ?>
                    </ul>
                  </nav>
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
  <script type="text/javascript">
    $(document).ready(function(){
      $(document).on('click','.edit_data5',function(){
        var edit_id5=$(this).attr('id');
        $.ajax({
          url:"view_visitor_detailsagl.php",
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