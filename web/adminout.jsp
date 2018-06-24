<%@ page language="java"  pageEncoding="utf-8"%>
<%
    session.removeAttribute("username");
    session.invalidate();//全部清空
    response.sendRedirect("admin.jsp");//重定向

%>
