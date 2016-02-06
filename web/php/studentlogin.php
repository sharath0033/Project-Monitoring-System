<?php

$con = mysqli_connect("jdbc:mysql://localhost:3306/project","root","eminem","project");
if (!$con) {
   die("Could not connect: " . mysqli_connect_error());
}
$htno = $_GET['htno'];
$sql="SELECT * FROM register WHERE Registration_ID = '".$htno."'";
$result = mysqli_query($con,$sql);

if (mysqli_num_rows($result) > 0)
    {
        echo "true";  //good to register
    }
    else
    {
        echo "false"; //already registered
    }

mysqli_close($con);
?>