<%@ page import="dao.UserDao" %>
<%@ page import="entity.Users" %>
<%@ page import="dao.impl.UserDaoImpl" %>
<%@ page language="java"  pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"></head>

<body>
<%@ include file="check.jsp"%>
<%
    request.setCharacterEncoding("utf-8");
    String  id=request.getParameter("id");
    UserDaoImpl userDao = new UserDaoImpl();
    int num = Integer.parseInt(id == null ? "0" : id);
    Users users =userDao.getUsersById(num);
%>
<form action="doupdate.jsp" method="post">
    <input type="hidden" value="<%=id%>" name="id">
    <table width="50%" border="1" align="center">
        <tr>
            <td>用户名</td>
            <td>
                <input type="text" value="<%=users.getUsername() %>" name="username"   class="textfield">
            </td>
        </tr>
        <tr>
            <td>密码</td>
            <td> <input type="text" value="<%=users.getUserpass() %>" name="userpass" class="textfield"></td>
        </tr>
        <tr>
            <td>学号</td>
            <td> <input type="text" value="<%=users.getUsernumb() %>" name="usernumb" class="textfield"></td>
        </tr>
        <tr>
            <td>手机号</td>
            <td><input type="text" value="<%=users.getUsertel() %>" name="usertel" class="textfield"></td>
        </tr>
        <tr>
            <td>邮箱</td>
            <td><input type="text" value="<%=users.getUseremail() %>" name="useremail" class="textfield"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="button" id="button" value=" 修改 ">
            </td>
        </tr>
    </table>

</form>
</body>
</html>
