<%@ page import="dao.impl.WupingDaoimpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Wuping" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<script  type="text/javascript">
    changeTab('寻物信息');
</script>
<div class="lostInfo-xcontent">
<form action="do4.jsp" method="post">
    <table width="100%" border="1" align="center">
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

        </tr>
            <%
   }
   %>

</form>
<tr>
    <td colspan="7" align="center">
        <a href="inforlost.jsp">首页</a>
        <a href="inforlost.jsp?strpage=<%=pageNum-1%>">上一页</a>
        <a href="inforlost.jsp?strpage=<%=pageNum+1%>">下一页</a>
        <a href="inforlost.jsp?strpage=<%=wupingDao.LastPage(5,0) %>">末页</a>
        <form action="inforlost.jsp" method="get">
            <input type="text" name="strpage" style="width:50px" /><input type="submit" value="跳转" />
        </form>
    </td>
</tr>
</table>
</div>
<%@ include file="footer.jsp"%>