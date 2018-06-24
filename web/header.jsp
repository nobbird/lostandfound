
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>失物招领系统后台</title>
    <link rel="shortcut icon" href="../images/失物招领.png"/>
    <%@ include file="cdn.jsp" %>
    <script src="../js/honeySwitch.js"></script>

    <link rel="stylesheet" href="../css/header.css">
    <link rel="stylesheet" href="../css/admin.css">
    <link rel="stylesheet" href="../css/all-style.css">
    <link rel="stylesheet" href="../css/flex.css">
    <link rel="stylesheet" href="../css/honeySwitch.css">
    <script>
        $(document).ajaxStart(function () {
            $('#loading').removeClass('hidden');
        }).ajaxStop(function () {
            $('#loading').addClass('hidden');
        });
    </script>
</head>
<body>
<header class="header">
    <div class="h-logo">
        <span class="fa fa-navicon"></span>
        <span>失物招领系统</span>
    </div>
    <div class="pull-right">
        <a id="logout" href="adminout.jsp" class="btn btn-xs btn-danger">
            <span class="fa fa-sign-out"></span> 注销
        </a>
    </div>
</header>

<aside class="side">
    <div>
        <a href="/adminIndex.jsp"><img class="img-circle" src="../images/至尊宝.jpg" width="60"></a>
        <h5><b>欢迎: ${admin.adminname }</b></h5>
    </div>
    <ul id="aside-menu">
        <li class="menu">
            <a href="javascript:"><span class="fa fa-file-text-o"></span> 信息管理
                <span class="caret"></span></a>
            <ul class="hide-opt">
                <li><a href="inforlost.jsp">寻物信息</a></li>
                <li><a href="inforfound.jsp">招领信息</a></li>
            </ul>
        </li>
        <li>
            <a href="userslist.jsp"><span class="fa fa-male"></span>&nbsp;&nbsp;用户管理</a>
        </li>
        <%--#if(admin.grade > 1)--%>
        <li class="menu">
            <a href="javascript:"><span class="fa fa-cog"></span> 系统管理
                <span class="caret"></span></a>
            <ul class="hide-opt">
                <li><a href="adminInfo.jsp">管理员信息</a></li>
                <li><a href="adminpass.jsp">个人设置</a></li>
            </ul>
        </li>
        <%--#else--%>
        <li>
            <a href="requstList.jsp"><span class="fa fa-cog"></span> 申请管理</a>
        </li>
        <%--#end--%>
    </ul>
</aside>

<script type="text/javascript">
    // 通过jquery实现简洁的手风琴菜单
    $('#aside-menu .menu > a').on('click', function(event) {
        $(this).parent('li').siblings('li#menu').children('ul').hide(300); // 隐藏其他的菜单
        $(this).parent('li').children('ul').toggle(300); // 显示当前菜单
    });

    function changeTab(text) {
        // 通过a标签中内容改变菜单栏的激活
        $('.side li.active').removeClass('active'); // 将其他菜单去除激活
        $('.side li > a').each(function(index, el) {
            if (el.innerText.indexOf(text) != -1) {
                $(el).parent('li').addClass('active').parent('ul').removeClass('hide-opt');
                return false;
            }
        });
    }

    $('#logout').on('click', function (e) {
        $.post('adminout.jsp', function (data) {
            if (data.success) {
                alert('注销成功！');
                location.href = 'admin.jsp'
            }
        });
    });
</script>
