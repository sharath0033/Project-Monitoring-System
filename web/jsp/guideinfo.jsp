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
        <title>Internal Guide Information Page</title>
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
                        <li class="active"><a href="#"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide</a></li>
                        <li><a href="../jsp/examresult.jsp"><span class="glyphicon glyphicon-list-alt"></span> Exam Result</a></li>
                        <li><a href="../jsp/projectinfo.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Info</a></li>
                        <li><a href="../jsp/seniorprojects.jsp"><span class="glyphicon glyphicon-list-alt"></span> Senior's Project's</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%Statement st2=cn.createStatement();
                        ResultSet rs2=st2.executeQuery("SELECT Profile_Pic FROM register WHERE Registration_ID='"+htno+"'");
                        if(rs2.next()){;%>
                        <li><a href="../jsp/studentinfo.jsp" style="padding:0px 15px 0px 0px;"><img src="../images/profiles/<%=rs2.getString(1)%>" class="img-circle" alt="Sharath" width="50" height="50"> <%=htno%></a></li>
                        <%}%>
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
        
         <div class="container-fluid  slide">
            
            <div class="hed">
                <h2>Internal Guide Information</h2>
            </div>
            <%  Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("SELECT * FROM projectregister WHERE Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"'");
                
                String qry[]=new String[5];
                while(rs.next()){
                   qry[0]=rs.getString(2);
                }
                Statement st1=cn.createStatement();
                ResultSet rs1=st1.executeQuery("SELECT * FROM guideregister WHERE Guide_ID='"+qry[0]+"'");
                while(rs1.next()){
            %>
            <div class="bck col-sm-6 col-sm-offset-3">   
            <table class="table table-hover table-borderless">
                <tbody>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-briefcase"></span> - Guide ID :</b></td>
                        <td><%=rs1.getString(1)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b>✎ - First Name :</b></td>
                        <td><%=rs1.getString(2)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b>✎ - Last Name :</b></td>
                        <td><%=rs1.getString(3)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-tag"></span> - Specialization :</b></td>
                        <td><%=rs1.getString(4)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-earphone"></span> - Phone No :</b></td>
                        <td><%=rs1.getString(5)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-envelope"></span> - Email ID :</b></td>
                        <td><a href="mailto:<%=rs1.getString(6)%>"><%=rs1.getString(6)%></a></td>
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
