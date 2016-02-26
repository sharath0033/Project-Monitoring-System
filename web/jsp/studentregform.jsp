<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/common.css">
        <title>Student Registration Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            body{
                background-image: url("../images/bcgr.jpg");
                background-size: 100% 100%;
                background-repeat: no-repeat;
                background-attachment: fixed;
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

        <div class="header">
            <a href="../index.html"><img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80"></a>
        </div>
        
        <div class="container slide">
            
            <div class="hed col-sm-4 col-sm-offset-4">
                <h2>Student Registration</h2>
            </div>
            
            
                <div class="bck col-sm-4 col-sm-offset-4">
                <form class="form-horizontal" method="post" id="sturegform" action="../logic/studentregistration.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="htno" maxlength="10" id="htno" placeholder="Enter HallTicket No">
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="fname" placeholder="First Name">
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="lname" placeholder="Last Name">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="date" class="form-control" name="dob" placeholder="Date Of Birth">
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <select class="form-control" name="gender">
                            <option value="">Select Gender</option>
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
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
                    <div class="col-sm-12">
                        <select class="form-control" name="year">
                            <option value="">Select Year of Study</option>
                            <option value="3rd">IIIrd Year</option>
                            <option value="4th">IVth Year</option>
                        </select>
                    </div>
                </div>
              
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" maxlength="10" class="form-control" name="phone" id="phone" placeholder="Enter Mobile No">
                    </div>
                </div>
              
                <div class="form-group">
                    <div class="col-sm-12">
                        <textarea type="text" class="form-control" rows="4" name="address" placeholder="Enter Address"></textarea>
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="email" class="form-control" name="emailid" id="emailid" placeholder="Enter Email ID">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">          
                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter password">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">          
                        <input type="password" class="form-control" name="rtpassword" placeholder="Retype password">
                    </div>
                </div>
                
                <div class="form-group">      
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary">Submit</button>
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
