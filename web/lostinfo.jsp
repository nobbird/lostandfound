<%@ page import="entity.Wuping" %>
<%@ page import="dao.WupingDao" %>
<%@ page import="dao.impl.WupingDaoimpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Users" %><%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/6/7
  Time: 22:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>寻物启事</title>
    <link rel="shortcut icon" href="../images/失物招领.png"/>
</head>
<body>
<a href="issuelost.jsp">发布寻物启事信息</a>
<form action="do4.jsp" method="post">
    <table width="50%" border="1" align="center">
        <tr>
            <td>标题</td>
            <td>描述</td>
            <td>类型</td>
            <td>丢失时间</td>
            <td>信息发布时间</td>
            <td>状态</td>
        </tr>
            <%
    WupingDaoimpl  wupingDao = new WupingDaoimpl();
  String  pages=request.getParameter("strpage");
  int lasepage=wupingDao.LastPage(5,0);
  int pageNum=1;//默认页
  if(pages!=null){
  try {
  pageNum=Integer.parseInt(pages);
  }catch(Exception e){
  pageNum=1;
  }

  }
  if(pageNum<1){
  pageNum=1;
  }
    if(pageNum>lasepage){
  pageNum=lasepage;
  }

  ArrayList list =wupingDao.getListByPage(pageNum,5,0);
  for(int i=0;i<list.size();i++ ){
      Wuping u =(Wuping) list.get(i);
      if ("0".equals(u.getState())) {
          u.setState("未找到");
      }
      if("0".equals(u.getTypes())){
          u.setTypes("数码产品");
      }
      if ("1".equals(u.getTypes())){
          u.setTypes("书籍");
          }
      if ("2".equals(u.getTypes())){
          u.setTypes("包");
      }
      if ("3".equals(u.getTypes())){
          u.setTypes("饭卡");
      }

   %>
        <tr>
            <%--<td><%=u.getId() %></td>--%>
            <td><%=u.getTitle() %></td>
            <td><%=u.getContent() %></td>
            <td><%=u.getTypes() %></td>
            <td><%=u.getLosttime()%></td>
            <td><%=u.getUpdatetime()%></td>
            <td><%=u.getState()%></td>
            <%--<td><a href="do3.jsp?id=<%=u.getId()%>">删除</a>--%>
                <%--<a href="update.jsp?id=<%=u.getId()%>">修改</a>--%>
            <%--</td>--%>

        </tr>
            <%
   }
   %>

</form>
<tr>
    <td colspan="7" align="center">
        <a href="lostinfo.jsp">首页</a>
        <a href="lostinfo.jsp?strpage=<%=pageNum-1%>">上一页</a>
        <a href="lostinfo.jsp?strpage=<%=pageNum+1%>">下一页</a>
        <a href="lostinfo.jsp?strpage=<%=wupingDao.LastPage(5,0) %>">末页</a>
        <form action="lostinfo.jsp" method="get">
            <input type="text" name="strpage" style="width:50px" /><input type="submit" value="跳转" />
        </form>
    </td>
</tr>
</table>
<a href="userindex.jsp">网站首页</a>
</body>
</html>