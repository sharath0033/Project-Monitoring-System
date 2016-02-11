<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.io.*"%>
 <%
                String htno=request.getParameter("htno");
              
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
           ResultSet rs=st.executeQuery("SELECT Registration_ID FROM register WHERE Registration_ID='"+htno+"'");
            if(rs.next()){ 
                out.print(true);
            }
            else{
                out.print(false);
            }
      %>
