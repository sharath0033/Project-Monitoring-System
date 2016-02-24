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
        <title>Student Search Page</title>
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
            li.propic{
                padding: 0px 0px 0px 0px;
            }
            .affix {
                top: 0;
                width: 100%;
            }

            .affix + .container-fluid {
                padding-top: 70px;
            }
            
            .gsc-control-cse .gs-spelling, .gsc-control-cse .gs-result .gs-title, .gsc-control-cse .gs-result .gs-title * {
            font-size: 17px;
            height: 27px;
            }
            .gs-result .gs-title, .gs-result .gs-title * {
            color: #3F62A0;
            }.gsc-result-info {
                text-align: left;
                color: #999;
                font-size: 12px;
                padding-left: 8px;
                margin: 10px 0 10px 0;
            }
            .gs-result .gs-title, .gs-result .gs-title *{
                color: #3083A3;
                text-decoration: none;
                font-family: "bree", Arial, sans-serif;
                line-height: 26px;
            }
            .gs-result a.gs-visibleUrl, .gs-result .gs-visibleUrl {
            color: green!important;
            text-decoration: none;
            padding-bottom: 2px;
            font-style: italic;
            }
            .gsc-table-cell-thumbnail{
            display:none;
            }
            .gs-result .gs-snippet {
                font: 14px/20px "museo-slab","Georgia",sans-serif;
            }
            .gsc-results .gsc-cursor-box .gsc-cursor-page {
                cursor: pointer;
                color: #07AD00;
                text-decoration: none;
                margin-right: 5px;
                display: inline;
                border: 1px solid #DDD;
                padding: 2px 5px 2px 5px;
            }
            .gsc-table-result, .gsc-thumbnail-inside, .gsc-url-top {
                    padding-left: 0px!important;;
                    padding-right: 8px;
            }
            .gsc-webResult.gsc-result {
                    border-bottom: 1px dotted #DDD!important;
                    margin-bottom: 0;
            }
            .cse .gsc-webResult.gsc-result:hover, .gsc-webResult.gsc-result:hover, .gsc-webResult.gsc-result.gsc-promotion:hover, .gsc-results .gsc-imageResult-classic:hover, .gsc-results .gsc-imageResult-column:hover {
                    background: #F7F7F7;
            }
            .gsc-webResult .gsc-result {
                    padding: 20px 10px 20px 10px!important;
            }
            .gsc-input{width: 100%;
                    padding: 0px;
                    border: none;
                    margin: 0px;
                    height: 20px!important;
                    outline: none;
                    background-color: #FFF;
                    float: left!important;
                    margin-top: -8px!important;
                    font-family: sans-serif;
                    font-size: 12px!important;
                    line-height: 20px!important;
            }
            .cse .gsc-search-button input.gsc-search-button-v2, input.gsc-search-button-v2{
                    padding: 6px 27px!important;
                    margin-top: 2px!important;
                    margin-top: -10px!important;
                    width: auto!important;
                    height: auto!important;
            }
            table.gsc-search-box {
                width : 50%!important;
  
            }
            .gsib_a {
            width: 100%;
            padding: 10px 6px 0!important;
            }
        </style>
        <script src="http://www.google.com/jsapi" type="text/javascript"></script><script type="text/javascript"> 
            google.load('search', '1', {language : 'en', style : google.loader.themes.V2_DEFAULT});
            google.setOnLoadCallback(function() {
              var customSearchOptions = {};  var customSearchControl = new google.search.CustomSearchControl(
                '008216404818194287030:voerii_mq04', customSearchOptions);
              customSearchControl.setResultSetSize(google.search.Search.FILTERED_CSE_RESULTSET);
                   customSearchControl.setLinkTarget(google.search.Search.LINK_TARGET_SELF);
              customSearchControl.draw('cse');
              customSearchControl.execute('');
                  function parseParamsFromUrl() {
                var params = {};
                var parts = window.location.search.substr(1).split('\x26');
                for (var i = 0; i < parts.length; i++) {
                  var keyValuePair = parts[i].split('=');
                  var key = decodeURIComponent(keyValuePair[0]);
                  params[key] = keyValuePair[1] ?
                      decodeURIComponent(keyValuePair[1].replace(/\+/g, ' ')) :
                      keyValuePair[1];
                }
                return params;
              }

              var urlParams = parseParamsFromUrl();
              var queryParamName = "q";
              if (urlParams[queryParamName]) {
                customSearchControl.execute(urlParams[queryParamName]);
              }
            }, true);
          </script>
    </head>
   

    <body>

        <div class="header">
            <a href="../index.html"><img class="slidelogo" src="../images/logo.png" alt="Logo" width="500" height="80"></a>
        </div>
        
        <nav class="navbar navbar-inverse" data-spy="affix" data-offset-top="50">
            <div class="container-fluid">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="../jsp/catalogstudent.jsp"><span class="glyphicon glyphicon-search"></span> Search</a></li>
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
                    <li class="propic"></li>
                    <li class="propic"><a href="../jsp/studentinfo.jsp" style="padding:0px 15px 0px 0px;"><img src="../images/dps/1.png" class="img-circle" alt="Sharath" width="50" height="50"> <%=htno%></a></li>
                    <li><a href="../logic/logout.jsp"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
                </ul>
            </div>
         </nav>
                    
                    
        <div class="container-fluid slide" >
            
            <div class="hed">
                <h2>Search Project's Online</h2>
            </div>
            
            <div class="top-search">
                <div id="cse" style="width: auto;"><span style="text-align:center"><span class="glyphicon glyphicon-hourglass"></span> Loading please wait... / <span class="glyphicon glyphicon-alert"></span> Please check your Internet connection and try reloading page.</span></div>
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
                out.println("error is"+e);
        }
}else{
      response.sendRedirect("../jsp/studentloginform.jsp");
}%>`