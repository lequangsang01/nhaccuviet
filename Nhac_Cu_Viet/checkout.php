<?php
ob_start();
include 'header2.php'; ?>

<?php

if (isset($_GET['orderid']) && $_GET['orderid'] == 'order') {
    $customer_id = Session::get('customer_id');
    $insertOrder = $ct->insertOrder($customer_id);
    $delCart = $ct->del_all_data_cart();
    // echo '<script>alert("Thanh toán Thành công")</script>';
    // header('Location:index.php');
    echo "<script>if (window.confirm('Thanh toán thành Công'))
	{
        window.location = 'index.php';
	}
	
	</script>";
    
   
}

?>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Checkout</h2>
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

        <div class="row">

            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="checkout-address">

                    <div class="title-left">
                        <h3>Địa chỉ nhận hàng</h3>
                    </div>
                    <?php
                    $id = Session::get('customer_id');
                    $get_customers = $cs->show_customers($id);
                    if ($get_customers) {
                        while ($result = $get_customers->fetch_assoc()) {

                    ?>
                            <div>
                                <form class="needs-validation" novalidate>
                                    <div class="row">

                                        <div class="col-md-6 mb-3">
                                            <label for="firstName">Tên Người nhận *</label>
                                            <input type="text" class="form-control" id="firstName" placeholder="" value="<?php echo $result['name'] ?>" required>
                                            <div class="invalid-feedback"> Valid name is required. </div>
                                        </div>
                                        <!-- <div class="col-md-6 mb-3">
                                    <label for="lastName"> *</label>
                                    <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                                    <div class="invalid-feedback"> Valid last name is required. </div>
                                </div> -->
                                    </div>
                                    <div class="mb-3">
                                        <label for="email">Email *</label>
                                        <input type="email" class="form-control" id="email" placeholder="<?php echo $result['email'] ?>">
                                        <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                                    </div>

                                    <div class="mb-3">
                                        <label for="address2">Số điện thoại *</label>
                                        <input type="text" class="form-control" id="address2" placeholder="<?php echo $result['phone'] ?>">
                                    </div>
                                    <div class="row">
                                        <!-- <div class="col-md-5 mb-3">
                                        <label for="country">Thành Phố *</label>
                                        <select class="wide w-100" id="country">
                                            <option value="Choose..." data-display="Select">...</option>
                                            <option value="United States">Hà Nội</option>
                                        </select>
                                        <div class="invalid-feedback"> Please select a valid country. </div>
                                    </div> -->
                                        <!-- <div class="col-md-4 mb-3">
                                        <label for="state">Quận/Huyện *</label>
                                        <select class="wide w-100" id="state">
                                            <option data-display="Select">...</option>
                                            <option>Ba Đình</option>
                                        </select>
                                        <div class="invalid-feedback"> Please provide a valid state. </div>
                                    </div> -->
                                    </div>
                                    <div class="mb-3">
                                        <label for="address">Địa chỉ *</label>
                                        <input type="text" class="form-control" id="address" placeholder="<?php echo $result['address'] ?>" required>
                                        <div class="invalid-feedback"> Please enter your shipping address. </div>
                                    </div>

                                    <hr class="mb-4">

                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="save-info">
                                        <label class="custom-control-label" for="save-info">lưu thông tin này cho lần sau</label>
                                    </div>
                                    <hr class="mb-4">
                                    <div class="title"> <span>Hình thức thanh toán</span> </div>
                                    <div class="d-block my-3">
                                        <div class="custom-control custom-radio">
                                            <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked required>
                                            <label class="custom-control-label" for="credit">Thanh toán khi nhận hàng</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required>
                                            <label class="custom-control-label" for="debit">Thẻ thanh toán nội địa</label>
                                        </div>
                                        <div class="custom-control custom-radio">
                                            <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required>
                                            <label class="custom-control-label" for="paypal">Thẻ thanh toán quốc tế</label>
                                        </div>
                                    </div>

                                    <hr class="mb-1">

                                </form>
                            </div>
                    <?php
                        }
                    }

                    ?>
                </div>
            </div>

            <div class="col-sm-6 col-lg-6 mb-3">
                <div class="row">
                    <div class="col-md-12 col-lg-12">
                        <div class="shipping-method-box">
                            <div class="title-left">
                                <h3>Đơn vị vận chuyển</h3>
                            </div>
                            <div class="mb-4">
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption1" name="shipping-option" class="custom-control-input" checked="checked" type="radio">
                                    <label class="custom-control-label" for="shippingOption1">Lalamove</label> <span class="float-right font-weight-bold">...</span>
                                </div>
                                <div class="ml-4 mb-2 small">(nhận hàng trong ngày)</div>
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption2" name="shipping-option" class="custom-control-input" type="radio">
                                    <label class="custom-control-label" for="shippingOption2">Giao hàng nhanh</label> <span class="float-right font-weight-bold">...</span>
                                </div>
                                <div class="ml-4 mb-2 small">(2-4 ngày)</div>
                                <div class="custom-control custom-radio">
                                    <input id="shippingOption3" name="shipping-option" class="custom-control-input" type="radio">
                                    <label class="custom-control-label" for="shippingOption3">Giao hàng tiết kiệm</label> <span class="float-right font-weight-bold">...</span>
                                </div>
                                <div class="ml-4 mb-2 small">(2-4 ngày)</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12">
                        <div class="odr-box">
                            <div class="title-left">
                                <h3>Giỏ hàng</h3>
                            </div>
                            <div class="rounded p-2 bg-light">
                                <?php
                                $get_product_cart = $ct->get_product_cart();
                                if ($get_product_cart) {
                                    $subtotal = 0;
                                    $qty = 0;
                                    $i = 0;
                                    while ($result = $get_product_cart->fetch_assoc()) {
                                        $i++;
                                ?>
                                        <div class="media mb-2 border-bottom">
                                            <div class="media-body"> <a href="detail.html"> <?php echo $i; ?>: <?php echo $result['productName'] ?></a>
                                                <div class="small text-muted">Đơn giá: <?php echo $fm->format_currency($result['price']) . " " . "VNĐ" ?>
                                                    <span class="mx-2">|</span> số lượng: <?php echo $result['quantity'] ?>
                                                    <span class="mx-2">|</span> Thành tiền: <?php $total = $result['price'] * $result['quantity'];
                                                                                            echo $fm->format_currency($total) . ' ' . 'VNĐ'; ?></td>
                                                </div>
                                            </div>
                                        </div>
                                <?php
                                        $subtotal += $total;
                                        $qty = $qty + $result['quantity'];
                                    }
                                }
                                ?>
                                <!-- <div class="media mb-2 border-bottom">
                                    <div class="media-body"> <a href="detail.html"> sp2</a>
                                        <div class="small text-muted">Đơn giá: $60.00 <span class="mx-2">|</span> Số lượng: 1 <span class="mx-2">|</span> Thành tiền: $60.00</div>
                                    </div>
                                </div>
                                <div class="media mb-2">
                                    <div class="media-body"> <a href="detail.html"> sp3</a>
                                        <div class="small text-muted">Đơn giá: $40.00 <span class="mx-2">|</span> Số lượng: 1 <span class="mx-2">|</span> Thành tiền: $40.00</div>
                                    </div>
                                </div> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12">
                        <div class="order-box">
                            <div class="title-left">
                                <h3>Thanh Toán</h3>
                            </div>
                            <div class="d-flex">
                                <div class="font-weight-bold">Sản phẩm</div>
                                <div class="ml-auto font-weight-bold">Thành tiền</div>
                            </div>
                            <hr class="my-1">
                            <div class="d-flex">
                                <h4>Tổng các sản Phẩm</h4>
                                <div class="ml-auto font-weight-bold">
                                    <?php
                                    echo $fm->format_currency($subtotal) . ' ' . 'VNĐ';
                                    Session::set('sum', $subtotal);
                                    Session::set('qty', $qty);
                                    ?>
                                </div>
                            </div>
                            <hr class="my-1">
                            <div class="d-flex">
                                <h4>VAT</h4>
                                <div class="ml-auto font-weight-bold">10% </div>
                            </div>
                            <div class="d-flex">
                                <h4>phí giao hàng</h4>
                                <div class="ml-auto font-weight-bold">free </div>
                            </div>

                            <hr>
                            <div class="d-flex gr-total">
                                <h5>Tổng hóa đơn</h5>
                                <div class="ml-auto h5">
                                    <?php
                                    $vat = $subtotal * 0.1;
                                    $gtotal = $subtotal + $vat;
                                    echo $fm->format_currency($gtotal) . ' ' . 'VNĐ';
                                    ?>
                                </div>
                            </div>
                            <hr>
                        </div>
                    </div>
                    <div class="col-12 d-flex shopping-box"> <a href="?orderid=order" class="ml-auto btn hvr-hover">Thanh Toán</a></div>

                </div>
            </div>
        </div>

    </div>
</div>
<!-- End Cart -->

<?php include 'footer.php';
ob_end_flush(); ?>