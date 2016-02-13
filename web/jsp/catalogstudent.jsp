<%  response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    
    session=request.getSession(false); 
    
    if(null != session.getAttribute("htno")){
        String htno = session.getAttribute("htno").toString();
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/common.css">
        <title>Student Login Page</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    
        <style>
            h2{
                font-weight: bold;
            }
            #header{
                color:#fff;
                height:80px;
                background-color: #f4511e;
                position: relative
            }
            .hed{
                color: black;
            }
            #container{
                text-align: center;
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
   

    <body>

        <div class="header">
            <a href="../index.html"><img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80"></a>
        </div>
        
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="50">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-user"></span> <%=htno%></a>
                </div>
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#">Home</a></li>
                    <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Page 1 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">Page 1-1</a></li>
                            <li><a href="#">Page 1-2</a></li>
                            <li><a href="#">Page 1-3</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Page 2</a></li>
                    <li><a href="#">Page 3</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
        
        <div class="container  slide" >
            
            <div class="hed" id="container">
                <h2>Student Login</h2>
            </div>
            
            <div class="top-search">
            <form class="form-inline" method="get" id="searchform" id="searchbox_008216404818194287030:voerii_mq04" action="../html/search-result.html" role="form">
                <input value="008216404818194287030:voerii_mq04" name="cx" type="hidden"/>
                <input value="FORID:11" name="cof" type="hidden"/>
                    <div class="form-group col-sm-offset-5">
                        <div class="col-sm-8">
                            <input type="text" class="form-control"  name="s" id="s" onfocus="defaultInput(this)" onblur="clearInput(this)" placeholder="Search...."/>
                        </div>  
                    </div>
                    
                    <div class="form-group">
                        <div class="col-sm-1">
                            <input type="submit" class="btn-primary" value="Search"/>
                        </div>
                    </div>
            </form>
            </div>
        </div>
        
        <div class="container-fluid" style="height:1000px">
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
  <h1>Some text to enable scrolling</h1>
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
<%}else{
      response.sendRedirect("../index.html");
}%>`