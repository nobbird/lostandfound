<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html >
<html>
<head>
    <title>失物招领系统后台登录</title>
    <meta charset="utf-8">
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../css/adminlogin.css"  rel="stylesheet" />

</head>
<body>
<div style="height:1px;"></div>
<div class="login">
    <header>
        <h1>登陆</h1>
    </header>
    <div class="sr">
        <form action="do-admin.jsp" method="post">
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-user"></i>
                </label>
                <input type="text"  placeholder="这里输入登录名" name="adminname" class="admin">
            </div>
            <div class="name">
                <label>
                    <i class="sublist-icon glyphicon glyphicon-pencil"></i>
                </label>
                <input type="password"  placeholder="这里输入登录密码" name="adminpass" class="admin">
            </div>
            <button type="submit" name="button" class="dl">登录</button>
        </form>
    </div>
</div>




</body>
</html>
