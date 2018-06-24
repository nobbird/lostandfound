<%@ page import="dao.impl.FoundDaoImpl" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="entity.Found" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<script>
    changeTab('申请管理');
    function s_agree(id, flag) {
        var mess = confirm("确定要同意第<" + id + ">条申请吗？");
        if (mess) {
            $.post('/user/delete/' + id, function (data) {
                if (data.success) {
                    alert('SUCCESS: 删除成功');
                    location.reload();
                } else {
                    alert('ERROR: ' + data.msg);
                }
            });
        }
    }
    function s_notagree(id, flag) {
        var mess = confirm("确定要拒绝第<" + id + ">条申请吗？");
        if (mess) {
            $.post('/user/delete/' + id, function (data) {
                if (data.success) {
                    alert('SUCCESS: 删除成功');
                    location.reload();
                } else {
                    alert('ERROR: ' + data.msg);
                }
            });
        }
    }
</script>

<div class="requstList-xcontent">
    <form action="do4.jsp" method="post">
        <table width="100%" border="1" align="center">
            <tr>
                <td>索引</td>
                <td>物品编号</td>
                <td>用户编号</td>
                <td>申请时间</td>
                <td>申请理由</td>
                <td>细节描述</td>
                <td>状态</td>
                <td>操作</td>
            </tr>
                <%
    FoundDaoImpl foundDao = new FoundDaoImpl();
  String  pages=request.getParameter("strpage");
  int lasepage=foundDao.LastPage(5);
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

  ArrayList list =foundDao.getListByPage(pageNum,5);
  for(int i=0;i<list.size();i++ ){
    Found u =(Found) list.get(i);
    if ("0".equals(u.getFlag()))
        u.setFlag("未确认");

   %>
            <tr>
                <%--<td><%=u.getId() %></td>--%>
                <td><%=u.getId() %></td>
                <td><%=u.getTid() %></td>
                <td><%=u.getUserId() %></td>
                <td><%=u.getUpdatetime() %></td>
                <td><%=u.getReason() %></td>
                <td><%=u.getContent() %></td>
                <td><%=u.getFlag() %></td>
                <td><button onclick="s_agree(<%=u.getId()%>,<%=u.getFlag()%>)" class="btn btn-xs btn-danger">同意</button>
                    <button onclick="s_notagree(<%=u.getId()%>,<%=u.getFlag()%>)" class="btn btn-xs btn-danger">拒绝</button></td>

            </tr>
                <%
   }
   %>

    </form>
    <tr>
        <td colspan="8" align="center">
            <a href="requstList.jsp">首页</a>
            <a href="requstList.jsp?strpage=<%=pageNum-1%>">上一页</a>
            <a href="requstList.jsp?strpage=<%=pageNum+1%>">下一页</a>
            <a href="requstList.jsp?strpage=<%=foundDao.LastPage(5) %>">末页</a>
            <form action="requstList.jsp" method="get">
                <input type="text" name="strpage" style="width:50px" /><input type="submit" value="跳转" />
            </form>
        </td>
    </tr>
    </table>
</div>
<%@ include file="footer.jsp"%>
