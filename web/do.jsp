<%@ page import="dao.BaseDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="sun.font.Script" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    String username=request.getParameter("username");
    String userpass=request.getParameter("userpass");
    String usernumb=request.getParameter("usernumb");
    String usertel=request.getParameter("usertel");
    String useremail=request.getParameter("useremail");


    String sql=" insert into users (username,userpass,usernumb,usertel,useremail)values(?,?,?,?,?) ";
    BaseDao dao = new BaseDao();
    Connection conn=dao.getConnection();//获取数据库的链接
    PreparedStatement ps= null;
    try {
        ps = conn.prepareStatement(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
    System.out.println(username);
    ps.setString(1, username);
    ps.setString(2, userpass);
    ps.setString(3, usernumb);
    ps.setString(4, usertel);
    ps.setString(5,useremail);
    ps.execute();
%>
<%
    out.print("<script>alert('注册成功！');location.href='login.jsp';</script>");
%>
