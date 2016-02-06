<%-- 
    Document   : studentregistrationform
    Created on : 18 Jan, 2016, 3:00:11 PM
    Author     : Emin3M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <title>Student Registration Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
    <style>
            body{
                font: 400 15px Lato, sans-serif;
            }

            #header{
                color:#fff;
                height:80px;
                background-color: #f4511e;
                position: relative
            }
            
            .container{
                text-align: center;
                padding: 10px;
            }
            
            .error{
                color: red;
            }

            footer {
                background-color: #555;
                text-align: center;
                font-size: 15px;
                color: white;
                padding: 10px;
                position: relative;
                bottom: 0;
            }

            .slidelogo {
                  animation-name: slidelogo;
                  -webkit-animation-name: slidelogo;	
                  animation-duration: 1.5s;	
                  -webkit-animation-duration: 1.5s;
                  visibility: visible;			
              }
              @keyframes slidelogo{
                0% {
                  opacity: 0;
                  -webkit-transform: translateX(10%);
                } 
                100% {
                  opacity: 1;
                  -webkit-transform: translateX(0%);
                }	
              }
              @-webkit-keyframes slidelogo {
                0% {
                  opacity: 0;
                  -webkit-transform: translateX(10%);
                } 
                100% {
                  opacity: 1;
                  -webkit-transform: translateX(0%);
                }
              }
        </style>
    </head>
    <body>
        <% 
            try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
                Statement st=cn.createStatement();
                st.executeUpdate("CREATE TABLE IF NOT EXISTS project.register (  Registration_ID VARCHAR(10),  First_Name VARCHAR(30),  Last_Name VARCHAR(30),  DOB VARCHAR(10),  Gender VARCHAR(6),  Branch VARCHAR(5),  Year VARCHAR(8),  Mobile_No VARCHAR(10),  Address VARCHAR(80),  Email_ID VARCHAR(40),  Password VARCHAR(20),  PRIMARY KEY (Registration_ID),  UNIQUE INDEX Registration_ID_UNIQUE (Registration_ID ASC),  UNIQUE INDEX Email_ID_UNIQUE (Email_ID ASC),  UNIQUE INDEX Mobile_No_UNIQUE (Mobile_No ASC))");
            }
            catch(Exception e){
                out.println("Exception e"+e);  
            }
        %>

        <div class="container-fluid" id="header">
            <a href="menu-toggle"><img id="menu-toggle" src="../images/logo.png" class="slidelogo" alt="Logo" width="500" height="80"></a>
        </div>
        
        <div class="container">
            <div><h1 style="text-align:center;"><u>Student Registration Form</u></h1></div>
            <h3><marquee><i>Fill in the Details to Register</i></marquee></h3>
            <form class="form-horizontal" method="post" id="form" action="../logic/studentregistration.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">HallTicket No :</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="htno" maxlength="10" id="htno" placeholder="">
                    </div>
                </div>
                <div id="result" style="color:red">error</div>
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">First Name :</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="fname" placeholder="">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Last Name :</label>
                    <div class="col-sm-3">
                        <input type="text" class="form-control" name="lname" placeholder="">
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Date Of Birth :</label>
                    <div class="col-sm-3">
                        <input type="date" class="form-control" name="dob">
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Gender :</label>
                    <div class="col-sm-1">
                        <input type="radio" name="gender" value="Male"> Male
                    </div>
                    <div class="col-sm-1">
                        <input type="radio" name="gender" value="Female"> Female
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Department :</label>
                    <div class="col-sm-3">
                        <select class="form-control" name="branch">
                            <option value="">Select Department</option>
                            <option value="CSE">Computer Science & Engg</option>
                            <option value="ECE">Electronics & Communication Engg</option>
                            <option value="EEE">Electrical & Electronics Engg</option>
                            <option value="MECH">Mechanical Engg</option>
                        </select>
                    </div>
                </div>
              
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Year of Study:</label>
                    <div class="col-sm-3">
                        <select class="form-control" name="year">
                            <option value="">Select Year</option>
                            <option value="3rd">IIIrd Year</option>
                            <option value="4th">IVth Year</option>
                        </select>
                    </div>
                </div>
              
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Mobile No :</label>
                    <div class="col-sm-3">
                        <input type="text" maxlength="10" class="form-control" name="phone" placeholder="">
                    </div>
                </div>
              
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Address :</label>
                    <div class="col-sm-3">
                        <textarea type="text" class="form-control" rows="4" name="address" placeholder=""></textarea>
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Email ID :</label>
                    <div class="col-sm-3">
                        <input type="email" class="form-control" name="emailid" placeholder="">
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Password:</label>
                    <div class="col-sm-3">          
                        <input type="password" class="form-control" name="password" placeholder="Enter password">
                    </div>
                </div>
               
                <div class="form-group">
                    <label class="control-label col-sm-offset-3 col-sm-2">Confirm Password:</label>
                    <div class="col-sm-3">          
                        <input type="password" class="form-control" name="rtpassword" placeholder="Retype password">
                    </div>
                </div>
                
                <div class="form-group">      
                    <div class="col-sm-offset-5 col-sm-1">
                        <input type="reset" class="btn btn-default">
                    </div>
                    <div class="col-sm-offset-1 col-sm-1">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
          </div>
        
            
        <footer class="container-fluid">
            <div id="footer">
                <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved.</p>
            </div>
        </footer>
        <script src="../js/jquery.min.js"></script>
        <script src="../js/jquery.validate.min.js"></script>
        <script>
            $(function(){
                
                $.validator.setDefaults({
                    errorClass: 'help-block',
                    highlight: function(element) {
                        $(element)
                        .closest('.form-group')
                        .addClass('has-error');
                    },
                    unhighlight: function(element) {
                        $(element)
                        .closest('.form-group')
                        .removeClass('has-error');
                    },
                });
  
                $("#form").validate({
                    rules: {
                        htno: {
                            required: true,
                            minlength: 10,
                            remote:  '../php/studentlogin.php' 
                        },
                        fname: {
                            required: true,
                        },
                        lname: {
                            required: true
                        },
                        dob: {
                            required: true
                        },
                        branch: {
                            required: true
                        },
                        year: {
                            required: true
                        },
                        phone: {
                            required: true,
                            digits: true
                        },
                        address: {
                            required: true
                        },
                        emailid: {
                            required: true,
                            email: true
                        },
                        password: {
                            required: true,
                            minlength: 4,
                            maxlength: 12
                        },
                    },
                    messages: {
                        htno: {
                            required: "HallTicket No is mandatory",
                            minlength: "Invalid HallTicket No",
                            remote: "Aleady exists"
                        },
                        fname: {
                            required: "This field should not be empty"
                        },
                        lname: {
                            required: "This field should not be empty"
                        },
                        dob: {
                            required: "HallTicket No is mandatory"
                        },
                        branch: {
                            required: "Please select Department"
                        },
                        year: {
                            required: "Please select Year of Study"
                        },
                        phone: {
                            required: "Please enter your Mobile No",
                            digits: "Invalid Mobile No"
                        },
                        address: {
                            required: "This field should not be empty"
                        },
                        emailid: {
                            required: "Please enter your Email ID",
                            email: "Invalid Email ID"
                        },
                        password: {
                            required: "Please enter a Password",
                            minlength: "Password must be greater than 4 characters",
                            maxlength: "Password must be less than 13 characters"
                        },
                    }
                });
            });
       </script>
        <script src="../js/bootstrap.min.js"></script>  
    </body>
</html>
