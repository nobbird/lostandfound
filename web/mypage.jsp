<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Users" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人主页</title>
    <link rel="shortcut icon" href="../images/失物招领.png"/>
</head>
<body>
  <%
      Users user = (Users) request.getSession().getAttribute("user");
  %>
      <form method="post">
          <table width="50%" border="1" align="center">
              <tr>
                  <td>姓名</td>
                  <td><%=user.getUsername() %></td>
              </tr>
              <tr>
                  <td>学号</td>
                  <td><%=user.getUsernumb() %></td>
              </tr>
              <tr>
                  <td>手机号</td>
                  <td><%=user.getUsertel() %></td>
              </tr>
              <tr>
                  <td>邮箱</td>
                  <td><%=user.getUseremail() %></td>
              </tr>
          </table>
      </form>
</body>
</html>
