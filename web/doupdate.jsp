<%@ page language="java" import="entity.*,dao.*,java.sql.*" pageEncoding="utf-8"%>

<%
    request.setCharacterEncoding("utf-8");
    Users u = new Users();
    u.setId(Integer.parseInt(request.getParameter("id")));
    u.setUsernumb(request.getParameter("unumb"));
    u.setUsertel(request.getParameter("tel"));
    u.setUsername(request.getParameter("uname"));
    u.setUserpass(request.getParameter("upass"));
    u.setUseremail(request.getParameter("email"));
    UserDao dao = new UserDao();
    int i = dao.updateUsersById(u);
    if(i>0){
        out.print("<script>alert('修改成功！');location.href='update.jsp?id="+request.getParameter("id")+"';</script>");
    }else{
        out.print("<script>alert('修改失败	！');location.href='userindex.jsp'</script>");
    }

%>
