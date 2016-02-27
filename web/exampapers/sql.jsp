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
                    <tr><th colspan="4">Q1) Which of the following is a logical operator?</th></tr>
                    <tr>
                        <td><input type="radio" name="q1" value="A"> <b>A</b> - !</td><td><input type="radio" name="q1" value="B"> <b>B</b> - &&</td>
                        <td><input type="radio" name="q1" value="C"> <b>C</b> - ||</td><td><input type="radio" name="q1" value="D"> <b>D</b> - All of the above</td>
                    </tr>
                </tbody>    
                <tbody>    
                    <tr><th colspan="4">Q2) How to round-off a value “5.77” to 6.0?</th></tr>
                    <tr>
                        <td><input type="radio" name="q2" value="A"> <b>A</b> - ceil(5.77)</td><td><input type="radio" name="q2" value="B"> <b>B</b> - round-off(5.77)</td>
                        <td><input type="radio" name="q2" value="C"> <b>C</b> - round-up(5.77)</td><td><input type="radio" name="q2" value="D"> <b>D</b> - floor(5.77)</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q3) The type name/reserved word ‘short’ is ___</th></tr>
                    <tr>
                        <td><input type="radio" name="q3" value="A"> <b>A</b> - short long</td><td><input type="radio" name="q3" value="B"> <b>B</b> - short char</td>
                        <td><input type="radio" name="q3" value="C"> <b>C</b> - short float</td><td><input type="radio" name="q3" value="D"> <b>D</b> - short int</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q4) The types of linkages are,</th></tr>
                    <tr>
                        <td><input type="radio" name="q4" value="A"> <b>A</b> - Internal linkage and External linkage</td><td><input type="radio" name="q4" value="B"> <b>B</b> - Internal linkage, External linkage and None linkage</td>
                        <td><input type="radio" name="q4" value="C"> <b>C</b> - Internal linkage and None linkage</td><td><input type="radio" name="q4" value="D"> <b>D</b> - External linkage and None linkage</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q5) Special symbol permitted with in the identifier name.</th></tr>
                    <tr>
                        <td><input type="radio" name="q5" value="A"> <b>A</b> - '$'</td><td><input type="radio" name="q5" value="B"> <b>B</b> - '@'</td>
                        <td><input type="radio" name="q5" value="C"> <b>C</b> - '_'</td><td><input type="radio" name="q5" value="D"> <b>D</b> - '.'</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q6) Linker generates ___ file.</th></tr>
                    <tr>
                        <td><input type="radio" name="q6" value="A"> <b>A</b> - Object code</td><td><input type="radio" name="q6" value="B"> <b>B</b> - Executable code</td>
                        <td><input type="radio" name="q6" value="C"> <b>C</b> - Assembly code</td><td><input type="radio" name="q6" value="D"> <b>D</b> - None of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q7)  Which library function can convert an unsigned long to a string?</th></tr>
                    <tr>
                        <td><input type="radio" name="q7" value="A"> <b>A</b> - ltoa()</td><td><input type="radio" name="q7" value="B"> <b>B</b> - ultoa()</td>
                        <td><input type="radio" name="q7" value="C"> <b>C</b> - system()</td><td><input type="radio" name="q7" value="D"> <b>D</b> - unsigned long can’t be converted to a string</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q8) In the standard library of C programming language, which of the following header file is designed for basic mathematical operations</th></tr>
                    <tr>
                        <td><input type="radio" name="q8" value="A"> <b>A</b> - math.h</td><td><input type="radio" name="q8" value="B"> <b>B</b> - conio.h</td>
                        <td><input type="radio" name="q8" value="C"> <b>C</b> - dos.h</td><td><input type="radio" name="q8" value="D"> <b>D</b> - stdio.h</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q9) What is the built in library function to adjust the allocated dynamic memory size.</th></tr>
                    <tr>
                        <td><input type="radio" name="q9" value="A"> <b>A</b> - malloc</td><td><input type="radio" name="q9" value="B"> <b>B</b> - calloc</td>
                        <td><input type="radio" name="q9" value="C"> <b>C</b> - resize</td><td><input type="radio" name="q9" value="D"> <b>D</b> - realloc</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q10) What is a pointer?</th></tr>
                    <tr>
                        <td><input type="radio" name="q10" value="A"> <b>A</b> - A keyword used to create variables</td><td><input type="radio" name="q10" value="B"> <b>B</b> - A variable used to store address of an instruction</td>
                        <td><input type="radio" name="q10"  value="C"> <b>C</b> - A variable used to store address of other variable</td><td><input type="radio" name="q10" value="D"> <b>D</b> - A variable used to store address of a structure</td>
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
