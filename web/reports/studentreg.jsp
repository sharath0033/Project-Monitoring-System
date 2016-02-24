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
        <link rel="stylesheet" href="../css/dataTables.bootstrap.min.css">
        <link rel="stylesheet" href="../css/navcommon.css">
        <title>Team Allocation Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            .footer{
                position: fixed;
                width: 100%;
            }
            .container{
                padding:10px 10px 10px 10px;
                width: 99%;
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
   

    <body id="myPage">

        <div class="header">
            <a href="../index.html"><img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80"></a>
        </div>
        
        <nav class="navbar navbar-inverse">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li><a href="../jsp/catalogfaculty.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide Registration</a></li>
                    <li><a href="../jsp/projectteamallocationform.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Team Allocation</a></li>
                    <li class="dropdown active">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-copy"></span> View Reports
                                <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                  <li style="padding:5px"><a href="../reports/internalguide.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide Registration Report</a></li>
                                  <li class="active" style="padding:5px"><a href="../reports/studentreg.jsp"><span class="glyphicon glyphicon-education"></span> Student Registration Report</a></li>
                                  <li style="padding:5px"><a href="../reports/studentresult.jsp"><span class="glyphicon glyphicon-pencil"></span> Student Exam Report</a></li> 
                                  <li style="padding:5px"><a href="../reports/projectteam.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Team Allocation Report</a></li>
                                  <li style="padding:5px"><a href="../reports/passedoutprojects.jsp"><span class="glyphicon glyphicon-calendar"></span> PassedOut Batch Project Report</a></li>
                                </ul>
                            </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Welcome <%=uid%></a></li>
                    <li><a href="../logic/faclogout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
                    
                    
        <div id="container" class="container slide" >
            <div class="hed">
                <h2>Student Registration Report</h2>
            </div>
            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Registration ID</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>DOB</th>
                <th>Gender</th>
                <th>Branch</th>
                <th>Year</th>
                <th>Mobile No</th>
                <th>Address</th>
                <th>Email ID</th>
                <th>Password</th>    
            </tr>
        </thead>
        <tbody>
        <%Statement st3=cn.createStatement();
        ResultSet rs3=st3.executeQuery("SELECT * FROM register ");
        while(rs3.next())
        {%>
            <tr>
                <td><%=rs3.getString(1)%></td>
                <td><%=rs3.getString(2)%></td>
                <td><%=rs3.getString(3)%></td>
                <td><%=rs3.getString(4)%></td>
                <td><%=rs3.getString(5)%></td>
                <td><%=rs3.getString(6)%></td>
                <td><%=rs3.getString(7)%></td>
                <td><%=rs3.getString(8)%></td>
                <td><%=rs3.getString(9)%></td>
                <td><%=rs3.getString(10)%></td>
                <td><%=rs3.getString(11)%></td>
            </tr>
         <%}%>   
        </tbody>
    </table>
   </div>              
                    
        <div style="text-align:center;padding-bottom: 70px"><button id='printbtn' class="btn btn-info slide">Print Table</button></div>
        
        <footer class="footer">
            <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved. <a href="#myPage" title="To Top"><span class="glyphicon glyphicon-chevron-up"></span></a></p>		
        </footer>
        <script src="../js/plugins/jquery.min.js"></script>
        <script src="../js/plugins/jquery.dataTables.min.js"></script>
        <script src="../js/plugins/jquery.validate.min.js"></script>
        <script src="../js/plugins/printThis.js"></script>
        <script src="../js/validation/stureg.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script>
        <script src="../js/plugins/dataTables.bootstrap.min.js"></script>
        <script src="../js/slidecode.js"></script>
        <script>
            $(document).ready(function() {
            $('#example').DataTable();
            $('#printbtn').click(function () {
				$('#example').printThis();
			});
            } );
            
            
        </script>
    </body>
</html>
<%}
    catch(Exception e){
        out.println("Exception e"+e);  
    }
        
}else{
      response.sendRedirect("../jsp/facultyloginform.jsp");
}%>