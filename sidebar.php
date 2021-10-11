<div class="filter-brand-left">
    <div class="title-left">
        <h3>Thương hiệu</h3>
    </div>
    <div class="brand-box">
        <ul>
            <?php
            $brand = $br->show_brand_home();
            if ($brand) {
                while ($result_new = $brand->fetch_assoc()) {

            ?>
                    <li>
                       
                            <!-- <input name="survey" id="Radios1" value="Yes" type="radio"> -->
                            <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                    <a href="shop-brand.php?brandid=<?php echo $result_new['brandId'] ?>" class="list-group-item list-group-item-action"> <?php echo $result_new['brandName'] ?><small class="text-muted"> </small></a>

                                </div>
                            <!-- <label for="Radios1"><?php echo $result_new['brandName'] ?> </label> -->
                        
                    </li>
            <?php
                }
            }
            ?>
        </ul>
    </div>
</div>