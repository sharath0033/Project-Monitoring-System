<%-- 
    Document   : studentlogin
    Created on : 18 Jan, 2016, 2:59:46 PM
    Author     : Emin3M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" import="java.sql.*" session="true"%>
<%@ page language="java" import="java.io.*"%>
<html>
    <head>
    <%String uid=request.getParameter("htno");
        if(uid==""){
                out.println("<font color=red>");
                out.println("Please enter your HallTicket No");
                out.println("</font>");
        }else{
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
        Statement st=cn.createStatement();
        st.executeUpdate("CREATE TABLE IF NOT EXISTS project.register (  Registration_ID VARCHAR(10),  First_Name VARCHAR(30),  Last_Name VARCHAR(30),  DOB VARCHAR(10),  Gender VARCHAR(6),  Branch VARCHAR(5),  Year VARCHAR(8),  Mobile_No VARCHAR(10),  Address VARCHAR(80),  Email_ID VARCHAR(40),  Password VARCHAR(20),  PRIMARY KEY (Registration_ID),  UNIQUE INDEX Registration_ID_UNIQUE (Registration_ID ASC),  UNIQUE INDEX Email_ID_UNIQUE (Email_ID ASC),  UNIQUE INDEX Mobile_No_UNIQUE (Mobile_No ASC))");
        ResultSet rs=st.executeQuery("SELECT * FROM register WHERE Registration_ID='"+uid+"'");
            if(rs.next() && uid.length()>0){
                out.println("<font color=green>");
                out.println("Valid Hallticket No");
                out.println("</font>");
            }
            else{
                out.println("<font color=red>");
                out.println("InValid Hallticket No");
                out.println("</font>");
            }
            rs.close();
            st.close();
            /*String pwd=request.getParameter("pass");
            if(pwd==""){
                out.println("<font color=red>");
                out.println("Please enter your Password");
                out.println("</font>");
            }
            else{
                Statement st1=cn.createStatement();
                ResultSet rs1=st1.executeQuery("SELECT * FROM register WHERE Registration_ID='"+uid+"' AND Password='"+pwd+"'");
        
        if(rs1.next())
            {    
                out.println("<font color=green>");
                        out.println("Login Successful");
                        out.println("</font>");                        
            }
        else
            {
                out.println("<font color=red>");
                        out.println("Username and password dosent match");
                        out.println("</font>");
            }
        rs1.close();
        st1.close();
        cn.close();*/

      }
%>
    </head>
</html>
