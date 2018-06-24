<%@ page import="dao.impl.WupingDaoimpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Wuping" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<script>
    changeTab("招领信息");
</script>

<div class="foundInfo-xcontent">
<form action="do4.jsp" method="post">
    <table width="100%" border="1" align="center">
        <tr>
            <td>物品编号</td>
            <td>标题</td>
            <td>描述</td>
            <td>类型</td>
            <td>捡到时间</td>
            <td>信息发布时间</td>
            <td>状态</td>
        </tr>
            <%
    WupingDaoimpl  wupingDao = new WupingDaoimpl();
  String  pages=request.getParameter("strpage");
  int lasepage=wupingDao.LastPage(5,1);
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

  ArrayList list =wupingDao.getListByPage(pageNum,5,1);
  for(int i=0;i<list.size();i++ ){
      Wuping u =(Wuping) list.get(i);
      if ("2".equals(u.getState()))
          u.setState("未领取");
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

            <td><%=u.getId() %></td>
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
        <a href="inforfound.jsp">首页</a>
        <a href="inforfound.jsp?strpage=<%=pageNum-1%>">上一页</a>
        <a href="inforfound.jsp?strpage=<%=pageNum+1%>">下一页</a>
        <a href="inforfound.jsp?strpage=<%=wupingDao.LastPage(5,1) %>">末页</a>
        <form action="inforfound.jsp" method="get">
            <input type="text" name="strpage" style="width:50px" /><input type="submit" value="跳转" />
        </form>
    </td>
</tr>
</table>
</div>
<%@ include file="footer.jsp"%>
