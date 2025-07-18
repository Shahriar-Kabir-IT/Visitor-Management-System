<?php
include('includes/checklogin.php');
check_login();
if(isset($_GET['delid']))
{
    $rid=intval($_GET['delid']);
    $sql="delete from tbladmin where ID=:rid";
    $query=$dbh->prepare($sql);
    $query->bindParam(':rid',$rid,PDO::PARAM_STR);
    if ($query->execute()){
        echo "<script>alert('User deleted successfully');</script>"; 
        echo "<script>window.location.href = 'userregister.php'</script>";
    }else{
        echo '<script>alert("Deletion failed! try again later")</script>';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<?php @include("includes/head.php");?>
<body>
  <div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <?php @include("includes/header.php");?>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <?php @include("includes/sidebar.php");?>
        <!-- partial -->
        <div class="main-panel">
            <div class="content-wrapper">
                <div class="row">
                    <div class="col-lg-12 grid-margin stretch-card">
                        <div class="card">
                            <div class="modal-header">
                                <h5 class="modal-title" style="float: left;">Register user</h5>    
                                <div class="card-tools" style="float: right;">
                                    <button type="button" class="btn btn-sm btn-success" data-toggle="modal" data-target="#registeruser" ><i class="fas fa-plus" ></i> Register User
                                    </button>
                                </div>      
                            </div>
                            <!-- /.card-header -->
                            <div class="modal fade" id="registeruser">
                                <div class="modal-dialog ">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h4 class="modal-title">Register user</h4>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <!-- <p>One fine body&hellip;</p> -->
                                            <?php @include("newuser_form.php");?>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                            <!-- /.modal -->
                            <!--  start  modal -->
                            <div id="editData" class="modal fade">
                                <div class="modal-dialog ">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Edit user info</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body" id="info_update">
                                            <?php @include("update_user.php");?>
                                        </div>
                                        <!-- /.modal-content -->
                                    </div>
                                    <!-- /.modal-dialog -->
                                </div>
                                <!-- /.modal -->
                            </div>
                            <!--   end modal -->
                            <div class="card-body table-responsive p-3">
                                <table class="table align-items-center table-flush table-hover" id="dataTableHover">
                                    <thead>
                                        <tr>
                                            <th class="text-center">No.</th>
                                            <th class="">Name</th>
                                            <th class="text-center">Mobile number</th>
                                            <th class="">Email</th>
                                            <th class=" text-center">Date registered</th>
                                            <th class="text-center" style="width: 15%;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $sql="SELECT * from tbladmin";
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
                                                    <td><?php  echo htmlentities($row->FirstName);?>&nbsp;<?php  echo htmlentities($row->LastName);?></td>
                                                    <td class="text-center">0<?php  echo htmlentities($row->MobileNumber);?></td>
                                                    <td><?php  echo htmlentities($row->Email);?></td>
                                                    <td class="text-center">
                                                        <span ><?php  echo htmlentities(date("d-m-Y", strtotime($row->AdminRegdate)));?></span>
                                                    </td>
                                                    <td class=" text-center">
                                                        <a href="#"  class=" edit_data" id="<?php echo  ($row->ID); ?>" title="click for edit"><i class="mdi mdi-pencil-box-outline" aria-hidden="true"></i></a>
                                                        <a href="userregister.php?delid=<?php echo ($row->ID);?>" onclick="return confirm('Are you sure you want to delete this user?');" title="Delete this User"><i class="mdi mdi-delete fa-delete"style="color: #f05050"  aria-hidden="true"></i></a> </td>
                                                    </tr>
                                                    <?php $cnt=$cnt+1;
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
            $(document).on('click','.edit_data',function()
            {
                var edit_id=$(this).attr('id');
                $.ajax(
                {
                    url:"update_user.php",
                    type:"post",
                    data:{edit_id:edit_id},

                    success:function(data)
                    {
                        $("#info_update").html(data);
                        $("#editData").modal('show');
                    }

                });
            });
        });
    </script>
</body>
</html>