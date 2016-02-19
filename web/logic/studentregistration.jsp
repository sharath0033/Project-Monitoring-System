<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" import="java.sql.*"%>
      <%

                String htno=request.getParameter("htno");
                String fname=request.getParameter("fname");
                String lname=request.getParameter("lname");
                String dob=request.getParameter("dob");
                String gender=request.getParameter("gender");
                String branch=request.getParameter("branch");
                String year=request.getParameter("year");
                String phone=request.getParameter("phone");
                String address=request.getParameter("address");
                String emailid=request.getParameter("emailid");
                String password=request.getParameter("password");

try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
                String qry="INSERT INTO project.register VALUES ('"+htno+"','"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+branch+"','"+year+"','"+phone+"','"+address+"','"+emailid+"','"+password+"')";
                if(st.executeUpdate(qry)>0)
                    { 
                    session=request.getSession(false);
                    session.setAttribute("htno",htno);
                    response.sendRedirect("../jsp/catalogstudent.jsp"); 
                   }
    }catch(Exception e){
        out.println(e);                 
    }
%>

