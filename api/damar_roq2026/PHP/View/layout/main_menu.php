<?php 
function active($page) {
    if (isset($_GET['page1']) && $_GET['page1'] === $page) {
        echo 'active';
    }
}
?>

<div class="main-menu menu-fixed menu-light menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="navbar-header">
        <ul class="nav navbar-nav flex-row">
            <li class="nav-item mr-auto">
                <a class="navbar-brand" href="../../html/rtl/vertical-menu-template/index.html">
                    <div class="brand-logo"></div>
                    <h2 class="brand-text mb-0">ذمار بين يديك</h2>
                </a>
            </li>
            <li class="nav-item nav-toggle">
                <a class="nav-link modern-nav-toggle pr-0" data-toggle="collapse">
                    <i class="feather icon-x d-block d-xl-none font-medium-4 primary toggle-icon"></i>
                    <i class="toggle-icon feather icon-disc font-medium-4 d-none d-xl-block collapse-toggle-icon primary" data-ticon="icon-disc"></i>
                </a>
            </li>
        </ul>
    </div>

    <div class="shadow-bottom"></div>

    <div class="main-menu-content">
        <ul class="navigation navigation-main" id="main-menu-navigation" data-menu="menu-navigation">

            <li class="nav-item <?php active('Dashboard'); ?>">
                <a href="?page1=Dashboard">
                    <i class="feather icon-home"></i>
                    <span class="menu-title" data-i18n="Email">لوحة التحكم</span>
                </a>
            </li>

            <li class="navigation-header"><span>Apps</span></li>

            <?php if ($_SESSION['validity'] === "1") { ?>
                <li class="nav-item <?php active('Profile_Admin'); ?>">
                    <a href="?page1=Profile_Admin"><i class="feather icon-user"></i><span class="menu-title">بروفايل</span></a>
                </li>
                <li class="nav-item <?php active('User'); ?>">
                    <a href="?page1=User"><i class="feather icon-users"></i><span class="menu-title">المستخدمين</span></a>
                </li>
                <li class="nav-item <?php active('City'); ?>">
                    <a href="?page1=City"><i class="feather icon-command"></i><span class="menu-title">المدن</span></a>
                </li>
                <li class="nav-item <?php active('section'); ?>">
                    <a href="?page1=section"><i class="feather icon-command"></i><span class="menu-title">الأقسام</span></a>
                </li>
                <li class="nav-item <?php active('shop'); ?>">
                    <a href="?page1=shop"><i class="fa fa-hospital-o"></i><span class="menu-title">الأماكن</span></a>
                </li>
                <li class="nav-item <?php active('technical_support'); ?>">
                    <a href="?page1=technical_support"><i class="fa fa-paper-plane"></i><span class="menu-title">الدعم الفني</span></a>
                </li>
                <li class="nav-item <?php active('notifications'); ?>">
                    <a href="?page1=notifications"><i class="fa fa-bell"></i><span class="menu-title">الفعاليات</span></a>
                </li>
                <li class="nav-item <?php active('ads'); ?>">
                    <a href="?page1=ads"><i class="fa fa-buysellads"></i><span class="menu-title">العروض</span></a>
                </li>
            <?php } ?>

            <?php if ($_SESSION['validity'] === "0") { ?>
                <li class="nav-item <?php active('Profile_User'); ?>">
                    <a href="?page1=Profile_User"><i class="feather icon-user"></i><span class="menu-title">بروفايل</span></a>
                </li>
                <li class="nav-item <?php active('gallery'); ?>">
                    <a href="?page1=gallery"><i class="fa fa-image"></i><span class="menu-title">صور المكان</span></a>
                </li>
            <?php } ?>

        </ul>
    </div>
</div>


 