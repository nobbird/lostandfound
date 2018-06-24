<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/6/2
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page import="entity.Users" %>
<%
    request.setCharacterEncoding("utf-8");
    String username=request.getParameter("username");
    String userpass=request.getParameter("userpass");
    UserDaoImpl uDao = new UserDaoImpl();
    Users user = uDao.login(username, userpass);
    if(user!=null){
        session.setAttribute("username", username);
        session.setAttribute("user", user);

// 为自动登录服务，先用Cookie保存用户名密码
        Cookie cookie1 = new Cookie("uname",URLEncoder.encode(username, "UTF-8"));
        Cookie cookie2 = new Cookie("upass",URLEncoder.encode(userpass, "UTF-8"));
        response.addCookie(cookie1);
        response.addCookie(cookie2);

session.setMaxInactiveInterval(200);//生命周期
        out.print("<script>alert('登录成功！');location.href='userindex.jsp';</script>");
    }else{
        out.print("<script>alert('登录失败！');location.href='login.jsp';</script>");
    }

%>
