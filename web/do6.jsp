<%@ page import="dao.BaseDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="sun.font.Script" %>
<%@ page import="entity.Users" %>
<%@ page import="static java.lang.Integer.parseInt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    int tid = Integer.parseInt(request.getParameter("tid"));
    String reason=request.getParameter("reason");
    String content=request.getParameter("content");
    String flag="0";

    Users user = (Users) request.getSession().getAttribute("user");

    String sql=" insert into found (tid,userId,flag,reason,content)values(?,?,?,?,?) ";
    BaseDao dao = new BaseDao();
    Connection conn=dao.getConnection();//获取数据库的链接
    PreparedStatement ps= null;
    try {
        ps = conn.prepareStatement(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
//    System.out.println(username);
    ps.setInt(1, tid);
    ps.setInt(2,user.getId());
    ps.setString(3, flag);
    ps.setString(4, reason);
    ps.setString(5, content);
    try {
        ps.execute();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<%
    out.print("<script>alert('发布成功！');location.href='lostinfo.jsp';</script>");
%>