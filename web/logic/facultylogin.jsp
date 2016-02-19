<% 
    try{
        String uid=request.getParameter("username");
        String pwd=request.getParameter("password");
        if(uid.equals("sharath")&&pwd.equals("chandra"))
        {
            session=request.getSession(false);
            session.setAttribute("uid","Sharath");
            response.sendRedirect("../jsp/catalogfaculty.jsp");
        }
        else
        {
            response.sendRedirect("../jsp/facultyloginform.jsp");
        }
    }
    catch(Exception e){
            out.println("exception is"+e);
    }
%>
