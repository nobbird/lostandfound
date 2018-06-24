<%@ page import="entity.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="header.jsp"%>
<script type="text/javascript">
    changeTab('个人设置');
</script>
<%--<% Admin admin = (Admin) request.getSession().getAttribute("admin");
%>--%>
<div class="adminpass-xcontent">
    <div>
        <div class="col-lg-12 col-xs-12">
            <h4><span class="fa fa-hand-o-right"></span> 个人设置</h4>
        </div>
        <div style="min-width: 260px;" class="col-lg-4 col-xs-5 col-lg-offset-1  col-xs-offset-1">
            <div class="panel panel-info bd-color-x">
                <div class="panel-heading bg-color-x">
                    <span class="">修改密码</span>
                </div>
                <div class="panel-body">
                    <form id="pwd" class="form-horizontal">
                        <div  id="error1" style="color: red;margin-left: 40%;margin-bottom: 2%;display: none;"></div>
                        <input class="hidden" type="text" name="id" value="${admin.id}>">
                        <div class="form-group">
                            <label for="np1" class="text-left col-sm-3 control-label">新密码</label>
                            <div class="col-sm-9">
                                <input type="password" name="password" class="form-control" id="np1" placeholder="新密码"
                                       required onfocus="errorNone1();">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="np2" class="text-left col-sm-3 control-label">确定密码</label>
                            <div class="col-sm-9">
                                <input type="password" class="form-control" id="np2" placeholder="确定密码" required onfocus="errorNone1();">
                            </div>
                        </div>
                        <input type="submit" onclick="flag(1)" value="确定修改" class="btn btn-warning btn-group-justified">
                    </form>
                </div>
            </div>
        </div>
        <div style="min-width: 260px;" class="col-lg-4 col-xs-5 col-lg-offset-1">
            <div class="panel panel-info bd-color-x">
                <div class="panel-heading bg-color-x">
                    <span class="">修改信息</span>
                </div>
                <div class="panel-body">
                    <form id="info" class="form-horizontal" method="post">
                        <div  id="error2" style="color: red;margin-left: 40%;margin-bottom: 2%;display: none;"></div>
                        <input class="hidden" type="text" name="id" value="${admin.admintel}">
                        <div class="form-group">
                            <label for="np1" class="text-left col-sm-3 control-label">新电话</label>
                            <div class="col-sm-9">
                                <input type="text" name="tel" id="tel" class="form-control" maxlength="11" placeholder="${admin.admintel}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="np2" class="text-left col-sm-3 control-label">用户名</label>
                            <div class="col-sm-9">
                                <input type="text" name="name" id="name" class="form-control" placeholder="${admin.adminname}" >
                            </div>
                        </div>
                        <input type="submit" onclick="flag(2)" value="确定修改" class="btn btn-success btn-group-justified">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var i ;
    function flag(ob) {
        i = ob;
    }
    $('form').submit(function (event) {
        event.preventDefault();
        var fd = $(this).serialize();

        if(i == 1){
            if(checkPassword()){
                $.post('/admin/change', fd, function (data) {
                    if (data.success) {
                        alert('SUCCESS: 修改成功！');
                        location.reload();
                    } else {
                        alert("ERROR: " + data.msg);
                    }
                });
            }
        }
        if(i == 2){
            if(checkPhoneAndName()){
                $.post('/admin/change', fd, function (data) {
                    if (data.success) {
                        alert('SUCCESS: 修改成功！');
                        location.reload();
                    } else {
                        alert("ERROR: " + data.msg);
                    }
                });
            }
        }

    });
    function checkPassword() {
        if($('#np1').val().length<6){
            document.getElementById('error1').innerText="密码不能小于6位！";
            document.getElementById('error1').style.display='block';
            return 0;
        }
        if(($('#np1').val()!=$('#np2').val())||$('#np1').val()==''||
            $('#np2').val()==''){
            document.getElementById('error1').innerText="两次密码输入不一致！";
            document.getElementById('error1').style.display='block';
            return 0;
        }
        else {
            return 1;
        }
    }

    function checkPhoneAndName() {
        var telReg=/^[1][3,4,5,7,8][0-9]{9}$/;
        var tel = $('#tel').val();
        var name = $('#name').val();
        if (tel === '' && name === '') {
            document.getElementById('error2').innerText="请填入至少一个！";
            document.getElementById('error2').style.display='block';
            return 0;
        } else {
            if (tel !== '' && !telReg.test(tel)) {
                document.getElementById('error2').innerText="手机号输入不合法！";
                document.getElementById('error2').style.display='block';
                return 0;
            }
            return 1;
        }
    }

    function errorNone1(){
        document.getElementById('error1').style.display='none';
    }

    function errorNone2(){
        document.getElementById('error2').style.display='none';
    }
</script>
<%@include file="footer.jsp"%>

