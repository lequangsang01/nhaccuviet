<?php include 'header2.php'; ?>
<?php
	if(!isset($_GET['brandid']) || $_GET['brandid']==NULL){
       echo "<script>window.location ='404.php'</script>";
    }else{
        $id = $_GET['brandid']; 
    }
   
?>

<!-- Start All Title Box -->
<div class="all-title-box">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h2>Cửa hàng</h2>
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Trang chủ</a></li>
                    <li class="breadcrumb-item active">Cửa hàng</li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- End All Title Box -->

<!-- Start Shop Page  -->
<div class="shop-box-inner">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                <div class="product-categori">
                    <div class="search-product">
                    <form action="shop-search.php"method="post">
                            <input class="form-control" placeholder="Nhập tên sản phẩm cần tìm" type="text"name="tukhoa">
                            <button type="submit"name="search_product"> <i class="fa fa-search"></i> </button>
                        </form>
                    </div>
                    <div class="filter-sidebar-left">
                        <div class="title-left">
                            <h3>Danh Mục</h3>
                        </div>
                        <?php
                        $product_feathered = $cat->getcat();
                        if ($product_feathered) {
                            while ($result = $product_feathered->fetch_assoc()) {
                        ?>
                                <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                    <a href="shop-cat.php?catid=<?php echo $result['catId'] ?>" class="list-group-item list-group-item-action"> <?php echo $result['catName'] ?><small class="text-muted"> </small></a>

                                </div>
                        <?php
                            }
                        }
                        ?>
                    </div>

                    <?php include 'sidebar.php'; ?>

                </div>
            </div>
            <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                <div class="right-product-box">
                    <!-- <div class="product-item-filter row">
                        <div class="col-12 col-sm-8 text-center text-sm-left">
                            <div class="toolbar-sorter-right">
                                <span>Xếp theo</span>
                                <select id="basic" class="selectpicker show-tick form-control" data-placeholder="$ USD">
                                    <option data-display="Select">Nothing</option>
                                    <option value="1">Bán chạy</option>
                                    <option value="2">Giá cao → thấp</option>
                                    <option value="3">Giá thấp → cao</option>
                                    <option value="4">A → Z</option>
                                    <option value="5">Z → A</option>
                                </select>
                            </div>
                            <p>Showing all 5 results</p>
                        </div>
                        <div class="col-12 col-sm-4 text-center text-sm-right">
                            <ul class="nav nav-tabs ml-auto">
                                <li>
                                    <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                </li>
                                <li>
                                    <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                </li>
                            </ul>
                        </div>
                    </div> -->
                    <!-- <div>
                        <?php
                            echo $result_new['brandName'] 
                        ?>
                    </div> -->
                    <div class="row product-categorie-box">
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                <div class="row">

                                    <?php
                                    $brandpr = $br->getproduct_new($id);
                                    if ($brandpr) {
                                        while ($result_new = $brandpr->fetch_assoc()) {
                                    ?>
                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                <div class="products-single fix">
                                                    <div class="box-img-hover">
                                                        <!-- <div class="type-lb">
                                                            <p class="sale">Sale</p>
                                                        </div> -->
                                                        <a href="shop-detail.php?proid=<?php echo $result_new['productId'] ?>"> <img src="admin/uploads/<?php echo $result_new['image'] ?>" width=220 height=220></a>
                                                        <div class="mask-icon">
                                                            <!-- <ul>
                                                                <li><a href="cart.php" data-toggle="tooltip" data-placement="right" title="Chi tiết"><i class="fa fa-shopping-bag"></i></a></li>
                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm vào yêu thích"><i class="far fa-heart"></i></a></li>
                                                            </ul> -->
                                                            <a class="cart" href="shop-detail.php?proid=<?php echo $result_new['productId'] ?>">Xem chi tiết</a>
                                                        </div>
                                                    </div>
                                                    <div class="why-text">
                                                        <h4><?php echo $result_new['productName'] ?> </h4>
                                                        <h5 style="color: red;"> <span class="price"><?php echo $fm->format_currency($result_new['price']) . "VNĐ" ?></h5>
                                                    </div>
                                                </div>
                                            </div>
                                    <?php
                                        }
                                    }
                                    ?>
                                    <!---->




                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        a.phantrang {
            border: 1px solid #ddd;
            padding: 10px;
            background: #010101;
            color: #fff;
            cursor: pointer;

        }

        a.phantrang:hover {
            background: blue;
        }
        #right {
            float:right;
            width:200px;
        }
    </style>
    <div class="btn_1" id="right">
        <style>
            a.phantrang:hover {
                background: #d53333;
                color: #fff;

            }
        </style>
        <?php
        if (isset($_GET['trang'])) {
            $trang = $_GET['trang'];
        } else {
            $trang = 1;
        }
        $brandpr = $br->get_product_by_brand($id);
        $product_count = mysqli_num_rows($brandpr);
        $product_button = ceil($product_count / 12);
        $result_new = $brandpr->fetch_assoc();
        
        $i = 1;
        // echo '<p>Trang : </p>';
        for ($i = 1; $i <= $product_button; $i++) {
        ?>
            <a class="phantrang" 
                <?php if ($i == $trang) {
                echo 'style="background:#d33b33"';
                } ?> style="margin:0 10px;" href="shop-brand.php?brandid=<?php echo $result_new['brandId'] ?>?trang=<?php echo $i ?>"><?php echo $i ?>
            </a>
        <?php

        }
        ?>
    </div>
</div>
<!-- End Shop Page -->

<?php include 'footer.php'; ?>