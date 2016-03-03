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
        <title>HTML Exam Page</title>
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
            <img class="mlogo slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80">
        </div>
        
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="50">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <%Statement st1=cn.createStatement();
                        ResultSet rs1=st1.executeQuery("SELECT Profile_Pic FROM register WHERE Registration_ID='"+htno+"'");
                        if(rs1.next()){;%>
                        <li><a href="#" style="padding:0px 15px 0px 0px;"><img src="../images/profiles/<%=rs1.getString(1)%>" class="img-circle" alt="Sharath" width="50" height="50"> <%=htno%></a></li>
                        <%}%>
                    <li><a href="#"><span class="glyphicon glyphicon-open-file"></span> HTML Paper</a></li>
                </ul>
            </div>
         </nav>
        
         <div class="containerfluid  slide">
            
            <div class="hed">
                <h2>HTML - Exam Paper</h2>
            </div>
            
            <div style="margin: 0px 30px 0px 30px">
            <form id="cform" action="../exampapers/htmllogic.jsp" role="form" novalidate="novalidate">    
            <table class="table table-borderless">
                <tbody style="padding-bottom:30px">
                    <tr><th colspan="4">Q1) Which of the following input control accepts only numerical value in Web Form 2.0?</th></tr>
                    <tr>
                        <td><input type="radio" name="q1" value="A"> <b>A</b> - week</td><td><input type="radio" name="q1" value="B"> <b>B</b> - time</td>
                        <td><input type="radio" name="q1" value="C"> <b>C</b> - number</td><td><input type="radio" name="q1" value="D"> <b>D</b> - range</td>
                    </tr>
                </tbody>    
                <tbody>    
                    <tr><th colspan="4">Q2) Which of the following attribute triggers events when a form gets user input?</th></tr>
                    <tr>
                        <td><input type="radio" name="q2" value="A"> <b>A</b> - onchange</td><td><input type="radio" name="q2" value="B"> <b>B</b> - onedit</td>
                        <td><input type="radio" name="q2" value="C"> <b>C</b> - onformchange</td><td><input type="radio" name="q2" value="D"> <b>D</b> - onforminput</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q3) Which of the following browser supports HTML5 in its latest version?</th></tr>
                    <tr>
                        <td><input type="radio" name="q3" value="A"> <b>A</b> - Mozilla Firefox</td><td><input type="radio" name="q3" value="B"> <b>B</b> - Opera</td>
                        <td><input type="radio" name="q3" value="C"> <b>C</b> - Both of the above.</td><td><input type="radio" name="q3" value="D"> <b>D</b> - None of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q4) Which of the following attribute triggers event when the window loses focus?</th></tr>
                    <tr>
                        <td><input type="radio" name="q4" value="A"> <b>A</b> - onblur</td><td><input type="radio" name="q4" value="B"> <b>B</b> - onlostfocus</td>
                        <td><input type="radio" name="q4" value="C"> <b>C</b> - onbeforeload</td><td><input type="radio" name="q4" value="D"> <b>D</b> - lostfocus</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q5) Which of the following attribute triggers an abort event?</th></tr>
                    <tr>
                        <td><input type="radio" name="q5" value="A"> <b>A</b> - offline</td><td><input type="radio" name="q5" value="B"> <b>B</b> - onabort</td>
                        <td><input type="radio" name="q5" value="C"> <b>C</b> - abort</td><td><input type="radio" name="q5" value="D"> <b>D</b> - onbeforeonload</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q6) How can we resize the image?</th></tr>
                    <tr>
                        <td><input type="radio" name="q6" value="A"> <b>A</b> - Using height and width attribute</td><td><input type="radio" name="q6" value="B"> <b>B</b> - Using height attribute</td>
                        <td><input type="radio" name="q6" value="C"> <b>C</b> - Using width attribute</td><td><input type="radio" name="q6" value="D"> <b>D</b> - Using size attribute</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q7) What is the difference between XML and HTML?</th></tr>
                    <tr>
                        <td><input type="radio" name="q7" value="A"> <b>A</b> - HTML is used for exchanging data, XML is not.</td><td><input type="radio" name="q7" value="B"> <b>B</b> - XML is used for exchanging data, HTML is not.</td>
                        <td><input type="radio" name="q7" value="C"> <b>C</b> - HTML can have user defined tags, XML cannot</td><td><input type="radio" name="q7" value="D"> <b>D</b> - None of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q8) A webpage displays a picture. What tag was used to display that picture?</th></tr>
                    <tr>
                        <td><input type="radio" name="q8" value="A"> <b>A</b> - picture</td><td><input type="radio" name="q8" value="B"> <b>B</b> - image</td>
                        <td><input type="radio" name="q8" value="C"> <b>C</b> - img</td><td><input type="radio" name="q8" value="D"> <b>D</b> - src</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q9) Which attribute is used to name an element uniquely?</th></tr>
                    <tr>
                        <td><input type="radio" name="q9" value="A"> <b>A</b> - id</td><td><input type="radio" name="q9" value="B"> <b>B</b> - dot</td>
                        <td><input type="radio" name="q9" value="C"> <b>C</b> - class</td><td><input type="radio" name="q9" value="D"> <b>D</b> - None of the above.</td>
                    </tr>
                </tbody>
                <tbody>
                    <tr><th colspan="4">Q10) To create HTML document you require a</th></tr>
                    <tr>
                        <td><input type="radio" name="q10" value="A"> <b>A</b> - web page editing software</td><td><input type="radio" name="q10" value="B"> <b>B</b> - Just a notepad can be used</td>
                        <td><input type="radio" name="q10"  value="C"> <b>C</b> - High powered computer</td><td><input type="radio" name="q10" value="D"> <b>D</b> - None of the above.</td>
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
