<%@ page import="dao.BaseDao" %>
<%@ page import="java.sql.*" %>
<%@ page import="sun.font.Script" %>
<%@ page import="entity.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    request.setCharacterEncoding("utf-8");
    String flag=request.getParameter("lof");
    String title=request.getParameter("title");
    String types=request.getParameter("wutype");
    String content=request.getParameter("content");
    String losttime=request.getParameter("losttime");
    String state=null;

    if ("0".equals(flag))
        state="0";
    else
        state="2";

    Users user = (Users) request.getSession().getAttribute("user");

    String sql=" insert into wuping (userId,flag,title,content,types,losttime,state)values(?,?,?,?,?,?,?) ";
    BaseDao dao = new BaseDao();
    Connection conn=dao.getConnection();//获取数据库的链接
    PreparedStatement ps= null;
    try {
        ps = conn.prepareStatement(sql);
    } catch (SQLException e) {
        e.printStackTrace();
    }
//    System.out.println(username);
    ps.setInt(1, user.getId());
    ps.setString(2,flag);
    ps.setString(3, title);
    ps.setString(4, content);
    ps.setString(5, types);
    ps.setString(6, losttime);
    ps.setString(7, state);
    try {
        ps.execute();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
<%
    out.print("<script>alert('发布成功！');location.href='lostinfo.jsp';</script>");
%>