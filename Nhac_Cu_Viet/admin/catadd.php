<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php include '../classes/category.php' ?>

<?php
    $cat = new category();
    if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])) {
  
       
        $insertCat = $cat->insert_category($_POST, $_FILES);
        
    }
?>
<?php  ?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Thêm Nhóm Sản Phẩm</h2>

               <div class="block copyblock"> 
                 <?php
                if(isset($insertCat)){
                    echo $insertCat;
                }
                ?>
                 <form action="catadd.php" method="post"enctype="multipart/form-data">
                    <table class="form">					
                        <tr>
                            <td>
                                <input type="text" name="catName" placeholder="Làm ơn thêm danh mục sản phẩm..." class="medium" />
                            </td>
                        </tr>
						
                        <tr>
                            <td>
                                <label>Chọn ảnh</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="file" name="image"/>
                            </td>
                        </tr>
                        <tr> 
                            <td>
                                <input type="submit" name="submit" Value="Save" />
                            </td>
                        </tr>

                    </table>
                    </form>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>