<%-- 
    Document   : facultyregistration
    Created on : 20 Feb, 2016, 1:56:54 AM
    Author     : Emin3M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*"%>
      <%
                String gtno=request.getParameter("gtno");
                String fname=request.getParameter("fname");
                String lname=request.getParameter("lname");
                String special=request.getParameter("special");
                String phone=request.getParameter("phone");
                String emailid=request.getParameter("emailid");

try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
        String qry="INSERT INTO project.guideregister VALUES ('"+gtno+"','"+fname+"','"+lname+"','"+special+"','"+phone+"','"+emailid+"')";
        if(st.executeUpdate(qry)>0){ 
            response.sendRedirect("../jsp/catalogfaculty.jsp");
        }    
    }catch(Exception e){
        out.println(e); 
    }
%>
