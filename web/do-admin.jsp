<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="dao.*" %>
<%@ page import="dao.impl.AdminDaoImpl" %>
<%@ page import="entity.Admin" %>
<%
    request.setCharacterEncoding("utf-8");
    String adminname=request.getParameter("adminname");
    String adminpass=request.getParameter("adminpass");
    AdminDaoImpl adminDao = new AdminDaoImpl();
    Admin admin = adminDao.login(adminname, adminpass);
    if(admin!=null){
        session.setAttribute("adminname", adminname);
        session.setAttribute("admin", admin);

// 为自动登录服务，先用Cookie保存用户名密码
        Cookie cookie1 = new Cookie("adminname",URLEncoder.encode(adminname, "UTF-8"));
        Cookie cookie2 = new Cookie("adminpass",URLEncoder.encode(adminpass, "UTF-8"));
        response.addCookie(cookie1);
        response.addCookie(cookie2);

        session.setMaxInactiveInterval(200);//生命周期
        out.print("<script>alert('登录成功！');location.href='adminIndex.jsp';</script>");
    }else{
        out.print("<script>alert('登录失败！');location.href='admin.jsp';</script>");
    }

%>