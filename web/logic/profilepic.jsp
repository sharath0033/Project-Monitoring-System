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
                File savedFile = new File("C:/Users/Emin3M/Documents/NetBeansProjects/Project Monitoring System/web/images/profiles/"+itemName);
                item.write(savedFile);
                Statement st=cn.createStatement();
                ResultSet rs=st.executeQuery("SELECT Profile_Pic FROM register WHERE Registration_ID='"+htno+"'");
                while(rs.next()){
                    String delete=rs.getString(1);
                    if(!delete.equals("default.png")){
                        File filedelete= new File("C:/Users/Emin3M/Documents/NetBeansProjects/Project Monitoring System/web/images/profiles/"+delete);
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
    </head>
    <body>
        <h1>Updating your pic...</h1>
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
