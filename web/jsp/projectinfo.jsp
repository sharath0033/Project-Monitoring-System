<%  response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    
    session=request.getSession(false); 
    
    if(null != session.getAttribute("htno")){
        String htno = session.getAttribute("htno").toString();
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
        <title>Student Profile Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
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
            }
            .table-borderless tbody tr td, .table-borderless tbody tr th, .table-borderless thead tr th {
                border: none;
                height: 10px;
            }
            .leftstuff{
                float: right;
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
                    <li><a href="../jsp/catalogstudent.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>
                    <li><a href="../jsp/guideinfo.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide</a></li>
                    <li><a href="../jsp/examresult.jsp"><span class="glyphicon glyphicon-list-alt"></span> Exam Result</a></li>
                    <li  class="active"><a href="../jsp/projectinfo.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Info</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../jsp/studentinfo.jsp"><span class="glyphicon glyphicon-user"></span> <%=htno%></a></li>
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
        
         <div class="container-fluid  slide">
            
            <div class="hed">
                <h2>Student Profile</h2>
            </div>
            
            <div class="bck col-sm-4 col-sm-offset-4"> 
        <%  Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM projectregister WHERE Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"'");
            while(rs.next()){
        %>
            <table class="table table-hover table-borderless">
                <tbody>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-eye-open"></span> - Team No :</b></td>
                        <td><%=rs.getString(1)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-briefcase"></span> - Internal Guide :</b></td>
                        <td><a href="../jsp/guideinfo.jsp"><%=rs.getString(2)%></a></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-queen"></span> - Team Leader :</b></td>
                        <td><%=rs.getString(3)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-user"></span> - Member 2 :</b></td>
                        <td><%=rs.getString(4)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-user"></span> - Member 3 :</b></td>
                        <td><%=rs.getString(5)%></td>
                    </tr>
                    <tr>
                    <%  Statement st1=cn.createStatement();
                        ResultSet rs1=st1.executeQuery("SELECT Member_4 FROM projectregister WHERE Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"' AND Project_Title!=''");
                        if(rs1.next()){
                    %>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-user"></span> - Member 4 :</b></td>
                        <td><%=rs.getString(6)%></td>
                    <%}%>    
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-copy"></span> - Remarks :</b></td>
                        <td><%=rs.getString(10)%></td>
                    </tr> 
                </tbody>
            </table>
            </div>
         </div>
    </body>
    
    <footer class="footer">
            <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved.</p>		
        </footer>
        <script src="../js/plugins/jquery.min.js"></script>
        <script src="../js/plugins/jquery.validate.min.js"></script>
        <script src="../js/validation/stureg.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script> 
</html>
<%}
    }
        catch(Exception e){
                out.println("error is"+e);
        }
}else{
      response.sendRedirect("../jsp/studentloginform.jsp");
}%>`