<?php 
    session_start(); 

    // Import PHPMailer classes into the global namespace
    // These must be at the top of your script, not inside a function
    use PHPMailer\PHPMailer\PHPMailer;
    use PHPMailer\PHPMailer\SMTP;
    use PHPMailer\PHPMailer\Exception;
    use PhpOffice\PhpSpreadsheet\IOFactory;
    use PhpOffice\PhpSpreadsheet\Helper\Sample;

    // Load Composer's autoloader
    require 'C:/Users/hp/vendor/autoload.php';
    require 'C:/xampp/htdocs/dashboard/Teacher-Guardian/phpspreadsheet/vendor/phpoffice/phpspreadsheet/src/Bootstrap.php';


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <title>Professor</title>

    <style>
        body{
            background-color: #45A29E;
        }
        .container{
            margin-top: 50px;
            width: 600px;
            background-color: #1F2833;
            border-radius: 50px;
        }
        .container:hover {
            box-shadow: 10px 15px 30px rgba(28, 28, 31, 0.952);
        }
        .jumbotron{
            background-color: #0B0C10;
            width: 100%;
            font-family: Arial, Helvetica, sans-serif;
        }
        .heading{
            color: #45A29E;
            font-size: 60px;
        }
        .form-group{
            color: #66FCF1;
            font-size: 25px;
        }
        .form-control{
            background-color: #C5C6C7;
            border-radius: 20px;
        }
        .form-control::placeholder{
            color: #0B0C10;
        }
        .btn{
            margin-left: 40%;
            background-color: #0B0C10;
            border: 1px solid #66FCF1;
            border-radius: 30px;
            color: #66FCF1;
            margin-bottom: 10px;
            font-family: 'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
        }
        button:hover{
            background-color: #4FA29E;
            color: #0B0C10;
        }
    </style>

</head>
<body>
    <div class="container">
        <div class="jumbotrom text-center">
            <h2 class="heading">Add Student Attendance</h2>
            <!-- <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">&times;</button> -->
        </div>
        <div class="container-fluid">
            <form method="POST">
                <div class="form-group">
                    <label for="sem">Semester: </label>
                    <input id="sem" type="number" class="form-control" name="sem" placeholder="Semester" required>
                </div>
                <div class="form-group">
                    <label for="year">Year: </label>
                    <input id="year" type="number" class="form-control" name="year" placeholder="Year" required>
                </div>
                <div class="form-group">
                    <label for="mon">Month: </label>
                    <input id="mon" type="text" class="form-control" name="mon" placeholder="Month" required>
                </div>
                <div class="form-group">
                    <label for="att">Attendance(in percent): </label>
                    <input id="att" type="file" class="form-control" name="att" placeholder="Attendance" required>
                </div>
                <button type="submit" class="btn btn-lg btn-primary">Submit</button>
            </form>
        </div>
    </div>

    <?php

        // if(!empty($_POST)){
        //     $sid = (int)$_GET['id'];
        //     $sem = (int)test_input($_POST["sem"]);
        //     $year = (int)test_input($_POST["year"]);
        //     $month = test_input($_POST["mon"]);
        //     $attend = (int)test_input($_POST["att"]);

        //     if($attend<75){
        //         send_mail($sid, $sem, $year, $month, $attend);
        //     }
    
        //     $q5 = "insert into attendance values ($sid, $sem, $year, '$month', $attend)";
        //     if(mysqli_query($conn, $q5)){
        //         echo "Added Successfully";
        //         $_SESSION['id']=$sid;
        //         header("Location: student_info.php?id=$sid");
        //     }
    
        //     mysqli_close($conn);
        // }

        $helper = new Sample();

        $id = $_GET['id'];

        $servername="localhost";
        //add below line in every file. It displays error for all sql querries.
        mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
        $conn = mysqli_connect($servername,"root","","dmce_computer") ;

        if (!$conn) {
            die("Connection failed: " . mysqli_connect_error());
        }

        if(!empty($_POST)){

            $inputFileType = 'Xlsx';

            $sem = (int)test_input($_POST["sem"]);
            $year = (int)test_input($_POST["year"]);
            $month = test_input($_POST["mon"]);
            $inputFileName = __DIR__ . '\phpspreadsheet\vendor\phpoffice\phpspreadsheet\samples\Reader\sampleData\college-attend.xlsx';

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
            
            $error_val = 0;

            for( $row = $r+1; $row <= count($sheetData); $row++){
                $val = $sheetData[$row][$c];
                if(strpos($val, ' ') !== false){
                    break;
                }
                if(!is_null($val)){
                    $stud_id = $sheetData[$row][$c];
                    $attendance = $sheetData[$row][$c1];
                    // if($attendance<75){
                    //     send_mail($stud_id, $sem, $year, $month, $attendance);
                    // }
                    $sql = "insert into attendance values ('$stud_id', $sem, $year, '$month', $attendance)";
                    if(mysqli_query($conn, $sql)){
                        // echo "Row inserted successfully <br>";
                    }
                    else{
                        $error_val = 1;
                        break;
                    }
                }
            }
            if($error_val==0){
                echo "Row inserted successfully <br>";
                // header("Location: teacher3.php?id=$id");
            }
        }


        function test_input($data) {
            $data = trim($data);
            $data = stripslashes($data);
            $data = htmlspecialchars($data);
            return $data;
        }

        function send_mail($sid, $sem, $year, $month, $attend){
            
            $mail = new PHPMailer(true);
            global $conn;

            try {
                //Server settings
                // $mail->SMTPDebug = SMTP::DEBUG_SERVER;                      // Enable verbose debug output
                $mail->isSMTP();                                            // Send using SMTP
                $mail->Host       = 'smtp.gmail.com';                    // Set the SMTP server to send through
                $mail->SMTPAuth   = true;                                   // Enable SMTP authentication
                $mail->Username   = 'pratiknaik4799@gmail.com';                     // SMTP username
                $mail->Password   = 'uzumakinaruto@4799';                               // SMTP password
                $mail->SMTPSecure = 'ssl';         // Enable TLS encryption; `PHPMailer::ENCRYPTION_SMTPS` also accepted
                $mail->Port       = 465;           // TCP port to connect to

                $qm = "select Email_id from parent_email where student_id=$sid";
                $query_mail = mysqli_query($conn, $qm);
                $email = mysqli_fetch_assoc($query_mail);
                // echo $email['Email_id'];

                //Recipients
                $mail->setFrom('xyz@naikcorp.com', 'DMCE');
                // $mail->addAddress('joe@example.net', 'Joe User');     // Add a recipient
                $mail->addAddress($email['Email_id']);               // Name is optional
                $mail->addReplyTo('pratiknaik4799@gmail.com', 'Reply');
                // $mail->addCC('cc@example.com');
                // $mail->addBCC('bcc@example.com');

                // Attachments
                // $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
                // $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

                // Content
                $mail->isHTML(true);                                  // Set email format to HTML
                $mail->Subject = 'Complaint for low attendance';
                $mail->Body    = '
                    <p>This is to inform you about the low attendance of your son/ward</p>
                    <h3>Month: '.$month.'</h3>
                    <h3>Attendance: '.$attend.'</h3>
                    <h4>You are requested to meet HOD for the same.</h4>
                ';
                $mail->AltBody = 'This is the body in plain text for non-HTML mail clients';

                $mail->send();
                // echo 'Message has been sent';
            } catch (Exception $e) {
                echo "Message could not be sent. Mailer Error: {$mail->ErrorInfo}";
            }

        }

    ?>
</body>
</html>