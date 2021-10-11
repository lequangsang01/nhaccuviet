<?php ob_start();
include 'header2.php'; ?>
<?php
ob_start();
if (!isset($_GET['proid']) || $_GET['proid'] == NULL) {
    echo "<script>window.location ='404.php'";
} else {
    $id = $_GET['proid'];
}
$customer_id = Session::get('customer_id');
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['compare'])) {

    $productid = $_POST['productid'];
    $insertCompare = $product->insertCompare($productid, $customer_id);
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['wishlist'])) {

    $productid = $_POST['productid'];
    $insertWishlist = $product->insertWishlist($productid, $customer_id);
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {

    $quantity = $_POST['quantity'];
    $insertCart = $ct->add_to_cart($quantity, $id);
}
if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit1'])) {

    $quantity = $_POST['quantity'];
    $insertCart = $ct->add_to_cart($quantity, $id);
    header('Location:cart.php');
}
if (isset($_POST['binhluan_submit'])) {
    $binhluan_insert = $cs->insert_binhluan();
}
?>
<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Shop Detail</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Shop</a></li>
                    <li class="breadcrumb-item active"><a href="cart.php">Cart</a> </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Detail  -->
<div class="shop-detail-box-main">
    <div class="container">
        <div class="row">

            <?php
            $get_product_details = $product->get_details($id);
            if ($get_product_details) {
                while ($result_details = $get_product_details->fetch_assoc()) {
            ?>

                    <div class="col-xl-5 col-lg-5 col-md-6">
                        <div id="carousel-example-1" class="single-product-slider carousel slide" data-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active"> <img class="d-block w-100" src="admin/uploads/<?php echo $result_details['image'] ?>" alt="First slide"> </div>
                                <!-- <div class="carousel-item"> <img class="d-block w-100" src="Images2/piano/dan_piano_dien_roland_rp-30-400x400.jpg" alt="Second slide"> </div>
                            <div class="carousel-item"> <img class="d-block w-100" src="Images2/piano/dan_piano_dien_roland_rp-30-400x400.jpg" alt="Third slide"> </div> -->
                            </div>
                            <!-- <a class="carousel-control-prev" href="#carousel-example-1" role="button" data-slide="prev"> 
						<i class="fa fa-angle-left" aria-hidden="true"></i>
						<span class="sr-only">Previous</span> 
					</a>
                        <a class="carousel-control-next" href="#carousel-example-1" role="button" data-slide="next"> 
						<i class="fa fa-angle-right" aria-hidden="true"></i> 
						<span class="sr-only">Next</span> 
					</a> -->
                            <!-- <ol class="carousel-indicators">
                            <li data-target="#carousel-example-1" data-slide-to="0" class="active">
                                <img class="d-block w-100 img-fluid" src="Images2/piano/dan_piano_dien_roland_rp-30-400x400.jpg" alt="" />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="1">
                                <img class="d-block w-100 img-fluid" src="Images2/piano/dan_piano_dien_roland_rp-30-400x400.jpg" alt="" />
                            </li>
                            <li data-target="#carousel-example-1" data-slide-to="2">
                                <img class="d-block w-100 img-fluid" src="Images2/piano/dan_piano_dien_roland_rp-30-400x400.jpg" alt="" />
                            </li>
                        </ol> -->
                        </div>
                    </div>
                    <div class="col-xl-7 col-lg-7 col-md-6">
                        <div class="single-product-details">
                            <h2><?php echo $result_details['productName'] ?> </h2>
                            <h5>Giá: <?php echo $fm->format_currency($result_details['price']) . " " . "VNĐ" ?></h5>
                            <h5><span>Danh Mục: <?php echo $result_details['catName'] ?></span></h5>
                            <h5>Thương Hiệu: <span><?php echo $result_details['brandName'] ?></span></h5>
                            <!-- <p class="available-stock"><span> Có sẵn: 20 / <a href="#">đã bán: 8 </a></span> -->
                            <p>
                            <h4>Mô tả ngắn:</h4>
                            <p><?php echo $fm->textShorten($result_details['product_desc']) ?> </p>

                            <!-- <li>
                                        <div class="form-group size-st">
                                            <label class="size-label">Option</label>
                                            <select id="basic" class="selectpicker show-tick form-control">
									<option value="0">option</option>
									<option value="0">Phím gỗ</option>
									<option value="1">Phím nhựa</option>
								</select>
                                        </div>
                                    </li> -->

                            <div class="add-cart">
                                <form action method="post">
                                    <!-- <label class="control-label">Số Lượng</label> -->
                                    <input type="number" class="buyfield" name="quantity" value="1" min="1">
                                    <input type="submit" class="btn hvr-hover" name="submit" value="Thêm vào giỏ hàng" />
                                    <input type="submit" class="btn hvr-hover" name="submit1" value="Mua ngay" />
                                </form>
                                <?php
                                if (isset($insertCart)) {
                                    echo $insertCart;
                                }
                                ?>
                            </div>



                            <div class="price-box-bar">
                                <div class="cart-and-bay-btn">
                                    <!-- <a class="btn hvr-hover" data-fancybox-close="" href="checkout.php">Mua ngay</a> -->

                                    <!-- <a class="btn hvr-hover" data-fancybox-close="" > <input type="submit" class="buysubmit" name="submit" value="Thêm vào giỏ hàng" /></a> -->
                                </div>
                            </div>

                            <div class="add-to-btn">
                                <div class="add-comp">
                                    <!-- <a class="btn hvr-hover" href="#"><i class="fas fa-heart"></i> Thêm vào danh sách yêu thích</a> -->

                                </div>
                                <div class="share-bar">
                                    <a class="btn hvr-hover" href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a>
                                    <a class="btn hvr-hover" href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a>
                                    <a class="btn hvr-hover" href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                                    <a class="btn hvr-hover" href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a>
                                    <a class="btn hvr-hover" href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
            <?php
                }
            }
            ?>

        </div>

        <div style="display: flex;margin-bottom:100px;margin-top:50px">
            <div class="" style="float: left;width: 500px">
                <ul>
                    <li>
                        <h3>Bình luận sản phẩm:</h3>
                    </li>
                    <?php

                    $review = $cs->show_review($id);
                    if ($review) {
                        while ($result_review = $review->fetch_assoc()) {
                    ?>
                            <div style="display: flex;width: 500px;  height:20px">
                                <img src="images/download.png" alt="" width="25px">
                                <p><?php echo $result_review['tenbinhluan']; ?></p>
                            </div>
                            <div style=" width: 500px; height:20px; margin-left:25px">

                                <p><?php echo $result_review['binhluan']; ?></p>

                            </div>
                            <br>
                            <br>
                    <?php
                        }
                    }
                    ?>
            </div>
            <div class="binhluan" style="float: right;margin-left: 100px">
                <div class="row">
                    <div class="col-md-500" style=" width: 500px; height:100px;">
                        <h3>Viết bình luận: </h3>
                        <?php
                        if (isset($binhluan_insert)) {
                            echo $binhluan_insert;
                        }
                        ?>
                        <form action method="POST">
                            <p>
                                <input type="hidden" value="<?php echo $id ?>" name="product_id_binhluan" />
                            </p>
                            <p>
                                <input type="text" placeholder="Điền tên" class="form-control" name="tennguoibinhluan" />
                            </p>
                            <p>
                                <textarea rows="5" style="resize: none;" placeholder="Bình luận...." class="form-control" name="binhluan"></textarea>
                            </p>
                            <input type="hidden" name="time" value="<?php echo $timestamp ?>" />
                            <p>
                                <input type="submit" name="binhluan_submit" style="background-color: #d33b33; color: #fff; border-color: #d33b33;" value="Gửi bình luận" />
                            </p>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <div>
            
        </div>
        <!-- <div class="row my-5">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>sảm phẩm tương tự</h1>
                </div>

                <div class="col-lg-3 col-md-6 special-grid best-seller">
                    <div class="item"> 
                    <div class="products-single fix">

                        <div class="box-img-hover">
                            <img src="Images2/guitar/takamine-gd10ce-400x400.jpg" class="img-fluid" alt="Image">
                            <div class="mask-icon">
                                <ul>
                                    <li><a href="cart.php" data-toggle="tooltip" data-placement="right" title="thêm vào giỏ hàng"> <i class="fa fa-shopping-bag"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào danh sách yêu thích"><i class="far fa-heart"></i></a></li>
                                </ul>
                                <a class="cart" href="shop-detail.php">Xem chi tiết</a>
                            </div>
                        </div>
                        <div class="why-text">
                            <h4>ten sp</h4>
                            <h5> gia</h5>
                        </div>
                    </div>
                    
                </div>

            </div>
        </div> -->

    </div>
    
</div>
<!-- End Cart -->


<?php include 'footer.php';
ob_end_flush(); ?>