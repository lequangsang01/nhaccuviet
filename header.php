<?php include 'header2.php'; ?>

    <!-- Start Slider -->
    <div id="slides-shop" class="cover-slides">
        <ul class="slides-container">
                <?php
                    $product_feathered = $product->getslide();
                    if($product_feathered){
                        while($result = $product_feathered->fetch_assoc()){
                ?>
            <li class="text-left">
                <img src="admin/uploads/<?php echo $result['slider_image'] ?>" alt="">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <h1 class="m-b-20"><strong>Welcome To <br> NHẠC CỤ VIÊT</strong></h1>
                            <!-- <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p> -->
                            <p><a class="btn hvr-hover" href="shop.php">MUA HÀNG NGAY</a></p>
                        </div>
                    </div>
                </div>
            </li>
            <?php
                }
            }
                ?>
        </ul>
        <div class="slides-navigation">
            <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
            <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
        </div>
    </div>
    <!-- End Slider -->