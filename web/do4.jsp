<%@ page language="java" import="dao.*,java.sql.*" pageEncoding="utf-8"%>

<%
    request.setCharacterEncoding("utf-8");
    String ids =request.getParameter("quanxuan");
    out.print(ids);
    UserDao uDao = new UserDao();
    int  b = uDao.deleteByIds(ids);
    if(b>0){
        out.print("<script>alert('批量删除"+b+"条成功！');location.href='userindex.jsp';</script>");
    }else{
        out.print("<script>alert('批量删除失败	！');location.href='userindex.jsp'</script>");
    }

%>
