<?php

use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpSpreadsheet\Helper\Sample;

require_once 'C:/xampp/htdocs/dashboard/Teacher-Guardian/phpspreadsheet/vendor/phpoffice/phpspreadsheet/src/Bootstrap.php';

$helper = new Sample();

// require __DIR__ . '/../Header.php';

$inputFileType = 'Xlsx';
$inputFileName = __DIR__ . '/sampleData/college-attend.xlsx';

// $helper->log('Loading file ' . pathinfo($inputFileName, PATHINFO_BASENAME) . ' using IOFactory with a defined reader type of ' . $inputFileType);
$reader = IOFactory::createReader($inputFileType);
// $helper->log('Turning Formatting off for Load');
$reader->setReadDataOnly(true);
$spreadsheet = $reader->load($inputFileName);

$sheetData = $spreadsheet->getActiveSheet()->toArray(null, true, true, true);
// var_dump($sheetData);
$x = 0;
for($row=1; $row <= count($sheetData) ; $row++){
    // echo implode(" ", $sheetData[$row]);
    // echo "<br>";
    for($col=0; $col <= 18; $col++){
        $regex = '/^Roll/';
        $regex1 = '/Attd+/';
        $val = $sheetData[$row][chr($col+65)];
        if (is_null($val)){
            // echo "Hello";
            continue;
        }
        elseif (preg_match($regex, $val)){
            // echo "Match found";
            // echo $val;
            $x = 1;
            $c = chr($col+65);
            $r = $row;
        }
        if(preg_match($regex1, $val)){
            // echo "Attend";
            $c1 = chr($col+65);
        }
    }
    if ($x==1){
        break;
    }
}

$servername="localhost";
//add below line in every file. It displays error for all sql querries.
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$conn = mysqli_connect($servername,"root","","computer_dept") ;

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

for( $row = $r+1; $row <= count($sheetData); $row++){
    $val = $sheetData[$row][$c];
    if(!is_null($val)){
        $stud_id = $sheetData[$row][$c];
        $attendance = $sheetData[$row][$c1];
        $sql = "insert into attendance values ($stud_id, 5, 3, 'September', $attendance)";
        if(mysqli_query($conn, $sql)){
            echo "Row inserted successfully <br>";
        }
    }
}

?>