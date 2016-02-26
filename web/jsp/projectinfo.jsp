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
            .modal-header{
                background-color: #f4511e;
            }
            .modal-title{
                font-weight:bold;
                color: white;
            }
            .box{
                padding:20px 20px 0px 20px;
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
                    <li  class="active"><a href="#"><span class="glyphicon glyphicon-wrench"></span> Project Info</a></li>
                    <li><a href="../jsp/seniorprojects.jsp"><span class="glyphicon glyphicon-list-alt"></span> Senior's Project's</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <%Statement st3=cn.createStatement();
                        ResultSet rs3=st3.executeQuery("SELECT Profile_Pic FROM register WHERE Registration_ID='"+htno+"'");
                        if(rs3.next()){;%>
                        <li><a href="../jsp/studentinfo.jsp" style="padding:0px 15px 0px 0px;"><img src="../images/profiles/<%=rs3.getString(1)%>" class="img-circle" alt="Sharath" width="50" height="50"> <%=htno%></a></li>
                        <%}%>
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
        
         <div class="container-fluid  slide">
            
            <div class="hed">
                <h2>Project Team Information</h2>
            </div>
            
             <div class="bck col-sm-6 col-lg-offset-3"> 
        <%  Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT * FROM projectregister WHERE Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"'");
            while(rs.next()){
        %>
            <table class="table table-hover table-borderless">
                <tbody>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-eye-open"></span> - Team No : &nbsp;&nbsp;</b> <%=rs.getString(1)%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-briefcase"></span> - Internal Guide : &nbsp;&nbsp;</b> <a href="../jsp/guideinfo.jsp"><%=rs.getString(2)%></a></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-queen"></span> - Team Leader : &nbsp;&nbsp;</b> <a href="../jsp/memberinfo.jsp?mem=<%=rs.getString(3)%>"><%=rs.getString(3)%></a></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-user"></span> - Member 2 : &nbsp;&nbsp;</b> <a href="../jsp/memberinfo.jsp?mem=<%=rs.getString(4)%>"><%=rs.getString(4)%></a></td>                  
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-user"></span> - Member 3 : &nbsp;&nbsp;</b> <a href="../jsp/memberinfo.jsp?mem=<%=rs.getString(5)%>"><%=rs.getString(5)%></a></td>
                    </tr>
                    <tr>
                    <%  Statement st1=cn.createStatement();
                        ResultSet rs1=st1.executeQuery("SELECT Member_4 FROM projectregister WHERE (Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"') AND Member_4 IS NOT NULL");
                        if(rs1.next()){
                    %>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-user"></span> - Member 4 : &nbsp;&nbsp;</b> <a href="../jsp/memberinfo.jsp?mem=<%=rs.getString(6)%>"><%=rs.getString(6)%></a></td>
                        <td></td>
                    <%}%>    
                    </tr>
                    
                    <%  
                        Statement st2=cn.createStatement();
                        ResultSet rs2=st2.executeQuery("SELECT * FROM projectregister WHERE (Team_Leader='"+htno+"' OR Member_2='"+htno+"' OR Member_3='"+htno+"' OR Member_4='"+htno+"') AND Project_Title IS NOT NULL");
                        if(rs2.next()){
                    %>
  
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-text-size"></span> - Project Title :</b></td></tr>
                    <tr><td colspan="2" style="text-align:center"><%=rs.getString(7)%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-blackboard"></span> - Front End :</b></td></tr>
                    <tr><td colspan="2" style="text-align:center"><%=rs.getString(8)%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-hdd"></span> - Back End :</b></td></tr>
                    <tr><td colspan="2" style="text-align:center"><%=rs.getString(9)%></td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align:center"><b><span class="glyphicon glyphicon-pencil"></span> - Description :</b></td></tr>
                    <tr><td colspan="2" style="text-align:center"><%=rs.getString(10)%></td>
                    </tr>
                    <tr>
                        <td class="leftstuff"><b><span class="glyphicon glyphicon-copy"></span> - Remarks :</b></td>
                        <td style="color:red"><marquee><%=rs.getString(11)%></marquee></td>
                    </tr>
                    <%}
                        else if(rs.getString(3).equals(htno)){%>
                        <tr>
                            <td colspan="2" style="text-align:center"><button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Project Information</button></td>
                        </tr>
                        <tr>
                            <td class="leftstuff"><b><span class="glyphicon glyphicon-copy"></span> - Remarks :</b></td>
                            <td style="color:red"><marquee><%=rs.getString(11)%></marquee></td>
                        </tr>
                        <%}
                        else{%>
                        <tr><td colspan="2" style="text-align:center">Project information is not submitted yet. Please contact your team Leader.</td></tr>
                            <tr>
                            <td class="leftstuff"><b><span class="glyphicon glyphicon-copy"></span> - Remarks :</b></td>
                            <td style="color:red"><marquee><%=rs.getString(11)%></marquee></td>
                            </tr>
                    <%}%> 
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
          <h3 class="modal-title">Project Information Form</h3>
        </div>
          
        <div class="modal-body">
            <div class="box"> 
                <form class="form-horizontal" method="post" id="proform" action="../logic/projectsubmissionform.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="ptitle" id="ptitle" placeholder="Enter Project Title">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">          
                        <input type="text" class="form-control" name="fend" id="fend" placeholder="Project FrontEnd">
                    </div>
                </div>
              
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="bend" id="bend" placeholder="Project BackEnd">
                    </div>
                </div>
               
                <div class="form-group">
                    <div class="col-sm-12">          
                        <textarea type="text" class="form-control" name="desc" id="desc" placeholder="Enter Project brief overview" rows="4"></textarea>
                    </div>
                </div>
            </div>
      </div>
          <div class="form-group modal-footer">      
                    <div class="col-sm-12">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                    </form>
      </div>
    </div>
    </div>
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
