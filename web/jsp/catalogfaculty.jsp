<%  response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    
    session=request.getSession(false); 
    
    if(null != session.getAttribute("uid")){
        String uid = session.getAttribute("uid").toString();
        try{
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/navcommon.css">
        <title>Faculty Registration Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            body{
                background-image: url("../images/bcgfr.jpg");
                background-size: 100% 120%;
                background-repeat: no-repeat;
                background-attachment: fixed;
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
            .hed{
                color: white;
                background-color: rgba(32,32,32,0.85);
                padding: 15px 0px 10px 0px;
            }
            .bck{
                background-color:white;
                padding: 30px 30px 0px 30px;
            }
            .container{
                text-align: center;
                padding: 10px 0px 20px 0px;
            }
            @keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(0%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }	
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(0%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }
            }
            .affix {
                top: 0;
                width: 100%;
            }

            .affix + .container-fluid {
                padding-top: 70px;
            }
        </style>
    </head>
   

    <body>

        <div class="header">
            <a href="../index.html"><img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80"></a>
        </div>
        
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="50">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="../jsp/catalogstudent.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide Registration</a></li>
                    <li><a href="../jsp/guideinfo.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Team Allocation</a></li>
                    <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-copy"></span> View Reports
                                <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                  <li style="padding:5px"><a href="../exampapers/c.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide Registration Report</a></li>
                                  <li style="padding:5px"><a href="#"><span class="glyphicon glyphicon-education"></span> Student Registration Report</a></li>
                                  <li style="padding:5px"><a href="#"><span class="glyphicon glyphicon-pencil"></span> Student Exam Report</a></li> 
                                  <li style="padding:5px"><a href="#"><span class="glyphicon glyphicon-wrench"></span> Project Team Allocation Report</a></li>
                                </ul>
                            </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <%=uid%></a></li>
                    <li><a href="../logic/faclogout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
                    
                    
        <div class="container slide" >
            <div class="hed col-sm-4 col-sm-offset-4">
                <h2>Internal Guide Registration</h2>
            </div>
            
            
                <div class="bck col-sm-4 col-sm-offset-4">
                <form class="form-horizontal" method="post" id="facregform" action="../logic/facultyregistration.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <div class="col-sm-12">
                        <%Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM guideregister");
                        while(rs.next()){
                        int id=Integer.parseInt(rs.getString(1));
                        id++;%>
                        <input type="text" style="font-weight:bold" class="form-control" name="gtno" maxlength="10" id="htno" value="CSE-<%=id%>" readonly>
                        <%}%>
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
                        <input type="text" class="form-control" name="special" placeholder="Specialization">
                    </div>
                </div>
              
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" maxlength="10" class="form-control" name="phone" id="phone" placeholder="Enter Mobile No">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="email" class="form-control" name="emailid" id="emailid" placeholder="Enter Email ID">
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
<%}
            catch(Exception e){
                out.println("Exception e"+e);  
            }
        
}else{
      response.sendRedirect("../jsp/facultyloginform.jsp");
}%>`