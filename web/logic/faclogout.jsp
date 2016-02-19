<%session=request.getSession(false);
    session.invalidate();
    response.sendRedirect("../jsp/facultyloginform.jsp");
%>