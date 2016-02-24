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
                            <li class="active"><a href="../jsp/seniorprojects.jsp"><span class="glyphicon glyphicon-list-alt"></span> Senior's Project's</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../jsp/studentinfo.jsp"><span class="glyphicon glyphicon-user"></span> <%=htno%></a></li>
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
                    
                    
        <div id="container" class="container slide" >
            <div class="hed">
                <h2>Senior's Main Project List</h2>
            </div>
            <table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
        <thead>
            <tr>
                <th>Batch No</th>
                <th>Roll No's</th>
                <th>Name's</th>
                <th>Project Title</th>
                <th>Internal Guide</th>
                <th>Domain</th>
                <th>Organization</th>
            </tr>
        </thead>
        <tbody>
        <%Statement st3=cn.createStatement();
        ResultSet rs3=st3.executeQuery("SELECT * FROM projectregister ");
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
            </tr>
         <%}%>   
        </tbody>
    </table>
   </div>
        
        <footer class="footer">
            <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved. <a href="#myPage" title="To Top"><span class="glyphicon glyphicon-chevron-up"></span></a></p>		
        </footer>
        <script src="../js/plugins/jquery.min.js"></script>
        <script src="../js/plugins/jquery.dataTables.min.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script>
        <script src="../js/plugins/dataTables.bootstrap.min.js"></script>
        <script src="../js/slidecode.js"></script>
        <script>
            $(document).ready(function() {
            $('#example').DataTable();
            } );   
        </script>
    </body>
</html>
<%}
    catch(Exception e){
        out.println("Exception e"+e);  
    }
        
}else{
      response.sendRedirect("../jsp/studentloginform.jsp");
}%>