<%
 if (session.getAttribute("semail") != null) {
        session.removeAttribute("semail");
        response.sendRedirect("user.jsp");
        return;
    } else {
        response.sendRedirect("user.jsp");
        return;
    }
%>