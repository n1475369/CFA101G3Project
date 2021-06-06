$(function(){
    let u_flag = false;
    let p_flag = false;
    let re_p_flag = false;
    let n_flag = false;

    function checkFlag(){
        if(u_flag && p_flag && re_p_flag && n_flag){
            $("#register").removeAttr("disabled") 
        }else{
            $("#register").attr("disabled", "disabled") 
        }
    }

    $('#username').on('input',function(){
        $('#u-prompt').text("");
        if(validateUsername()){
            $('#username').css('border','2px solid #27da80')
            u_flag = true;
        }else{
            $('#u-prompt').text("請輸入有效的電子郵件地址");
            $('#u-prompt').css('color','red');
            $('#u-prompt').css('font-size','10px');
            $('#username').css('border','2px solid red')
            u_flag = false;
        }
        checkFlag();
    });

    $('#password').on('input',function(){
        $('#p-prompt').text("");
        if(validatePassword()){
            $('#password').css('border','2px solid #27da80')
            p_flag = true;
        }else{
            $('#p-prompt').text("密碼長度限制6-20");
            $('#p-prompt').css('color','red');
            $('#p-prompt').css('font-size','10px');
            $('#password').css('border','2px solid red')
            p_flag = false;
        }
        if($('#re-password').val()!=""){
            checkPassword();
        }
        checkFlag();
    });

    $('#re-password').on('input',function(){
        checkPassword();
        checkFlag();
    });

    $('#name').on('input',function(){
        if($('#name').val() != ""){
            $('#name').css('border','2px solid #27da80');
            n_flag = true;
        }else{
            $('#name').css('border','2px solid #f1a7c0');
            n_flag = false;
        }
        checkFlag();
    });


    $('#register').on('click',function(){
        let username = $('#username').val();
        let password = $('#password').val();
        $.ajax({
            type:"post",
            url:"loginServlet",
            data:{
                "username":username,
                "password":password
            },
            success:function (result) {
                if(result=="1"){
                    window.location.href="index.html";
                }else{
                    $('#u-prompt').text("帳號或密碼錯誤");
                    $('#u-prompt').css('color','red');
                    $('#u-prompt').css('font-size','10px');
                    $('#username').css('border','2px solid red')
                }
            }
        });
    });



    function validateUsername() {
        let username = $('#username').val();
        const re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(username);
    }

    function validatePassword(){
        let password = $('#password').val();
        const re = /^[0-9A-Za-z]{6,20}$/;
        return re.test(password);
    }

    function checkPassword(){
        $('#re-p-prompt').text("");
        if($('#password').val() == $('#re-password').val()){
            $('#re-password').css('border','2px solid #27da80')
            re_p_flag = true;
        }else{
            $('#re-p-prompt').text("密碼不相同");
            $('#re-p-prompt').css('color','red');
            $('#re-p-prompt').css('font-size','10px');
            $('#re-password').css('border','2px solid red')
            re_p_flag = false;
        }
    }

});