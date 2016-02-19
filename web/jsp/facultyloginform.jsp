
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/common.css">
        <title>Professor Login Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            body{
                background-image: url("../images/bcgf.jpg");
                background-size: 100% 180%;
                background-repeat: no-repeat;
            }
            h2{
                font-weight: bold;
            }
            #header{
                color:#fff;
                height:80px;
                background-color: #f4511e;
                position: relative
            }
            .hed{
                color: white;
                background-color: rgba(32,32,32,0.85);
                padding: 20px 0px 20px 0px;
            }
            .bck{
                background-color:white;
                padding: 30px 30px 20px 30px;
            }
            .container{
                text-align: center;
                padding: 40px 0px 20px 0px;
            }
            .footer{
                position: fixed;
                width: 100%;
            }
            .slide {
                animation-name: slide;
                -webkit-animation-name: slide;	
                animation-duration: 1s;	
                -webkit-animation-duration: 1s;
                visibility: visible;			
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(40%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }	
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(40%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
        </style>
    </head>
    <body>

        <div class="header">
            <a href="../index.html"><img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80"></a>
        </div>
        
        <div class="container  slide">
            
            <div class="hed col-sm-4 col-sm-offset-4">
                <h2>Professor Login</h2>
            </div>
            
            <div class="bck col-sm-4 col-sm-offset-4">
            <form class="form-horizontal" method="post" id="facloginform" action="../logic/facultylogin.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="username" maxlength="10" id="htno" placeholder="Enter Username">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">          
                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
                    </div>
                </div>

                <div class="form-group">      
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary">Sign In</button>
                    </div>
                </div>
                
            </form>
            </div>
          </div>
        
            
        <footer class="footer">
            <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved.</p>		
        </footer>
        <script src="../js/plugins/jquery.min.js"></script>
        <script src="../js/plugins/jquery.validate.min.js"></script>
        <script src="../js/validation/stureg.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script>  
    </body>
</html>