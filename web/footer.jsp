<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2018/6/22
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<footer class="footer">
    <span>2018 © <a href="https://github.com/nobbird" style="color: #fff;" target="_block">· zhn</a></span>
</footer>

<script>
    /**
     * 用来自动构建分页按钮
     */
    (function pageAuto(totalPages, pageNo, box) {
        box.html('');
        var front = 4, back = 5, start = 1, end = totalPages;
        if (totalPages > 10) {
            if (pageNo <= front + 1) {
                start = 1; end = 10;
            } else if (totalPages < pageNo + back) {
                var add = back - (totalPages - pageNo) + front;
                start = pageNo - add;
                end   = totalPages;
            } else {
                start = pageNo - front;
                end   = pageNo + back;
            }
        }
        //console.log(totalPages, pageNo, box);
        box.append('<li onclick="gotoPage(this, 1)"><a href="javascript:">首页</a></li>');
        if (start > 1) {
            box.append('<li><a href="javascript:">...</a></li>');
        }
        for(var i = start; i <= end; i++) {
            var at = '';
            if (i === pageNo)
                at = 'active';
            box.append('<li class="'+at+'" onclick="gotoPage(this, '+i+')">' +
                '<a href="javascript:">'+i+'</a></li>');
        }
        if (end < totalPages) {
            box.append('<li><a href="javascript:">...</a></li>');
        }
        box.append('<li onclick="gotoPage(this, '+totalPages+')"><a href="javascript:">尾页</a></li>');
    })(${pages?pages.totalPages:'0'}, ${pages?pages.number + 1:'0'}, $('.pagination'));
</script>
</body>
</html>