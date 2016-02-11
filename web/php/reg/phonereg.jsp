<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*"%>
<%@ page language="java" import="java.io.*"%>
 <%
                String phone=request.getParameter("phone");

        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
            ResultSet rs=st.executeQuery("SELECT Mobile_No FROM register WHERE Mobile_No='"+phone+"'");
            if(rs.next()){ 
                out.print(false);
            }
            else{
                out.print(true);
            }
      %>
