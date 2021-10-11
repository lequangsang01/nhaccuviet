<?php
ob_start();
include 'header2.php';
include_once 'lib/session.php';
session::init(); ?>

<?php
	
	$login_check = Session::get('customer_login'); 
	if($login_check==false){
		header('Location:login.php');
	}
		
?>
<?php

// if(!isset($_GET['proid']) || $_GET['proid']==NULL){
//       echo "<script>window.location ='404.php'</script>";
//    }else{
//        $id = $_GET['proid']; 
//    }
 $id = Session::get('customer_id');
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['save'])) {
   
    $UpdateCustomers = $cs->update_customers($_POST, $id);
    
}
?>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Tài khoản của tôi</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="shop.php">Cửa hàng</a></li>
                    <li class="breadcrumb-item active"><a href="cart.php">Giỏ hàng</a></li>
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
                    <h3>Tài khoản của tôi </h3>
                    <?php
						if(isset($UpdateCustomers)){
							echo '<td colspan="3">'.$UpdateCustomers.'</td>';
						}
						?>
                </div>
                <h5><a data-toggle="collapse" href="#formRegister" role="button" aria-expanded="false">Nhấn vào đây xem/sửa thông tin</a></h5>
                <form class="mt-3 collapse review-form-box" id="formRegister" action="" method="POST">

                <?php
				$id = Session::get('customer_id');
				$get_customers = $cs->show_customers($id);
				if($get_customers){
					while($result = $get_customers->fetch_assoc()){

				?>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="InputName" class="mb-0">Nhập Tên</label>
                            <input type="text" name="name" class="form-control" placeholder="Nhập tên đầy đủ" value="<?php echo $result['name'] ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputLastname" class="mb-0">Địa Chỉ</label>
                            <input type="text" name="address" class="form-control" placeholder="Nhập địa chỉ" value="<?php echo $result['address'] ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Số điện Thoại</label>
                            <input type="text" name="phone" class="form-control" placeholder="Nhập số điện thoại" value="<?php echo $result['phone'] ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Gmail</label>
                            <input type="text" name="email" class="form-control" placeholder="Nhập gmail" value="<?php echo $result['email'] ?>">
                        </div>
                        <div class="form-group col-md-6">
                            <label for="InputPassword1" class="mb-0">Nhập mật khẩu</label>
                            <input type="text" name="password" class="form-control" placeholder="Nhập mật khẩu mới">
                        </div>
                    </div>
                    <button type="submit" name="save" class="btn hvr-hover">update</button>

                    <?php
					}
				}
                ?>
                    
                </form>
            </div>
            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="title-left">
                    <h3>Đơn hàng đã mua</h3>
                    
                </div>
                <h5><a data-toggle="collapse" href="#formLogin" role="button" aria-expanded="false">Nhấn vào đây để xem</a></h5>
                <form class="mt-3 collapse review-form-box" id="formLogin" action="" method="post">
                    <div class="form-row">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <!-- <th>Đơn giá</th> -->
                                <th>Số lượng</th>
                                <th>thành tiền</th>
                                <!-- <th>xóa</th> -->
                            </tr>
                        </thead>
                        <tbody>
                        <?php
						$ct = new cart();
						$fm = new Format();
						$get_inbox_cart = $ct->get_inbox_cart_user($id);
						if($get_inbox_cart){
							$i = 0;
							while($result = $get_inbox_cart->fetch_assoc()){
								$i++;
						 ?>
                                    <tr>
                                        <td class="thumbnail-img">
                                            <a>
                                                <img class="img-fluid" src="admin/uploads/<?php echo $result['image'] ?>" alt="" width="50px"height=50/>
                                            </a>
                                        </td>
                                        <td class="name-pr">
                                            <a>
                                                <?php echo $result['productName'] ?>
                                            </a>
                                        </td>
                                        <!-- <td class="price-pr">
                                            <p><?php echo $fm->format_currency($result['price']) . " " . "VNĐ" ?></p>
                                        </td> -->
                                        <td class="c-input-text qty text">
                                        <?php echo $result['quantity'] ?>
                                           
                                        </td>
                                        <td class="total-pr">
                                            <?php
                                            $total = $result['price'] * $result['quantity'];
                                            echo $fm->format_currency($total) . " " . "VNĐ";
                                            ?>
                                        </td>
                                        <!-- <td class="remove-pr">
                                            <a onclick="return confirm('Bạn có muốn xóa không?');" href="?cartid=<?php echo $result['cartId'] ?>">
                                                <i class="fas fa-times"></i>
                                            </a>
                                        </td> -->
                                    </tr>
                            <?php
                                    
                                }
                            }
                            ?>


                        </tbody>
                    </table>

                    </div>
                    
                </form>

            </div>
            
        </div>
    </div>
</div>
<!-- End Cart -->

<?php include 'footer.php';
ob_end_flush(); ?>