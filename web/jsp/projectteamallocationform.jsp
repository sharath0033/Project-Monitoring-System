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
        <title>Team Allocation Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            body{
                background-image: url("../images/bpta.jpg");
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
                    -webkit-transform: translateY(70%);
                } 
                100% {
                    opacity: 1;
                    -webkit-transform: translateY(0%);
                }	
            }
            @-webkit-keyframes slide {
                0% {
                    opacity: 0;
                    -webkit-transform: translateY(70%);
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
                    <li><a href="../jsp/catalogfaculty.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide Registration</a></li>
                    <li class="active"><a href="../jsp/projectteamallocationform.jsp"><span class="glyphicon glyphicon-wrench"></span> Project Team Allocation</a></li>
                    <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-copy"></span> View Reports
                                <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                  <li style="padding:5px"><a href="../reports/internalguide.jsp"><span class="glyphicon glyphicon-briefcase"></span> Internal Guide Registration Report</a></li>
                                  <li style="padding:5px"><a href="../reports/studentreg.jsp"><span class="glyphicon glyphicon-education"></span> Student Registration Report</a></li>
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
                    
                    
        <div class="container slide" >
            <div class="hed col-sm-4 col-sm-offset-4">
                <h2>Project Team Allocation</h2>
            </div>
            
            
                <div class="bck col-sm-4 col-sm-offset-4">
                <form class="form-horizontal" method="post" id="teamallocform" action="../logic/projectteamallocation.jsp" role="form" novalidate="novalidate">
                <div class="form-group">
                    <div class="col-sm-12">
                        <%Statement st=cn.createStatement();
                        ResultSet rs=st.executeQuery("SELECT COUNT(*) FROM projectregister");
                        while(rs.next()){
                        int id=Integer.parseInt(rs.getString(1));
                        id++;%>
                        <input type="text" style="font-weight:bold" class="form-control" name="tmno" maxlength="10" id="htno" value="<%=id%>-2016" readonly>
                        <%}%>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <select name="guide" class="form-control">
                            <option value="">Select Internal Guide</option>
                                <%Statement st1=cn.createStatement();
                                ResultSet rs1=st1.executeQuery("SELECT Guide_ID FROM guideregister");
                                while(rs1.next()){
                                    String temp=rs1.getString(1);
                                    Statement st6=cn.createStatement();
                                    ResultSet rs6=st6.executeQuery("SELECT COUNT(*) FROM projectregister WHERE Internal_Guide='"+temp+"'");
                                    while(rs6.next()){
                                       int count=Integer.parseInt(rs6.getString(1));
                                       if(count<2){%>
                                        <option value="<%=rs1.getString(1)%>"><%=rs1.getString(1)%></option>   
                                       <%}
                                    }
                                    rs6.close();
                                    st6.close();
                                }
                                rs1.close();
                                st1.close();%>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <select name="tml" class="form-control">
                            <option value="">Select Team Leader</option>
                                <%Statement st2=cn.createStatement();
                                ResultSet rs2=st2.executeQuery("SELECT Registration_ID FROM resultstudent WHERE Grade='A'");
                                while(rs2.next()){
                                    String temp=rs2.getString(1);
                                    Statement st7=cn.createStatement();
                                    ResultSet rs7=st7.executeQuery("SELECT COUNT(*) FROM projectregister WHERE Team_Leader='"+temp+"'");
                                    while(rs7.next()){
                                       int count=Integer.parseInt(rs7.getString(1));
                                       if(count<1){%> 
                                        <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
                                      <%}
                                    }
                                }%>
                        </select>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-12">
                        <select name="mem2" class="form-control">
                            <option value="">Select B group Member</option>
                                <%Statement st3=cn.createStatement();
                                ResultSet rs3=st3.executeQuery("SELECT Registration_ID FROM resultstudent WHERE Grade='B'");
                                while(rs3.next()){
                                    String temp=rs3.getString(1);
                                    Statement st8=cn.createStatement();
                                    ResultSet rs8=st8.executeQuery("SELECT COUNT(*) FROM projectregister WHERE Member_2='"+temp+"'");
                                    while(rs8.next()){
                                       int count=Integer.parseInt(rs8.getString(1));
                                       if(count<1){%> 
                                        <option value="<%=rs3.getString(1)%>"><%=rs3.getString(1)%></option>
                                      <%}
                                    }
                                }%>
                        </select>
                    </div>
                </div>  
                        
                <div class="form-group">
                    <div class="col-sm-12">
                        <select name="mem3" class="form-control">
                            <option value="">Select C group Member</option>
                                <%Statement st4=cn.createStatement();
                                ResultSet rs4=st4.executeQuery("SELECT Registration_ID FROM resultstudent WHERE Grade='C'");
                                while(rs4.next()){
                                    String temp=rs4.getString(1);
                                    Statement st9=cn.createStatement();
                                    ResultSet rs9=st9.executeQuery("SELECT COUNT(*) FROM projectregister WHERE Member_3='"+temp+"' OR Member_4='"+temp+"'");
                                    while(rs9.next()){
                                       int count=Integer.parseInt(rs9.getString(1));
                                       if(count<1){%> 
                                        <option value="<%=rs4.getString(1)%>"><%=rs4.getString(1)%></option>
                                      <%}
                                    }
                                }%>
                        </select>
                    </div>
                </div>        
                        
                <div class="form-group">
                    <div class="col-sm-12">
                        <select name="mem4" class="form-control">
                            <option value="">Select Optional Member</option>
                                <%Statement st5=cn.createStatement();
                                ResultSet rs5=st5.executeQuery("SELECT Registration_ID FROM resultstudent WHERE Grade='C'");
                                while(rs5.next()){
                                    String temp=rs5.getString(1);
                                    Statement st10=cn.createStatement();
                                    ResultSet rs10=st10.executeQuery("SELECT COUNT(*) FROM projectregister WHERE Member_3='"+temp+"' OR Member_4='"+temp+"'");
                                    while(rs10.next()){
                                       int count=Integer.parseInt(rs10.getString(1));
                                       if(count<1){%> 
                                        <option value="<%=rs5.getString(1)%>"><%=rs5.getString(1)%></option>
                                      <%}
                                    }
                                }%>
                        </select>
                    </div>
                </div>        
                        
                <div class="form-group">
                    <div class="col-sm-12">
                        <input type="text" class="form-control" name="remark" placeholder="Enter Remarks">
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