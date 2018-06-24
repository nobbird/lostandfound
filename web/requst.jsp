<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/6/11
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>招领窗口</title>
    <link rel="shortcut icon" href="../images/失物招领.png"/>
</head>
<body>
<form action="do6.jsp" method="post">
    <table width="50%" border="1" align="center">
        <tr>
            <td>物品编号</td>
            <td><input type="text" name="tid" class="textfield"></td>
        </tr>
        <tr>
            <td>申请理由</td>
            <td>
                <input type="text" name="reason" class="textfield">
            </td>
        </tr>
        <tr>
            <td>详情描述</td>
            <td><input type="text" name="content" class="textfield"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="button" id="button" value="发布">
            </td>
        </tr>
    </table>

</form>
<a href="userindex.jsp">网站首页</a>
</body>
</html>
