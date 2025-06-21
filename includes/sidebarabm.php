<nav class="sidebar sidebar-offcanvas" id="sidebar">
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link" href="dashboard_abm.php">
                <span class="menu-title">Dashboard</span>
                <i class="mdi mdi-home menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="new_visitorabm.php">
                <span class="menu-title">New Visitor</span>
                <i class="mdi mdi-account menu-icon"></i>
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="manage_visitorabm.php">
                <span class="menu-title">Manage visitors</span>
                <i class="mdi mdi-account-multiple menu-icon"></i>
            </a>
        </li>
        <?php
        $aid = $_SESSION['odmsaid'];
        $sql = "SELECT AdminName FROM tbladmin WHERE ID = :aid";
        $query = $dbh->prepare($sql);
        $query->bindParam(':aid', $aid, PDO::PARAM_STR);
        $query->execute();
        $result = $query->fetch(PDO::FETCH_OBJ);

        if ($result && $result->AdminName === "Admin") { 
            // Show User Management (only for Admin)
            ?>
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#general-pages" aria-expanded="false" aria-controls="general-pages">
                    <span class="menu-title">User management</span>
                    <i class="menu-arrow"></i>
                    <i class="mdi mdi-account-multiple menu-icon"></i>
                </a>
                <div class="collapse" id="general-pages">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="userregister.php">Register user</a></li>
                        <li class="nav-item"> <a class="nav-link" href="user_permission.php">User permissions</a></li>
                    </ul>
                </div>
            </li>

            <!-- Reports Section (only for Admin) -->
            <li class="nav-item">
                <a class="nav-link" data-toggle="collapse" href="#reports" aria-expanded="false" aria-controls="reports">
                    <span class="menu-title">Reports</span>
                    <i class="menu-arrow"></i>
                    <i class="mdi mdi-database menu-icon"></i>
                </a>
                <div class="collapse" id="reports">
                    <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="btndates_report_details.php">Visitor Report By Date</a></li>
                    </ul>
                </div>
            </li>
            <?php
        }
        ?>
    </ul>
</nav>