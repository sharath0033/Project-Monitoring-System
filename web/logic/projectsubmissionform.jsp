<%@ page language="java" import="java.sql.*"%>
<% 
    try{        
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
            Statement st=cn.createStatement();
            String htno=session.getAttribute("htno").toString();
            String ptitle=request.getParameter("ptitle").toString();
            String fend=request.getParameter("fend").toString();
            String bend=request.getParameter("bend").toString();
            String desc=request.getParameter("desc").toString();
            String qry="UPDATE project.projectregister SET Project_Title='"+ptitle+"', Front_End='"+fend+"', Back_End='"+bend+"', Description='"+desc+"' WHERE Team_Leader='"+htno+"';";
            if(st.executeUpdate(qry)>0){
                response.sendRedirect("../jsp/projectinfo.jsp");
            }
    }catch(Exception e){
        out.println("error is"+e);
    }
%>