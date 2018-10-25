<?php
header("Content-type: text/xml");
header("Content-Disposition: attachment; filename=ReportXML.xml");
include './incs/config.php';
include './incs/functions.php';
$db = db_connect();
// prepare all queries...
$sql = "SELECT `addresbook`.*,`cities`.`name` as `cityName` FROM `addresbook`
            INNER JOIN `cities` ON `addresbook`.`city`=`cities`.`id`
            WHERE `deleted` = 0";
            $res = $db->query($sql);
            if (!$res) {
                exit("0");
            }
// fetch all artists

$adress=$res->fetchAll(PDO::FETCH_ASSOC);


$x=new XMLWriter();
$x->openMemory();
$x->startDocument('1.0','UTF-8');
$x->startElement('address');

foreach ($adress as $adres) {
$x->startElement('addres');
 $x->writeAttribute('id',$adres['id']);

    $x->startElement('name');
        $x->text($adres['name']);
    $x->endElement(); // name

    $x->startElement('firstName');
        $x->text($adres['firstName']);
    $x->endElement(); // firstName
    $x->startElement('street');
        $x->text($adres['street']);
    $x->endElement(); // street
    $x->startElement('zip-code');
        $x->text($adres['zipCode']);
    $x->endElement(); // zipCode
    $x->startElement('cityName');
        $x->text($adres['cityName']);
    $x->endElement(); // cityName
    

$x->endElement(); // adress

} 
$x->endElement(); // artist


$xml = $x->outputMemory();
echo $xml;
// now save $xml to a file etc.