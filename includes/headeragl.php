 <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
  <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
    <a class="navbar-brand brand-logo" href="dashboard.php" style="font-size: 24px; font-weight: bold; color: black;">
  ANANTA VMS AGL
</a>
<a class="navbar-brand brand-logo-mini" href="dashboard.php" style="font-size: 16px; font-weight: bold; color: black;">
  VMS
</a>

  </div>
  <div class="navbar-menu-wrapper d-flex align-items-stretch">
    <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-toggle="minimize">
      <span class="mdi mdi-menu"></span>
    </button>
    <div class="search-field ">
      <form class="d-flex align-items-center h-100" name="search" action="search_visitoragl.php" method="post">
  <div class="input-group" style="background-color: #f2edf3;">
    <input type="text" class="form-control bg-transparent border-0" name="searchdata" id="searchdata" placeholder="Search by Names" required>
    <div class="input-group-append">
      <button class="input-group-prepend bg-transparent" type="submit" name="search" style="background-color: #4272d7;">
         <i class="input-group-text border-0 mdi mdi-magnify"></i>
        <!-- <i class="mdi mdi-magnify"></i> -->
      </button>
    </div>
  </div>
</form>
   </div> 
   <ul class="navbar-nav navbar-nav-right">
    <li class="nav-item nav-profile dropdown">
      <?php
      $aid=$_SESSION['odmsaid'];
      $sql="SELECT * from  tbladmin where ID=:aid";
      $query = $dbh -> prepare($sql);
      $query->bindParam(':aid',$aid,PDO::PARAM_STR);
      $query->execute();
      $results=$query->fetchAll(PDO::FETCH_OBJ);
      $cnt=1;
      if($query->rowCount() > 0)
      {
        foreach($results as $row)
        { 
          ?>
          <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
            <div class="nav-profile-img">
              <!-- <?php 
              if($row->Photo=="avatar15.jpg")
              { 
                ?>
                <img class="img-avatar" src="assets/img/avatars/avatar15.jpg" alt="">
                <?php 
              } else { 
                ?>
                <img class="img-avatar" src="profileimages/<?php  echo $row->Photo;?>" alt=""> 
                <?php
              } ?> -->
            </div>
            <div class="nav-profile-text">
              <p class="mb-1 text-black"><?php  echo $row->FirstName;?> <?php  echo $row->LastName;?></p>
            </div>
          </a>
          <?php
        }
      } ?>

      <div class="dropdown-menu navbar-dropdown" aria-labelledby="profileDropdown">
        <!-- <a class="dropdown-item" href="profile.php">
          <i class="mdi mdi-account mr-2 text-success"></i> Profile </a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="change_password.php"><i class="mdi mdi-settings mr-2 text-success"></i> settings </a>
          <div class="dropdown-divider"></div> -->
          <a class="dropdown-item" href="logout.php">
            <i class="mdi mdi-logout mr-2 text-primary"></i> Signout </a>
          </div>
        </li>
        <!-- <li class="nav-item d-none d-lg-block full-screen-link">
          <a class="nav-link">
            <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
          </a>
        </li> -->

        <li class="nav-item nav-logout d-none d-lg-block">
          <a class="nav-link" href="logout.php">
            <i class="mdi mdi-power"></i>
          </a>
        </li>
      </ul>
      <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
        <span class="mdi mdi-menu"></span>
      </button>
    </div>
  </nav>