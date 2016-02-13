<% 
    String htno=request.getParameter("htno");
    session=request.getSession(false);
    session.setAttribute("htno",htno);
    response.sendRedirect("../jsp/catalogstudent.jsp");
%>