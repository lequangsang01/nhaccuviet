<?php 
     ob_start();
    include 'header2.php'; 
    include_once 'lib/session.php';
    session::init(); ?>

<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {

    $insertCustomers = $cs->insert_customers($_POST);
}
?>
<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['login'])) {

    $login_Customers = $cs->login_customers($_POST);
    //  header('Location:index.php');
}
?>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Đăng Nhập</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">cửa hàng</a></li>
                    <li class="breadcrumb-item active">Thanh Toán</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
        <div class="row new-account-login">
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>Đăng nhập tài khoản</h3>
                    <?php
                    if (isset($login_Customers)) {
                        echo $login_Customers;
                        if($login_Customers=="")
                        {
                            echo "<script>if (window.confirm('Đăng nhập thành Công'))
                            {
                                window.location = 'index.php';
                            }
                            
                            </script>";
                        }

                    }
                    ?>
                </div>
                <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Nhấn vào đây để đăng nhập</a></h5>
                <form class="mt-3 collapse review-form-box" id="formLogin" action="" method="post">
                        <div class="form-row">
                            <div class="form-group col-md-6">
                                <label for="InputEmail" class="mb-0">Nhập Gmail</label>
                                <input type="text" name="email" class="form-control"  placeholder="Nhập gmail"> </div>
                            <div class="form-group col-md-6">
                                <label for="InputPassword" class="mb-0">Mật Khẩu</label>
                                <input type="password" name="password" class="form-control"  placeholder="Mật Khẩu"> </div>
                        </div>
                        <button type="submit" name="login" class="btn hvr-hover">Login</button>
                    </form>
               
            </div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>Tạo tài khoản mới</h3>
                    <?php
                    if (isset($insertCustomers)) {
                        echo $insertCustomers;
                    }
                    ?>
                </div>
                <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Nhấn vào đây để đăng ký</a></h5>
                <form class="mt-3 collapse review-form-box" id="formRegister" action="" method="POST">
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="InputName" class="mb-0">Nhập Tên</label>
                            <input type="text" name="name" class="form-control" placeholder="Nhập tên đầy đủ">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputLastname" class="mb-0">Địa Chỉ</label>
                            <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Số điện Thoại</label>
                            <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Gmail</label>
                            <input type="text" name="email" class="form-control" placeholder="Nhập gmail">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Nhập mật khẩu</label>
                            <input type="text" name="password" class="form-control" placeholder="Nhập mật khẩu">
                        </div>
                    </div>
                    <button type="submit" name="submit" class="btn hvr-hover">Register</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- End Cart -->

<?php include 'footer.php'; 
 ob_end_flush();?>
