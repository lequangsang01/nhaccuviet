<?php
ob_start();
include 'lib/session.php';
Session::init();
?>
<?php

include 'lib/database.php';
include 'helpers/format.php';

spl_autoload_register(function ($class) {
    include_once "classes/" . $class . ".php";
});


$db = new Database();
$fm = new Format();
$ct = new cart();
$us = new user();
$br = new brand();
$cat = new category();
$cs = new customer();
$product = new product();


?>
<?php
header("Cache-Control: no-cache, must-revalidate");
header("Pragma: no-cache");
header("Expires: Sat, 26 Jul 1997 05:00:00 GMT");
header("Cache-Control: max-age=2592000");
?>
<!DOCTYPE html>
<html>
<!-- Basic -->

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width,initial-scale=1">

    <!-- Site Metas -->
    <title> Nhạc Cụ Việt</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">
    <!-- Latest compiled and minified CSS -->
    <!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
   
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> -->

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <!-- Start Main Top -->
    <div class="main-top">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="text-slid-box">
                        <div id="offer-box" class="carouselTicker">
                            <ul class="offer-box">
                                <li>
                                    <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                </li>
                                <li>
                                    <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                    <div class="custom-select-box">
                        <!-- <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                            <option>VND</option>
                        </select> -->
                    </div>
                    <!-- <div class="right-phone-box">
                        <p>Call US :- <a href="#"> 0000 0000</a></p>
                    </div> -->
                    <div class="our-link">
                        <ul>
                            <?php
                            if (isset($_GET['customer_id'])) {
                                $customer_id = $_GET['customer_id'];
                                $delCart = $ct->del_all_data_cart();
                                $delCompare = $ct->del_compare($customer_id);
                                Session::destroy();
                            }
                            ?>
                            <li>
                                <?php
                                $login_check = Session::get('customer_login');
                                if ($login_check == false) {
                                    echo '<a  href="login.php">Đăng nhập</a></div>';
                                } else {
                                    echo Session::get('customer_name');
                                    // echo '<a  href="' . Session::get('customer_name');'" >Đăng xuất</a></div>';
                                    echo '<a  href="?customer_id=' . Session::get('customer_id') . '" >    Đăng xuất</a></div>';
                                    
                                }
                                ?>
                            </li>
                            <!-- <li><a href="#">Địa chỉ</a></li>
                            <li><a href="#">Liên hệ</a></li> -->
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Main Top -->

    <!-- Start Main Top -->
    <header class="main-header">
        <!-- Start Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
            <div class="container">
                <!-- Start Header Navigation -->
                <div class="navbar-header">
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                    <a class="navbar-brand" href="index.php"><img src="images2/logo.jpg" class="logo" alt=""></a>
                </div>
                <!-- End Header Navigation -->

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="navbar-menu">
                    <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                        <li class="nav-item active"><a class="nav-link" href="index.php">Trang chủ</a></li>
                        <!-- <li class="nav-item"><a class="nav-link" href="#">Về chúng tôi</a></li> -->
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arro" data-toggle="dropdown">Sản Phẩm +</a>
                            <ul class="dropdown-menu">
                                <?php
                                $product_feathered = $cat->getcat();
                                if ($product_feathered) {
                                    while ($result = $product_feathered->fetch_assoc()) {
                                ?>
                                        <li><a href="shop-cat.php?catid=<?php echo $result['catId'] ?>"><?php echo $result['catName'] ?></a></li>
                                <?php
                                    }
                                }
                                ?>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="nav-link dropdown-toggle arro" data-toggle="dropdown">Của hàng +</a>
                            <ul class="dropdown-menu">
                                <li><a href="cart.php">Giỏ hàng</a></li>
                                <li><a href="tkcuatoi.php">Tài khoản của tôi</a></li>
                                <!-- <li><a href="wishlist.php">Danh sách yêu thích</a></li> -->
                                <li><a href="shop.php">Tất cả sản phẩm</a></li>
                            </ul>
                        </li>
                        <!-- <li class="nav-item"><a class="nav-link" href="#">Dịch Vụ</a></li>
                        <li class="nav-item"><a class="nav-link" href="#">Liên hệ</a></li> -->
                    </ul>
                </div>
                <!-- /.navbar-collapse -->

                <!-- Start Atribute Navigation -->
                <div class="attr-nav">
                    <ul>
                        <li class="search">
                            <a href="shop-search.php">
                                <i class="fa fa-search">
                                    
                                </i>
                            </a>
                        </li>

                        <li>
                            <!-- từ đầu là như này: <li class="side-menu"> -->
                            <a href="cart.php">
                                <i class="fa fa-shopping-bag"></i>
                                <span class="badge"></span>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- End Atribute Navigation -->
            </div>
        </nav>
        <!-- End Navigation -->
    </header>
    <!-- End Main Top -->

    <!-- Start Top Search -->
    <div class="top-search">
        <div class="container">
            <form action="shop-search.php"method="post">
            <div class="input-group">
                <span class="input-group-addon"><i class="fa fa-search"></i></span>
                <input type="text" class="form-control" name="tukhoa"placeholder="Click Enter để tìm kiếm">
                <span class="input-group-addon close-search" type="submit"name="search_product"><i class="fa fa-times"></i></span>
            </div></form>
        </div>
    </div>
    <!-- End Top Search -->
    <?php
    ob_end_flush();
    ?>