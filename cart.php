<?php include 'header2.php'; ?>
<?php
if (isset($_GET['cartid'])) {
    $cartid = $_GET['cartid'];
    $delcart = $ct->del_product_cart($cartid);
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
    $cartId = $_POST['cartId'];
    $quantity = $_POST['quantity'];
    $update_quantity_cart = $ct->update_quantity_cart($quantity, $cartId);
    if ($quantity <= 0) {
        $delcart = $ct->del_product_cart($cartId);
    }
}
?>
<?php
if (!isset($_GET['id'])) {
    echo "<meta http-equiv='refresh' content='0;URL=?id=live'>";
}
?>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Giỏ hàng</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.php">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Cart</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Cart  -->
<div class="cart-box-main">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="table-main table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Ảnh</th>
                                <th>Tên sản phẩm</th>
                                <th>Đơn giá</th>
                                <th>Số lượng</th>
                                <th>thành tiền</th>
                                <th>xóa</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $get_product_cart = $ct->get_product_cart();
                            if ($get_product_cart) {
                                $subtotal = 0;
                                $qty = 0;
                                $name = "";
                                while ($result = $get_product_cart->fetch_assoc()) {
                            ?>
                                    <tr>
                                        <td class="thumbnail-img">
                                            <a>
                                                <img class="img-fluid" src="admin/uploads/<?php echo $result['image'] ?>" alt="" />
                                            </a>
                                        </td>
                                        <td class="name-pr">
                                            <a>
                                                <?php echo $result['productName'] ?>
                                            </a>
                                        </td>
                                        <td class="price-pr">
                                            <p><?php echo $fm->format_currency($result['price']) . " " . "VNĐ" ?></p>
                                        </td>
                                        <td class="c-input-text qty text">
                                            <form action="" method="post">
                                                <input type="hidden" name="cartId" value="<?php echo $result['cartId'] ?>" />
                                                <input type="number" name="quantity" min="0" value="<?php echo $result['quantity'] ?>" />
                                                <input type="submit" name="submit" value="cập nhật" />
                                            </form>
                                        </td>
                                        <td class="total-pr">
                                            <?php
                                            $total = $result['price'] * $result['quantity'];
                                            echo $fm->format_currency($total) . " " . "VNĐ";
                                            ?>
                                        </td>
                                        <td class="remove-pr">
                                            <a onclick="return confirm('Bạn có muốn xóa không?');" href="?cartid=<?php echo $result['cartId'] ?>">
                                                <i class="fas fa-times"></i>
                                            </a>
                                        </td>
                                    </tr>
                            <?php
                                    $name = $result['productName'];
                                    $subtotal += $total;
                                    $qty = $qty + $result['quantity'];
                                }
                            }
                            ?>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <div class="row my-5">

            <div class="col-lg-6 col-sm-6">
                <!-- <div class="update-box" style="position: relative;left: 580px;top:10px;">
                        <input value="cập nhật giỏ hàng" type="submit">
                    </div> -->
            </div>
        </div>

        <div class="row my-5">
            <div class="col-lg-8 col-sm-12"></div>
            <div class="col-lg-4 col-sm-12">
                <div class="order-box">
                    <h3></h3>
                    <?php
                    $check_cart = $ct->check_cart();
                    if ($check_cart) {
                    ?>
                        <div class="d-flex">
                            <h4>Thành tiền</h4>
                            <div class="ml-auto font-weight-bold">
                                <td><?php
                                    echo $fm->format_currency($subtotal) . " " . "VNĐ";
                                    Session::set('sum', $subtotal);
                                    Session::set('qty', $qty);
                                    Session::set('name', $name);
                                    ?></td>
                            </div>
                        </div>
                        <hr class="my-1">
                        <div class="d-flex">
                            <h4>VAT</h4>
                            <div class="ml-auto font-weight-bold"> 10% </div>
                        </div>
                        <div class="d-flex">
                            <h4>Phí giao hàng</h4>
                            <div class="ml-auto font-weight-bold"> Free </div>
                        </div>
                        <hr>
                        <div class="d-flex gr-total">
                            <h5>Tổng cộng</h5>
                            <div class="ml-auto h5">
                                <td><?php

                                    $vat = $subtotal * 0.1;
                                    $gtotal = $subtotal + $vat;
                                    echo $fm->format_currency($gtotal) . " " . "VNĐ";
                                    ?></td>
                            </div>
                        </div>
                        <hr>
                    <?php
                    } else {
                        echo 'Không có sản phẩm nào trong cửa hàng ';
                    }
                    ?>
                </div>
            </div>
            <?php
            $check_cart = $ct->check_cart();
            if (Session::get('customer_id') == true && $check_cart) {
            ?>
                <div class="col-12 d-flex shopping-box"><a href="checkout.php" class="ml-auto btn hvr-hover">Thanh toán</a> </div>
            <?php
            } else {
            ?>

                <div class="col-12 d-flex shopping-box"><a href="login.php" class="ml-auto btn hvr-hover">Mua Hàng</a> </div>
            <?php
            }
            ?>
        </div>

    </div>
</div>
<!-- End Cart -->

<?php include 'footer.php'; ?>