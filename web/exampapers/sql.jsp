<%  response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session=request.getSession(false); 
    
    if(null != session.getAttribute("htno")){
        String htno = session.getAttribute("htno").toString();
        Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
            Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT Registration_ID FROM resultstudent WHERE Registration_ID='"+htno+"'");
            if(rs.next()){
                response.sendRedirect("../jsp/catalogstudent.jsp");
            }
                else{          
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
        <title>SQL Exam Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            .footer{
                position: fixed;
                width: 100%;
            }
            .help-block {
                color: #FF0000;
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
            <img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80">
        </div>
        
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="50">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <%Statement st1=cn.createStatement();
                        ResultSet rs1=st1.executeQuery("SELECT Profile_Pic FROM register WHERE Registration_ID='"+htno+"'");
                        if(rs1.next()){;%>
                        <li><a href="#" style="padding:0px 15px 0px 0px;"><img src="../images/profiles/<%=rs1.getString(1)%>" class="img-circle" alt="Sharath" width="50" height="50"> <%=htno%></a></li>
                        <%}%>
                    <li><a href="#"><span class="glyphicon glyphicon-open-file"></span> SQL Paper</a></li>
                </ul>
            </div>
         </nav>
        
         <div class="containerfluid  slide">
            
            <div class="hed">
                <h2>SQL - Exam Paper</h2>
            </div>
            
            <div style="margin: 0px 30px 0px 30px">
            <form id="cform" action="../exampapers/sqllogic.jsp" role="form" novalidate="novalidate">    
            <table class="table table-borderless">
                <tbody style="padding-bottom:30px">
                    <tr><th colspan="4">Q1) Which of the following code will remove all the rows from the table LOCATIONS?</th></tr>
                    <tr>
                        <td><input type="radio" name="q1" value="A"> <b>A</b> - DROP TABLE locations;</td><td><input type="radio" name="q1" value="B"> <b>B</b> - DELETE TABLE locations;</td>
                        <td><input type="radio" name="q1" value="C"> <b>C</b> - TRUNCATE TABLE locations;</td><td><input type="radio" name="q1" value="D"> <b>D</b> - None of the above.</td>
                    </tr>
                </tbody>    
                <tbody>    
                    <tr><th colspan="4">Q2) A subquery can be placed in which of the SQL clauses?</th></tr>
                    <tr>
                        <td><input type="radio" name="q2" value="A"> <b>A</b> - The WHERE clause</td><td><input type="radio" name="q2" value="B"> <b>B</b> - The HAVING clause)</td>
                        <td><input type="radio" name="q2" value="C"> <b>C</b> - The FROM clause</td><td><input type="radio" name="q2" value="D"> <b>D</b> - All of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q3) Which of the following functions can be used on both numeric as well as non-numeric data?</th></tr>
                    <tr>
                        <td><input type="radio" name="q3" value="A"> <b>A</b> - COUNT</td><td><input type="radio" name="q3" value="B"> <b>B</b> - AVG</td>
                        <td><input type="radio" name="q3" value="C"> <b>C</b> - STDDEV</td><td><input type="radio" name="q3" value="D"> <b>D</b> - VARIANCE</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q4) What is returned by TRUNC(789.8389, 2)?</th></tr>
                    <tr>
                        <td><input type="radio" name="q4" value="A"> <b>A</b> - 789.84</td><td><input type="radio" name="q4" value="B"> <b>B</b> - 789.83</td>
                        <td><input type="radio" name="q4" value="C"> <b>C</b> - 78</td><td><input type="radio" name="q4" value="D"> <b>D</b> - 789.00</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q5) Which of the following is not a group function?</th></tr>
                    <tr>
                        <td><input type="radio" name="q5" value="A"> <b>A</b> - SUM</td><td><input type="radio" name="q5" value="B"> <b>B</b> - NVL</td>
                        <td><input type="radio" name="q5" value="C"> <b>C</b> - COUNT</td><td><input type="radio" name="q5" value="D"> <b>D</b> - MIN</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q6) In which of the following cases a DML statement is not executed?</th></tr>
                    <tr>
                        <td><input type="radio" name="q6" value="A"> <b>A</b> - When existing rows are modified</td><td><input type="radio" name="q6" value="B"> <b>B</b> - When some rows are deleted</td>
                        <td><input type="radio" name="q6" value="C"> <b>C</b> - When a table is deleted</td><td><input type="radio" name="q6" value="D"> <b>D</b> - All of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q7) What is returned by SUBSTR(‘TUTORIALS POINT’, 1, 9)?</th></tr>
                    <tr>
                        <td><input type="radio" name="q7" value="A"> <b>A</b> - TUTORIAL</td><td><input type="radio" name="q7" value="B"> <b>B</b> - UTORIALS</td>
                        <td><input type="radio" name="q7" value="C"> <b>C</b> - POINT</td><td><input type="radio" name="q7" value="D"> <b>D</b> - TUTORIALS</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q8) Which of the following is not true about the ON clause?</th></tr>
                    <tr>
                        <td><input type="radio" name="q8" value="A"> <b>A</b> - ON clause is used to specify conditions or specify columns to join.</td><td><input type="radio" name="q8" value="B"> <b>B</b> - ON clause makes the query easy to understand.</td>
                        <td><input type="radio" name="q8" value="C"> <b>C</b> - ON clause does not allow three way joins.</td><td><input type="radio" name="q8" value="D"> <b>D</b> - None of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q9) What is returned by MOD(1000,30)?</th></tr>
                    <tr>
                        <td><input type="radio" name="q9" value="A"> <b>A</b> - 10</td><td><input type="radio" name="q9" value="B"> <b>B</b> - 33</td>
                        <td><input type="radio" name="q9" value="C"> <b>C</b> - 3</td><td><input type="radio" name="q9" value="D"> <b>D</b> - 30</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q10) A database administrator can</th></tr>
                    <tr>
                        <td><input type="radio" name="q10" value="A"> <b>A</b> - Create users.</td><td><input type="radio" name="q10" value="B"> <b>B</b> - Create privileges.</td>
                        <td><input type="radio" name="q10"  value="C"> <b>C</b> - Grant privileges.</td><td><input type="radio" name="q10" value="D"> <b>D</b> - All of the above.</td>
                    </tr>
                </tbody>
            </table>
                <div style="text-align:center">
                <input type='submit' class='btn btn-primary' value='Submit'>
                </div>>
            </form>    
            </div>
        </div>
    </body>
    
    <footer class="footer">
            <p>Copyright © 2016 by Avanthi Inst of Engg & Tech. All Rights Reserved.</p>		
    </footer>
        
    <script src="../js/plugins/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('#memberModal').modal('show');
            });
        </script>
        <div class="modal fade" id="memberModal" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-sm">
                <div class="modal-content">
                    <div class="modal-header">
                         <h4 class="modal-title" id="memberModalLabel">Instructions (Read Carefully)</h4>

                    </div>
                    <div class="modal-body">
                        <ul>
                            <li>Answer all the questions.</li>
                            <li>Each question carries 1 mark.</li>
                            <li>Time limit is 10 minutes.</li>
                            <li>There is no negative marking.</li>
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-dismiss="modal">Okay</button>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="../js/plugins/jquery.validate.min.js"></script>
        <script src="../js/validation/stureg.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script> 
        
</html>
<%}
}else{
      response.sendRedirect("../jsp/studentloginform.jsp");
}%>`
