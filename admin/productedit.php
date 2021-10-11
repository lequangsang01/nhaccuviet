<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php include '../classes/brand.php';?>
<?php include '../classes/category.php';?>
<?php include '../classes/product.php';?>
<?php
    $pd = new product();

    if(!isset($_GET['productid']) || $_GET['productid']==NULL){
       echo "<script>window.location ='productlist.php'</script>";
    }else{
         $id = $_GET['productid']; 
    }
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
        
        $updateProduct = $pd->update_product($_POST,$_FILES, $id);
        
    }
?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Sửa sản phẩm</h2>
        <div class="block">    
         <?php

                if(isset($updateProduct)){
                    echo $updateProduct;
                }

            ?>        
        <?php
         $get_product_by_id = $pd->getproductbyId($id);
            if($get_product_by_id){
                while($result_product = $get_product_by_id->fetch_assoc()){
        ?>     
         <form action="" method="post" enctype="multipart/form-data">
            <table class="form">
               
                <tr>
                    <td>
                        <label>Tên Sản Phẩm</label>
                    </td>
                    <td>
                        <input type="text"  name="productName" value="<?php echo  $result_product['productName']?>" placeholder="Nhập tên sản phẩm" class="medium" />
                        
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>NHóm Sản Phẩm</label>
                    </td>
                    <td>
                        <select id="select" name="category">
                            <option>Chọn Nhóm Sản Phẩm</option>
                            <?php
                            $cat = new category();
                            $catlist = $cat->show_category();

                            if($catlist){
                                while($result = $catlist->fetch_assoc()){
                             ?>


                            <option
                            <?php
                            if($result['catId']==$result_product['catId']){ echo 'selected';  }
                            ?>

                             value="<?php echo $result['catId'] ?>"><?php echo $result['catName'] ?></option>



                               <?php
                                  }
                              }
                           ?>
                        </select>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Thương Hiệu</label>
                    </td>
                    <td>
                        <select id="select" name="brand">
                            <option>Chọn THương Hiệu</option>

                             <?php
                            $brand = new brand();
                            $brandlist = $brand->show_brand();
                            if($brandlist){
                                while($result = $brandlist->fetch_assoc()){
                             ?>
                            <option>

                            <?php
                            if($result['brandId']==$result_product['brandId']){ echo 'selected';  }
                            ?>
                             value="<?php echo $result['brandId'] ?>"><?php echo $result['brandName'] ?></option>

                               <?php
                                  }
                              }
                           ?>
                        </select>
                    </td>
                </tr>
				
				 <tr>
                    <td style="vertical-align: top; padding-top: 9px;">
                        <label>Mô Tả</label>
                    </td>
                    <td>
                    <textarea name="product_desc" class="tinymce"><?php echo $result_product['product_desc']?></textarea>
                    </td>
                </tr>
				<tr>
                    <td>
                        <label>Giá</label>
                    </td>
                    <td>
                        <input type="text" value="<?php echo $result_product['price'] ?>" name="price" class="medium" />
                    </td>
                </tr>
            
                <tr>
                    <td>
                        <label>Ảnh Sản Phẩm</label>
                    </td>
                    <td>
                        <img src="uploads/<?php echo $result_product['image'] ?>" width="90"><br>
                        <input type="file" name="image" />
                    </td>
                </tr>
				
				<tr>
                    <td>
                        <label>Loại Sản Phẩm</label>
                    </td>
                    <td>
                        <select id="select" name="type">
                            <option>Chọn Loại Sản Phẩm</option>
                            <?php
                            if($result_product['type']==0){
                            ?>
                            <option selected value="0">Nổi Bật</option>
                            <option value="1">Bình Thường</option>
                            <?php
                        }else{
                            ?>
                            <option value="0">Nổi Bật</option>
                            <option selected value="1">Bình Thường</option>
                            <?php
                            }
                            ?>
                        </select>
                    </td>
                </tr>

				<tr>
                    <td></td>
                    <td>
                        <input type="submit" name="submit" value="Update" />
                    </td>
                </tr>
            </table>
            </form>
            <?php
        }

        }
            ?>
        </div>
    </div>
</div>
<!-- Load TinyMCE -->
<script src="js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function () {
        setupTinyMCE();
        setDatePicker('date-picker');
        $('input[type="checkbox"]').fancybutton();
        $('input[type="radio"]').fancybutton();
    });
</script>
<!-- Load TinyMCE -->
<?php include 'inc/footer.php';?>


