<%@ page language="java"  pageEncoding="utf-8"%>
<%
    session.removeAttribute("username");
    session.invalidate();//全部清空
    response.sendRedirect("login.jsp");//重定向

%>
