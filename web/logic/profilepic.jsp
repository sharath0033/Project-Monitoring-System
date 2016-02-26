<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="java.util.*" %>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="java.io.File"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.io.*"%>
 <%
                String htno=session.getAttribute("htno").toString();
                Class.forName("com.mysql.jdbc.Driver");
                Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
                String path="C:/Users/Emin3M/Documents/NetBeansProjects/Project Monitoring System/web/images/profiles/";
                try
                {
                String files="";
                String itemName = "";
                boolean isMultipart = ServletFileUpload.isMultipartContent(request);
                if (!isMultipart)
                {
                }
                else
                {
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                List items = null;
                try
                {
                items = upload.parseRequest(request);
                }
                catch (FileUploadException e)
                {
                e.getMessage();
                }

                Iterator itr = items.iterator();
                while (itr.hasNext())
                {
                FileItem item = (FileItem) itr.next();
                if (item.isFormField())
                {
                String name = item.getFieldName();
                String value = item.getString();
                if(name.equals("files"))
                {
                files=value;
                }

                }
                else
                {
                try
                {
                itemName = item.getName();
                File savedFile = new File(path+itemName);
                item.write(savedFile);
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("SELECT Profile_Pic FROM register WHERE Registration_ID='"+htno+"'");
                while(rs.next()){
                    String delete=rs.getString(1);
                    if(!delete.equals("default.png")){
                        File filedelete= new File(path+delete);
                        filedelete.delete();
                    }    
                }
                }
                catch (Exception e)
                {
                out.println("Error"+e.getMessage());
                }
                }
                }
                try
                {
                Statement st1=cn.createStatement();    
                st1.executeUpdate("UPDATE register SET Profile_Pic='"+itemName+"' WHERE Registration_ID='"+htno+"';");%>
                <html>
    <head>
        <meta http-equiv="refresh" content="2;url=../jsp/studentinfo.jsp" />
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/navcommon.css">
        <title>Profile Pic Redirection</title>
        <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="col-sm-8 col-lg-offset-3">
            <h3 style="text-decoration: none;margin-top: 25%"><b>&nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-user" style="font-size: 30px"></span> &nbsp;&nbsp;Please wait. We are Uploading your Profile Picture.</b></h3>
        <div id="progressTimer" style="width: 70%"></div>
        </div>
        <script src="../js/plugins/jquery.min.js"></script>
        <script src="../js/plugins/bootstrap.min.js"></script> 
        <script src="../js/plugins/jquery.progressTimer.min.js"></script>
        <script>
            $("#progressTimer").progressTimer({
                timeLimit: 1.6,
                baseStyle: 'progress-bar-danger',
                warningStyle: 'progress-bar-warning',
                completeStyle: 'progress-bar-success',
            });
        </script>
    </body>
</html>

<%}
                catch(Exception el)
                {
                out.println("Inserting error"+el.getMessage());
                }
                }
                }
                catch (Exception e){
                out.println(e.getMessage());
                }
%>
