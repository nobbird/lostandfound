<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>寻物启事信息单</title>
    <link rel="shortcut icon" href="../images/失物招领.png"/>
    <%--<link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/home.css">--%>
</head>
<body>
<form action="do5.jsp" method="post">
    <table width="50%" border="1" align="center">
        <tr>
            <td>信息类型</td>
            <td>寻物启事<input name="lof" type="radio" value="0">&nbsp;招领启事<input name="lof" type="radio" value="1"></td>
        </tr>
        <tr>
            <td>信息标题</td>
            <td>
                <input type="text" name="title" class="textfield">
            </td>
        </tr>
        <tr>
            <td>物品类型</td>
            <td>数码产品<input name="wutype" type="radio" value="0">&nbsp;书籍<input name="wutype" type="radio" value="1">&nbsp;包<input name="wutype" type="radio" value="2">&nbsp;饭卡<input name="wutype" type="radio" value="3"></td>
        </tr>
        <tr>
            <td>物品详情</td>
            <td><input type="text" name="content" class="textfield"></td>
        </tr>
        <tr>
            <td>丢失/捡到日期</td>
            <td><input type="text" name="losttime" class="textfield"></td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <input type="submit" name="button" id="button" value="发布">
            </td>
        </tr>
    </table>

</form>
<%--
<section class="aui-content">
    <div style="height:20px;"></div>
    <div class="aui-content-up">
        <form action="do5.jsp" name="form1" method="post">
            <div class="aui-content-up-form">
                <h2>寻物启事信息单</h2>
            </div>
            <div class="aui-form-group clear">
                <label class="aui-label-control">
                    信息类型 <em>*</em>
                </label>
                <div class="aui-form-input">
                    寻物启事<input name="lof" type="radio" value="0">&nbsp;招领启事<input name="lof" type="radio" value="1">
                </div>
            </div>
            <div class="aui-form-group clear">
                <label class="aui-label-control">
                    信息标题 <em>*</em>
                </label>
                <div class="aui-form-input">
                    <input type="text" class="aui-form-control-two" name="youphone" id="2" placeholder="请输入信息标题" />
                </div>
            </div>
            <div class="aui-form-group clear">
                <label class="aui-label-control">
                    物品类型 <em>*</em>
                </label>
                <div class="aui-form-input">
                    数码产品<input name="wutype" type="radio" value="0">&nbsp;书籍<input name="wutype" type="radio" value="1">&nbsp;包<input name="wutype" type="radio" value="2">&nbsp;饭卡<input name="wutype" type="radio" value="3">
                </div>
            </div>
            <div class="aui-form-group clear">
                <label class="aui-label-control">
                    物品详情<em>*</em>
                </label>
                <div class="aui-form-input">
                    <input type="text" name="content" id="textfield" class="aui-form-control-two">

                </div>
            </div>
            <div class="aui-form-group clear">
                <label class="aui-label-control">
                    丢/捡时间<em>*</em>
                </label>
                <div class="aui-form-input">
                    <input type="text" name="losttime" id="textfield" class="aui-form-control-two">

                </div>
            </div>
            <div class="aui-form-group clear">
                <label class="aui-label-control">
                    上传照片 <em>*</em>
                    <span>小于5M</span>
                </label>
                <div class="aui-form-input">
                    <div class="aui-content-img-box aui-content-full">
                        <div class="aui-photo aui-up-img clear">
                            <section class="aui-file-up fl">
                                <img src="../images/up.png"  class="add-img">
                                <input type="file" name="file" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" multiple/>
                            </section>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="aui-btn-default">
        <input type="submit" name="button" class="aui-btn aui-btn-account" id="button" value="保存并提交审核">
    </div>
</section>
<!-- mask begin -->
<div class="aui-mask aui-works-mask">
    <div class="aui-mask-content">
        <p class="aui-delete-text">确定要删除你上传的信息单？</p>
        <p class="aui-check-text">
            <span class="aui-delete aui-accept-ok">确定</span>
            <span class="aui-accept-no">取消</span>
        </p>
    </div>
</div>
<!-- mask end -->


<script type="text/javascript" src="../js/jquery.min00.js"></script>
<script type="text/javascript" src="../js/up.js"></script>
--%>
<a href="photo.jsp">图片上传</a>
</body>
</html>
