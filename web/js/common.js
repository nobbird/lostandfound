$(function(){

    //登录输入框效果
    $('.form_text_ipt input').focus(function(){
        $(this).parent().css({
            'box-shadow':'0 0 3px #bbb',
        });
    });
    $('.form_text_ipt input').blur(function(){
        $(this).parent().css({
            'box-shadow':'none',
        });
        //$(this).parent().next().hide();
    });

    //表单验证
    $('#form-login').on('submit', function(e){
        var name = $('input[name=username]').val();
        var pass = $('input[name=password]').val();
        console.log(name + " " + pass);

        if (name.length > 1 && pass.length > 1) {
            return true;
        }
        return false;
        /*if($(this).val()==""){
            $(this).css({
                'color':'red',
            });
            $(this).parent().css({
                'border':'solid 1px red',
            });
            //$(this).parent().next().find('span').html('helow');
            $(this).parent().next().show();
        }else{
            $(this).css({
                'color':'#ccc',
            });
            $(this).parent().css({
                'border':'solid 1px #ccc',
            });
            $(this).parent().next().hide();
        }*/
    });
});
