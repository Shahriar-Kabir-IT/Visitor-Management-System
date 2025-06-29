<?php
include('includes/checklogin.php');
check_login();

// --- Factory selection ---
$allowed_tables = [
    'tblvisitor' => 'Ananta Companies Head Office',
    'tblvisitorabm' => 'ABM Fashion Limited',
    'tblvisitorajl' => 'Ananta Jeanswear Limited',
    'tblvisitoragl' => 'Ananta Garments Limited',
    'tblvisitorpwpl' => 'Paradise Washing Plant Limited'
];
$table = isset($_GET['factory']) && array_key_exists($_GET['factory'], $allowed_tables)
    ? $_GET['factory']
    : 'tblvisitor';

// --- View detail file based on selected table ---
$view_files = [
    'tblvisitor' => 'view_visitor_details.php',
    'tblvisitorabm' => 'view_visitor_detailsabm.php',
    'tblvisitorajl' => 'view_visitor_detailsajl.php',
    'tblvisitoragl' => 'view_visitor_detailsagl.php',
    'tblvisitorpwpl' => 'view_visitor_detailspwpl.php'
];
$view_file = $view_files[$table];

// --- Pagination setup ---
$limit = 12;
$page = isset($_GET['page']) && is_numeric($_GET['page']) ? intval($_GET['page']) : 1;
if ($page < 1) $page = 1;
$offset = ($page - 1) * $limit;

// Count total rows
$sql_count = "SELECT COUNT(*) as total FROM $table";
$query_count = $dbh->prepare($sql_count);
$query_count->execute();
$total_rows = $query_count->fetch(PDO::FETCH_OBJ)->total;
$total_pages = ceil($total_rows / $limit);
?>
<!DOCTYPE html>
<html lang="en">
<?php @include("includes/head.php");?>
<style>
    .eye-icon {
        font-size: 1.3rem;
    }
</style>
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
                        <?php @include($view_file); ?>
                      </div>
                      <div class="modal-footer ">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End modal -->

                <div class="p-3">
                  <!-- Dropdown Menu for Factory Selection -->
                 <div class="d-flex justify-content-end mb-3">
  <form method="get" id="factoryForm" class="form-inline">
    <label for="factory" class="mr-2 font-weight-bold">Select Factory:</label>
    <select name="factory" id="factory" class="form-control" onchange="document.getElementById('factoryForm').submit()">
      <?php foreach ($allowed_tables as $tbl => $name): ?>
        <option value="<?php echo $tbl; ?>" <?php if ($tbl == $table) echo 'selected'; ?>>
          <?php echo $name; ?>
        </option>
      <?php endforeach; ?>
    </select>
    <input type="hidden" name="page" value="<?php echo $page; ?>">
  </form>
</div>


                  <div class="table-responsive">
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
                        $sql = "SELECT * FROM $table ORDER BY id DESC LIMIT $limit OFFSET $offset";
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
                          <li class="page-item"><a class="page-link" href="?factory=<?php echo $table; ?>&page=1">&laquo; First</a></li>
                          <li class="page-item"><a class="page-link" href="?factory=<?php echo $table; ?>&page=<?php echo $page - 1; ?>">&lt; Prev</a></li>
                        <?php endif; ?>

                        <?php for($p = 1; $p <= $total_pages; $p++): ?>
                          <li class="page-item <?php if($p == $page) echo 'active'; ?>">
                            <a class="page-link" href="?factory=<?php echo $table; ?>&page=<?php echo $p; ?>"><?php echo $p; ?></a>
                          </li>
                        <?php endfor; ?>

                        <?php if($page < $total_pages): ?>
                          <li class="page-item"><a class="page-link" href="?factory=<?php echo $table; ?>&page=<?php echo $page + 1; ?>">Next &gt;</a></li>
                          <li class="page-item"><a class="page-link" href="?factory=<?php echo $table; ?>&page=<?php echo $total_pages; ?>">Last &raquo;</a></li>
                        <?php endif; ?>
                      </ul>
                    </nav>

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
  <script type="text/javascript">
    $(document).ready(function(){
      $(document).on('click','.edit_data5',function(){
        var edit_id5 = $(this).attr('id');
        var viewFile = "<?php echo $view_file; ?>";

        $.ajax({
          url: viewFile,
          type: "post",
          data: { edit_id5: edit_id5 },
          success: function(data){
            $("#info_update5").html(data);
            $("#editData5").modal('show');
          }
        });
      });
    });
      // Auto-refresh every 1 minutes
  setTimeout(function() {
    location.reload();
  }, 	60000);
</script>
</body>
</html>
  </script>
</body>
</html>
