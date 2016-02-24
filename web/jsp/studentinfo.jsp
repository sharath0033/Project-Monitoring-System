<%  response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    
    session=request.getSession(false); 
    
    if(null != session.getAttribute("htno")){
        String htno = session.getAttribute("htno").toString();
        try
         {
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
                    <%Statement st=cn.createStatement();
                      ResultSet rs=st.executeQuery("SELECT * FROM projectregister WHERE Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"'");
                      if(rs.next()){%>
                            <li><a href="../jsp/guideinfo.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide</a></li>
                    <%}
                        rs.close();
                        st.close();
                      Statement st1=cn.createStatement();
                      ResultSet rs1=st1.executeQuery("SELECT Registration_ID FROM resultstudent WHERE Registration_ID='"+htno+"'");
                      if(rs1.next()){%>
                            <li><a href="../jsp/examresult.jsp"><span class="glyphicon glyphicon-list-alt"></span> Exam Result</a></li>
                    <%}
                        else{%> 
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-pencil"></span> Take Exam
                                <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                  <li><a href="../exampapers/c.jsp">C Paper</a></li>
                                  <li><a href="#">Java Paper</a></li>
                                  <li><a href="#">SQL Paper</a></li> 
                                  <li><a href="#">HTML Paper</a></li>
                                </ul>
                            </li>
                      <%}
                          rs1.close();
                          st1.close();
                        Statement st2=cn.createStatement();
                        ResultSet rs2=st2.executeQuery("SELECT * FROM projectregister WHERE Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"'");
                        if(rs2.next()){%>
                            <li><a href="../jsp/projectinfo.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Info</a></li>
                      <%}%>
                            <li><a href="../jsp/seniorprojects.jsp"><span class="glyphicon glyphicon-list-alt"></span> Senior's Project's</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="../jsp/studentinfo.jsp"><span class="glyphicon glyphicon-user"></span> <%=htno%></a></li>
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
        
         <div class="containerfluid  slide">
            
            <div class="hed">
                <h2 style="margin-bottom:10px"><a href="#" style="padding:0px 0px 0px 0px;" data-toggle="modal" data-target="#myModal"><img src="../images/dps/1.png" class="img-circle" alt="Sharath" width="70" height="70"></a> User Profile</h2>
            </div>
            
            <div class="bck col-sm-5 col-sm-offset-4">   
            <table class="table table-hover table-borderless">
                <tbody>
                    <%
                        Statement st3=cn.createStatement();
                    ResultSet rs3=st3.executeQuery("SELECT * FROM register WHERE Registration_ID='"+htno+"'");
                    while(rs3.next()){
                    %>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-education"></span> - Registered ID :</b></td>
                        <td><%=rs3.getString(1)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b>✎ - First Name :</b></td>
                        <td><%=rs3.getString(2)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b>✎ - Last Name :</b></td>
                        <td><%=rs3.getString(3)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b>🎂 - Date Of Birth :</b></td>
                        <td><div><%=rs3.getString(4)%></div></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-user"></span> - Gender:</b></td>
                        <td><%=rs3.getString(5)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-tree-deciduous"></span> - Branch :</b></td>
                        <td><%=rs3.getString(6)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-calendar"></span> - Year :</b></td>
                        <td><%=rs3.getString(7)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-earphone"></span> - Phone No :</b></td>
                        <td><%=rs3.getString(8)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-home"></span> - Address :</b></td>
                        <td><%=rs3.getString(9)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-envelope"></span> - Email ID :</b></td>
                        <td><%=rs3.getString(10)%></td>
                    </tr> 
                </tbody>
            </table>
        </div>
         </div>
    </body>
    
    <footer class="footer">
            <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved.</p>		
    </footer>
    
    <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h3 class="modal-title">Update Profile Picture</h3>
        </div>
          
        <div class="modal-body">
            <div class="box"> 
                <form class="form-horizontal" method="post" id="proform" action="../logic/projectsubmissionform.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <div class="col-sm-12">
                        <img src="../images/dps/1.png" class="img-circle" alt="Sharath" width="70" height="70">
                        <label class="btn btn-primary" for="my-file-selector">
                            <input id="my-file-selector" type="file">
                            Select Image
                        </label>
                    </div>
                </div>
      </div>
          <div class="form-group modal-footer">      
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary">Update</button>
                    </div>
                </div>
            </form>
      </div>
    </div>
    
        <script src="../js/plugins/jquery.min.js"></script>
        <script src="../js/plugins/jquery.validate.min.js"></script>
        <script src="../js/validation/stureg.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script> 
    <%
        }  
    }
        catch(Exception e){
                out.println("error is"+e);
        }
    %>
</html>
<%}else{
      response.sendRedirect("../jsp/studentloginform.jsp");
}%>`
