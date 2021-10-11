<?php
	$filepath = realpath(dirname(__FILE__));
	include_once ($filepath.'/../lib/database.php');
	include_once ($filepath.'/../helpers/format.php');
?>

<?php
	/**
	 * 
	 */
	class customer
	{
		private $db;
		private $fm;
		
		public function __construct()
		{
			$this->db = new Database();
			$this->fm = new Format();
		}
		public function insert_binhluan(){
			$product_id = $_POST['product_id_binhluan'];
			$tenbinhluan = $_POST['tennguoibinhluan'];
			$binhluan = $_POST['binhluan'];
			
			if($tenbinhluan=='' || $binhluan==''){
				$alert = "<span class='error'>Không để trống các trường</span>";
				return $alert;
			}else{
				$query = "INSERT INTO tb_binhluan(tenbinhluan,binhluan,product_id) VALUES('$tenbinhluan','$binhluan','$product_id')";
					$result = $this->db->insert($query);
					if($result){
						$alert = "<span class='success'>Bình luận đã gửi</span>";
						return $alert;
					}else{
						$alert = "<span class='error'>Bình luận không thành công</span>";
						return $alert;
				}
			}
		}
		public function show_review($id){ 
            $query = "SELECT * FROM tb_binhluan WHERE product_id = '$id' ORDER BY binhluan_id DESC LIMIT 3";
            $result = $this->db->select($query);
            return $result;
        }
		public function del_comment($id){
			$query = "DELETE FROM tb_binhluan where binhluan_id = '$id'";
			$result = $this->db->delete($query);
			if($result){
				$alert = "<span class='success'>Xóa bình luận thành công</span>";
				return $alert;
			}else{
				$alert = "<span class='error'>Xóa bình luận không thành công</span>";
				return $alert;
			}
		}
		public function show_comment(){
			$query = "SELECT * FROM tb_binhluan order by binhluan_id desc";
			$result = $this->db->select($query);
			return $result;
		}
		public function insert_customers($data){
			$name = mysqli_real_escape_string($this->db->link, $data['name']);
			
			
			$email = mysqli_real_escape_string($this->db->link, $data['email']);
			$address = mysqli_real_escape_string($this->db->link, $data['address']);
			
			$phone = mysqli_real_escape_string($this->db->link, $data['phone']);
			$password = mysqli_real_escape_string($this->db->link, md5($data['password']));
			if($name==""  ||  $email=="" || $address==""  || $phone =="" || $password ==""){
				$alert = "<span class='error'>Không được để trống</span>";
				return $alert;
			}else{
				$check_email = "SELECT * FROM tbl_customer WHERE email='$email' LIMIT 1";
				$result_check = $this->db->select($check_email);
				if($result_check){
					$alert = "<span class='error'>Email Already Existed ! Please Enter Another Email</span>";
					return $alert;
				}else{
					$query = "INSERT INTO tbl_customer(name,email,address,phone,password) VALUES('$name','$email','$address','$phone','$password')";
					$result = $this->db->insert($query);
					if($result){
						$alert = "<span class='success'>Tạo Tài Khoản Thành Công</span>";
						return $alert;
					}else{
						$alert = "<span class='error'>Lỗi</span>";
						return $alert;
					}
				}
			}
		}
		public function login_customers($data){
			$email = mysqli_real_escape_string($this->db->link, $data['email']);
		$password = md5(mysqli_real_escape_string($this->db->link, $data['password']));
			if($email=='' || $password==''){
				$alert = "<span class='error'>Không được để trống</span>";
				return $alert;
			}else{
				$check_login = "SELECT * FROM tbl_customer WHERE email='$email' AND password='$password'";
				$result_check = $this->db->select($check_login);
				if($result_check){

					$value = $result_check->fetch_assoc();
					Session::set('customer_login',true);
					Session::set('customer_id',$value['id']);
					Session::set('customer_name',$value['name']);
					$alert = "";
					
						return $alert;
						//  header('Location:index.php');
					
				}else{
					$alert = "<span class='error'>Tài Khoản và mật Khẩu không khớp</span>";
					return $alert;
				}
			}
		}
		public function show_customers($id){
			$query = "SELECT * FROM tbl_customer WHERE id='$id'";
			$result = $this->db->select($query);
			return $result;
		}
		public function update_customers($data, $id){
			$name = mysqli_real_escape_string($this->db->link, $data['name']);
			$email = mysqli_real_escape_string($this->db->link, $data['email']);
			$address = mysqli_real_escape_string($this->db->link, $data['address']);
			$phone = mysqli_real_escape_string($this->db->link, $data['phone']);
			$password = mysqli_real_escape_string($this->db->link, md5($data['password']));
			
			if($name=="" ||  $email=="" || $address=="" || $phone ==""){
				$alert = "<span class='error'>Không được để trống</span>";
				return $alert;
			}else{
				$query = "UPDATE tbl_customer SET name='$name',email='$email',address='$address',phone='$phone',password='$password'WHERE id ='$id'";
				$result = $this->db->insert($query);
				if($result){
						$alert = "<span class='success'>Update thành công</span>";
						return $alert;
				}else{
						$alert = "<span class='error'>lỗi</span>";
						return $alert;
				}
				
			}
		}
		
		


	}
?>