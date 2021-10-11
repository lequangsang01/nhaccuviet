<?php
	$filepath = realpath(dirname(__FILE__));
	include_once ($filepath.'/../lib/database.php');
	include_once ($filepath.'/../helpers/format.php');
?>

<?php
	/**
	 * 
	 */
	class category
	{
		private $db;
		private $fm;
		
		public function __construct()
		{
			$this->db = new Database();
			$this->fm = new Format();
		}
		public function all_category(){
			
		}
		public function insert_category($data,$files){
			$catName = mysqli_real_escape_string($this->db->link, $data['catName']);
			
			
			//Kiem tra hình ảnh và lấy hình ảnh cho vào folder upload
			$permited  = array('jpg', 'jpeg', 'png', 'gif');

			$file_name = $_FILES['image']['name'];
			$file_size = $_FILES['image']['size'];
			$file_temp = $_FILES['image']['tmp_name'];

			$div = explode('.', $file_name);
			$file_ext = strtolower(end($div));
			// $file_current = strtolower(current($div));
			$unique_image = substr(md5(time()), 0, 10).'.'.$file_ext;
			$uploaded_image = "uploads/".$unique_image;


			if($catName==""){
				$alert = "<span class='error'>Không Được Để TRống</span>";
				return $alert;
			}else{
				if(!empty($file_name)){
					//Nếu người dùng chọn ảnh
					if ($file_size > 2048000) {

		    		 $alert = "<span class='success'>Ảnh Không quá dung lượng 4MB!</span>";
					return $alert;
				    } 
					elseif (in_array($file_ext, $permited) === false) 
					{
				     // echo "<span class='error'>You can upload only:-".implode(', ', $permited)."</span>";	
				    $alert = "<span class='success'>Bạn chỉ tải được những tệp :-".implode(', ', $permited)."</span>";
					return $alert;
					}
					move_uploaded_file($file_temp,$uploaded_image);
					$query = "INSERT INTO tbl_category(catName,catImage) VALUES('$catName','$unique_image')";
					$result = $this->db->insert($query);
					if($result){
						$alert = "<span class='success'>Thêm Thành Công</span>";
						return $alert;
					}else{
						$alert = "<span class='error'>Lỗi</span>";
						return $alert;
					}
				}
			}
		}
		public function show_category(){
			$query = "SELECT * FROM tbl_category order by catId desc";
			$result = $this->db->select($query);
			return $result;
		}
		public function update_category($data,$files,$id){

		
			$catName = mysqli_real_escape_string($this->db->link, $data['catName']);
			
			
			//Kiem tra hình ảnh và lấy hình ảnh cho vào folder upload
			$permited  = array('jpg', 'jpeg', 'png', 'gif');

			$file_name = $_FILES['image']['name'];
			$file_size = $_FILES['image']['size'];
			$file_temp = $_FILES['image']['tmp_name'];

			$div = explode('.', $file_name);
			$file_ext = strtolower(end($div));
			// $file_current = strtolower(current($div));
			$unique_image = substr(md5(time()), 0, 10).'.'.$file_ext;
			$uploaded_image = "uploads/".$unique_image;


			if($catName==""){
				$alert = "<span class='error'>Không Được Để TRống</span>";
				return $alert;
			}else{
				if(!empty($file_name)){
					//Nếu người dùng chọn ảnh
					if ($file_size > 2048000) {

		    		 $alert = "<span class='success'>Ảnh Không quá dung lượng 4MB!</span>";
					return $alert;
				    } 
					elseif (in_array($file_ext, $permited) === false) 
					{
				     // echo "<span class='error'>You can upload only:-".implode(', ', $permited)."</span>";	
				    $alert = "<span class='success'>Bạn chỉ tải được những tệp :-".implode(', ', $permited)."</span>";
					return $alert;
					}
					move_uploaded_file($file_temp,$uploaded_image);
					$query = "UPDATE tbl_category  SET catName= '$catName',catImage='$unique_image' WHERE catId = '$id'";
					


				}else{
					$query = "UPDATE tbl_category  SET catName= '$catName'WHERE catId = '$id'";
				}
					$result = $this->db->insert($query);
					if($result){
						$alert = "<span class='success'>Sửa Thành Công</span>";
						return $alert;
					}else{
						$alert = "<span class='error'>Lỗi</span>";
						return $alert;
					}
				
			}
		}
		public function del_category($id){
			$query = "DELETE FROM tbl_category where catId = '$id'";
			$result = $this->db->delete($query);
			if($result){
				$alert = "<span class='success'>Xóa Thành Công</span>";
				return $alert;
			}else{
				$alert = "<span class='error'>Lỗi</span>";
				return $alert;
			}
			
		}
		public function getcatbyId($id){
			$query = "SELECT * FROM tbl_category where catId = '$id'";
			$result = $this->db->select($query);
			return $result;
		}
		public function show_category_fontend(){
			$query = "SELECT * FROM tbl_category order by catId desc";
			$result = $this->db->select($query);
			return $result;
		}
		public function get_product_by_cat($id){
			$query = "SELECT * FROM tbl_product WHERE catId='$id' order by catId desc LIMIT 8";
			$result = $this->db->select($query);
			return $result;
		}
		public function get_name_by_cat($id){
			$query = "SELECT tbl_product.*,tbl_category.catName,tbl_category.catId FROM tbl_product,tbl_category WHERE tbl_product.catId=tbl_category.catId AND tbl_product.catId ='$id' LIMIT 1";
			$result = $this->db->select($query);
			return $result;
		}
		// public function getcat_feathered(){
		// 	$query = "SELECT * FROM tbl_catgory ";
		// 	$result = $this->db->select($query);
		// 	return $result;
		// } 
		public function getcat(){
			$query = "SELECT * FROM tbl_category  LIMIT 6 ";
			$result = $this->db->select($query);
			return $result;
		} 

	}
?>