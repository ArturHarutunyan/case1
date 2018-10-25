<?php
class Kernel{
  static $pages = array(
    'add',
    'edit',
    'edititem'
  );
  static $thisPage = 'edititem';
  static function dispatch(){
    if (isset($_GET['page'])) {
      if (in_array($_GET['page'],self::$pages)) {
        self::$thisPage = $_GET['page'];
      }
    }
    include BASE_ROUTH."/classes/Address.class.php";
    $Address = new Address(self::$thisPage);
    if (!$Address->prepare()) {
      header("Location: ?page=edititem");
    }
    include "./views/index.php";
    $Address->Show();
    include "./views/footer.php";


  }
} ?>
