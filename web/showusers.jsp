<%@page import="dao.UserDao"%>
<%@ page contentType="text/html; charset=utf-8" import="java.util.*,entity.Users" %>
<%@ page import="dao.impl.UserDaoImpl" %>

<table width="50%" border="1" align="center">
    <tr>
        <td>序号</td>
        <td>用户名</td>
        <td>密码</td>
        <td>学号</td>
        <td>手机号</td>
        <td>邮箱</td>
    </tr>
    <%
        UserDaoImpl uDao = new UserDaoImpl();
        ArrayList list =uDao.getList();
        for(int i=0;i<list.size();i++ ){
            Users u =(Users)list.get(i);
    %>
    <tr>
        <td><%=u.getId() %></td>
        <td><%=u.getUsername() %></td>
        <td><%=u.getUserpass() %></td>
        <td><%=u.getUsernumb() %></td>
        <td><%=u.getUsertel()%></td>
        <td><%=u.getUseremail()%></td>
    </tr>
    <%
        }
    %>
</table>
