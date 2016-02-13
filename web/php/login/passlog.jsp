<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.io.*"%>
 <%
                
              
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        String htno=request.getParameter("htno");
        String password=request.getParameter("password");
        Statement st=cn.createStatement();
        ResultSet rs=st.executeQuery("SELECT * FROM register WHERE Registration_ID='"+htno+"' AND Password='"+password+"'");
        if(rs.next())
            {    
                out.print(true);
            }
        else
            {
                out.print(false);
            }
      %>
