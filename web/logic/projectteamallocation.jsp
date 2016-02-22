<%-- 
    Document   : facultyregistration
    Created on : 20 Feb, 2016, 1:56:54 AM
    Author     : Emin3M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*"%>
      <%
                String tmno=request.getParameter("tmno");
                String guide=request.getParameter("guide");
                String tml=request.getParameter("tml");
                String mem2=request.getParameter("mem2");
                String mem3=request.getParameter("mem3");
                String mem4=request.getParameter("mem4");
                String remark=request.getParameter("remark");

try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
        String qry="INSERT INTO project.guideregister VALUES ('"+tmno+"','"+guide+"','"+tml+"','"+mem2+"','"+mem3+"','"+mem4+"','"+remark+"')";
        if(st.executeUpdate(qry)>0){ 
            response.sendRedirect("../jsp/projectteamallocationform.jsp");
        }    
    }catch(Exception e){
        out.println(e); 
    }
%>
