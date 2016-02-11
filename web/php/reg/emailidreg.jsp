<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.io.*"%>
 <%
                String emailid=request.getParameter("emailid");
                
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
         ResultSet rs=st.executeQuery("SELECT Email_ID FROM register WHERE Email_ID='"+emailid+"'");
            if(rs.next()){ 
                out.print(false);
            }
            else{
                out.print(true);
            }
      %>
