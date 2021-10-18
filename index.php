<?php include 'header.php'; ?>
<!-- Start Categories  -->
<div class="categories-shop">
    <div class="container">
        <div class="row">
            <?php
            $product_feathered = $cat->getcat();
            if ($product_feathered) {
                while ($result = $product_feathered->fetch_assoc()) {
            ?>
                    <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                        <div class="shop-cat-box">
                            <img class="img-fluid" src="admin/uploads/<?php echo $result['catImage'] ?>" alt="" />
                            <a class="btn hvr-hover" href="shop-cat.php?catid=<?php echo $result['catId'] ?>"><?php echo $result['catName'] ?></a>
                        </div>
                    </div>
            <?php
                }
            }
            ?>

        </div>
    </div>
</div>
<!-- End Categories -->

<!-- Start Products  -->
<div class="products-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="title-all text-center">
                    <h1>Sản Phẩm Nổi Bật</h1>
                    <p></p>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="special-menu text-center">
                    <div class="button-group filter-button-group">
                        <button class="active" data-filter="*">Tất cả sản phẩm</button>
                        <!-- <button data-filter=".top-featured">Mới cập nhật</button> -->
                        <button data-filter=".best-seller">Bán chạy nhất</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row special-list">

            <?php
            $product_feathered = $product->getproduct_feathered();
            if ($product_feathered) {
                while ($result = $product_feathered->fetch_assoc()) {
            ?>
                    <div class="col-lg-3 col-md-6 special-grid best-seller">
                        <div class="products-single fix">
                            <div class="box-img-hover">
                                <div class="type-lb">
                                    <p class="sale">Hot</p>
                                </div>
                                <a href="shop-detail.php?proid=<?php echo $result['productId'] ?>"><img src="admin/uploads/<?php echo $result['image'] ?>" width=220 height=220 /></a>
                                <div class="mask-icon">
                                    <ul>

                                        <!-- <li><a href="cart.php" data-toggle="tooltip" data-placement="right" title="thêm vào giỏ hàng"> <i class="fa fa-shopping-bag"></i></a></li>
                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào danh sách yêu thích"><i class="far fa-heart"></i></a></li> -->
                                    </ul>
                                    <a class="cart" href="shop-detail.php?proid=<?php echo $result['productId'] ?>">Xem chi tiết</a>
                                </div>
                            </div>
                            <div class="why-text">
                                <h4><?php echo $result['productName'] ?> </h4>
                                <h5 style="color: red;"> <span class="price"><?php echo $fm->format_currency($result['price']) . "VNĐ" ?></h5>
                            </div>
                        </div>
                    </div>
            <?php
                }
            }
            ?>





        </div>
    </div>
</div>
<!-- End Products  -->

<!-- Start Blog  -->
<div class="latest-blog">
    <div class="container">
        <div class="contact-map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3716.844709915954!2d105.40138501476854!3d21.317151585842915!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31348d4d8be31baf%3A0x288005b3fc0549bb!2zU0hPUCBOSOG6oEMgQ-G7pA!5e0!3m2!1sen!2s!4v1633940319088!5m2!1sen!2s" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>        </div>
    </div>
</div>
<!-- End Blog  -->


<?php include 'footer.php'; ?>