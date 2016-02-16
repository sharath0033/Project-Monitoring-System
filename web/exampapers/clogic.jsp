<%  
    response.setHeader("Cache-Control","no-cache");
    response.setHeader("Cache-Control","no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
    session=request.getSession(false); 
    
    if(null != session.getAttribute("htno")){
        String htno = session.getAttribute("htno").toString();
%>
<%@ page language="java" import="java.sql.*"%>

    <%
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","eminem");
            Statement st=cn.createStatement();
            st.executeUpdate("CREATE TABLE IF NOT EXISTS project.canswers (Q_No INT, answer VARCHAR(2), PRIMARY KEY (Q_No), UNIQUE INDEX Q_No_UNIQUE (Q_No ASC))");
            st.executeUpdate("CREATE TABLE IF NOT EXISTS project.resultstudent (Registration_ID VARCHAR(10), Count INT, Subject VARCHAR(20), Grade VARCHAR(2), PRIMARY KEY (Registration_ID), UNIQUE INDEX Registration_ID_UNIQUE (Registration_ID ASC))");
            ResultSet rs=st.executeQuery("SELECT * FROM canswers");
            String a[]=new String[15];
            String b[]=new String[15];
            String grade;
            int i,j,cnt=0;
            for(i=1;i<=10;i++){
		a[i]=(request.getParameter("q"+i));
            }         
            i=1;
            j=0;
            while(rs.next()){
                b[j]=rs.getString(2);
                if(a[i].equals(b[j])){
                    cnt++;
                }
                i++;
                j++;
            }
            if(cnt>=7){ 
                grade="A";
            } 
            else if((cnt<7)&&(cnt>=4)){  
                grade="B";
            }
            else{
                grade="C";  
            }  
            String qry= "INSERT INTO resultstudent VALUES('"+htno+"',"+cnt+",'C-Paper','"+grade+"')";
            if(st.executeUpdate(qry)>0){
                response.sendRedirect("../jsp/examresult.jsp");
            }
            else{
                response.sendRedirect("../jsp/error.jsp");
            }
        }
        catch(Exception e){
            out.println("error at"+e);
        }
}else{
      response.sendRedirect("../jsp/studentloginform.jsp");
}%>`