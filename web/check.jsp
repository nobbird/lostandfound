<%@ page contentType="text/html;charset=utf-8" language="java" %>
<%
    String username=(String)session.getAttribute("username");
    if(username==null){
        out.print("<script>alert('必须登录才能访问');location.href='login.jsp';</script>");
    }else{
        out.print("欢迎"+username+"访问！");
    }
%>
