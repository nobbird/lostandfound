<%@ page import="dao.impl.AdminDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    changeTab('用户管理');
</script>
<%@ include file="header.jsp"%>
<div class="adminInfo-xcontent">
    <form action="do4.jsp" method="post">
        <table width="70%" border="1" align="center">
            <tr>
                <td>编号</td>
                <td>用户名</td>
                <td>手机号</td>
                <td>邮箱</td>
            </tr>
                <%
   AdminDaoImpl  adminDao = new AdminDaoImpl();
  String  pages=request.getParameter("strpage");
  int lasepage=adminDao.LastPage(5);
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

  ArrayList list =adminDao.getListByPage(pageNum,5);
  for(int i=0;i<list.size();i++ ){
     Admin u =(Admin) list.get(i);

   %>
            <tr>
                <td><%=u.getId() %></td>
                <td><%=u.getAdminname() %></td>
                <td><%=u.getAdmintel()%></td>
                <td><%=u.getAdminemail()%></td>

            </tr>
                <%
   }
   %>

    </form>
    <tr>
        <td colspan="7" align="center">
            <a href="adminInfo.jsp">首页</a>
            <a href="adminInfo.jsp?strpage=<%=pageNum-1%>">上一页</a>
            <a href="adminInfo.jsp?strpage=<%=pageNum+1%>">下一页</a>
            <a href="adminInfo.jsp?strpage=<%=adminDao.LastPage(5) %>">末页</a>
            <form action="adminInfo.jsp" method="get">
                <input type="text" name="strpage" style="width:50px" /><input type="submit" value="跳转" />
            </form>
        </td>
    </tr>
    </table>
</div>
<%@include file="footer.jsp"%>