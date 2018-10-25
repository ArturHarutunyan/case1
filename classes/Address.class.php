<?php

class Address{
  protected $page = 'edititem';
  protected $pdo;
  protected $pagedata = array();
  protected $edited = 0;
  protected $Added = 0;
  public function __construct($page){
	global $pdo;
	$this->pdo = &$pdo;
	$this->page=$page;
  }
  public function prepare(){
	switch($this->page){
	  case 'edit': return $this->PrepareEditContent();break;
	  case 'add': return $this->PrepareAddContent();break;
	  case 'edititem': return $this->PrepareEditItemContent();break;
	  default:return false;
	}
	return true;
  }
  public function Show(){
	switch($this->page){
	  case 'edit': return $this->ShowEditContent();break;
	  case 'add': return $this->ShowAddContent();break;
	  case 'edititem': return $this->ShowEditItemContent();break;
	  default:return $this->ShowEditItemContent();
	}
  }
  private function ShowEditItemContent(){
	?>
	  <a href="?page=add" id="addNewAddress">add new address</a>
	  <a href="/case1/exportXML.php" download id="exportInXML">Export in XML</a>

	  
	  <table>
		<thead>
		  <tr>
			<td>Last Name</td>
			<td>First Name</td>
			<td>city</td>
			<td>street</td>
			<td>zip code</td>
			<td>edit</td>
		  </tr>
		</thead>
		<tbody>
		  <?php
		  foreach ($this->pagedata as $key => $value) {
			?>
			  <tr>
				<td><?=$value['name']?></td>
				<td><?=$value['firstName']?></td>
				<td><?=$value['cityName']?></td>
				<td><?=$value['street']?></td>
				<td><?=$value['zipCode']?></td>
				<td><a href="?page=edit&id=<?=$value['id']?>">edit</a></td>
			  </tr>
			<?php
		  } ?>
		</tbody>
	  </table>
	<?php

  }
  private function ShowAddContent(){
	if ($this->Added ) {
	  ?>
		<span>This address added <a href="/">Go to main page</a> </span>
	  <?php
	}
	?>
	  <form class="submitForm" method="post">
	  	<div class="fields">
		  <label for="lname">Last Name</label>
		  <input required type="text"  id="lname" name="lname" value="">
		</div>
		<div class="fields">
		  <label for="fname">First Name</label>
		  <input required type="text" id="fname" name="fname" value="">
		</div>
		<div class="fields">
		  <label for="city">city</label>
		  <select required class="" id="city" name="city">
			<?php
			foreach ($this->Citis as $key => $value) {
			  ?>
				<option value="<?=$value['id']?>"><?=$value['name']?></option>
			  <?php
			} ?>
		  </select>
		</div>
		<div class="fields">
		  <label for="zipCode">zip-code</label>
		  <input type="number" required id="zipCode" name="zipCode" value="">
		</div>
		<div class="fields">
		  <label for="street">street</label>
		  <input type="text" required id="street" name="street" value="">
		</div>
		<div class="fields buttonsBlock" >
		  <input type="hidden"  name="submited" value="1">
		  <input type="submit" class="button" name="submit" value="add">
		  <a href="/case1" class="cancel button">cancel</a>

		</div>
	  </form>
	<?php
	return true;
  }
  private function ShowEditContent(){
	if ($this->edited ) {
	  ?>
		<span>This address added <a href="/">Go to main page</a> </span>
	  <?php
	}
	?>
	  <form class="" method="post">

		<div class="fields">
		  <label for="lname">Name</label>
		  <input type="text" id="lname" name="lname" value="<?=$this->itemData['name']?>">
		</div>
		<div class="fields">
		  <label for="fname">First Name</label>
		  <input type="text" id="fname" name="fname" value="<?=$this->itemData['firstName']?>">
		</div>
		<div class="fields">
		  <label for="city">city</label>
		  <select class="" id="city" name="city">
			<?php
			foreach ($this->Citis as $key => $value) {
			  ?>
				<option <?php if ($value['id']==$this->itemData['city']) {
				  echo " selected ";
				} ?> value="<?=$value['id']?>"><?=$value['name']?></option>
			  <?php
			} ?>
		  </select>
		</div>
		<div class="fields">
		  <label for="zipCode">zip-code</label>
		  <input type="number" id="zipCode" name="zipCode" value="<?=$this->itemData['zipCode']?>">
		</div>
		<div class="fields">
		  <label for="street">street</label>
		  <input type="text" id="street" name="street" value="<?=$this->itemData['street']?>">
		</div>
		<div class="fields buttonsBlock">
		  <input type="hidden" name="submited" value="1">
		  <input type="submit" name="submit" class="button" value="Save Changes">
		  <a href="/case1" class="cancel button">cancel</a>
		</div>
	  </form>
	<?php
	return true;
  }
  private function PrepareEditContent(){
	if (!isset($_GET['id'])) {
	  return false;
	}
	$id = intval($_GET['id']);
	$sql = "SELECT id,name FROM cities";
	if(!$CitisQuery = $this->pdo->query($sql)){
	  return false;
	}
	$this->Citis = $CitisQuery->fetchAll();
	$sql = "SELECT * FROM addresbook WHERE id=:id and deleted=0";
	$SelectAddressSql = $this->pdo->prepare($sql);
	  $SelectAddressSql->bindParam(":id",$id,PDO::PARAM_INT);
	if (!$SelectAddressSql->execute()) {
	  return false;
	}
	if ($SelectAddressSql->rowCount()==0) {
	  return false;
	}
	$this->itemData = $SelectAddressSql->fetch();

	if (isset($_POST['submited'])) {
	  $sql = "UPDATE addresbook SET name=:lname,firstName=:firstName,city=:city,street=:street,zipCode=:zipCode WHERE id=:id";
		$UpdateQuery = $this->pdo->prepare($sql);
		$UpdateQuery->bindParam(":lname",$_POST['lname'],PDO::PARAM_STR);

		$UpdateQuery->bindParam(":firstName",$_POST['fname'],PDO::PARAM_STR);
		$UpdateQuery->bindParam(":city",$_POST['city'],PDO::PARAM_INT);
		$UpdateQuery->bindParam(":street",$_POST['street'],PDO::PARAM_STR);
		$UpdateQuery->bindParam(":zipCode",$_POST['zipCode'],PDO::PARAM_INT);
		$UpdateQuery->bindParam(":id",$id,PDO::PARAM_INT);
		if(!$UpdateQuery->execute()){
			return false;
		}
			header("LOCATION: /case1");



		
	}
	return true;
  }
  private function PrepareAddContent(){
	$sql = "SELECT id,name FROM cities";
	if(!$CitisQuery = $this->pdo->query($sql)){
	  return false;
	}
	$this->Citis = $CitisQuery->fetchAll();
	if (isset($_POST['submited'])) {
	  $sql = "INSERT INTO `addresbook`(`name`,`firstName`, `city`, `street`, `zipCode`) VALUES (:lname,:firstName,:city,:street,:zipcode)";
	  $insertQuert = $this->pdo->prepare($sql);
	  
		$insertQuert->bindParam(":lname",$_POST['lname'],PDO::PARAM_STR);
	  	$insertQuert->bindParam(":firstName",$_POST['fname'],PDO::PARAM_STR);
		$insertQuert->bindParam(":city",$_POST['city'],PDO::PARAM_INT);
		$insertQuert->bindParam(":street",$_POST['street'],PDO::PARAM_STR);
		$insertQuert->bindParam(":zipcode",$_POST['zipCode'],PDO::PARAM_INT);
	  if (!$insertQuert->execute()) {
		return false;
	  }
	  $this->Added = 1;
	}
	return true;
  }
  private function PrepareEditItemContent(){
	$sql = "SELECT `addresbook`.*,`cities`.`name` as `cityName` FROM `addresbook`
			INNER JOIN `cities` ON `addresbook`.`city`=`cities`.`id`
			WHERE `deleted` = 0";
	$res = $this->pdo->query($sql);
	$this->pagedata = $res->fetchAll();
	return true;
  }
}

?>
