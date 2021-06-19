$(function(){
    var resultData;

    //跟資料庫請求個人資料
    $.ajax({
    type:"get",
    url:"buyProfileServlet",
    dataType : 'json',
    success:function (result) {
        if(result == "0"){
            window.location.href="index.html";
        }else{
            resultData = result;
            $('.user-name').html(result.name!=null?result.name:"尚未填寫");
            $('#phone').html(result.phone!=null?result.phone:"尚未填寫");
            $('#city').html(result.city!=null?result.city:"尚未填寫");
            $('#cityarea').html(result.cityarea!=null?result.cityarea:"尚未填寫");
            $('#street').html(result.street!=null?result.street:"尚未填寫");
        }
    }
    });

    //跟資料庫請求個人頭像
    $.ajax({
        type:"post",
        url:"headshotBuyServlet",
        data:{"headshot":"headshot"},
        xhrFields: {
            // 將回傳結果以Blob保持原本二進位的格式回傳
            //jquery的dataType無法設定返回格式為blob需要手動修改
            responseType: "blob"
        },
        success:function (result) {
            let img = document.getElementsByClassName('imgdata');
            if(result.size != "0"){
                let url = URL.createObjectURL(result);
                for (let i = 0; i < img.length; i++) {
                    img[i].src = url;
                }
            }else{
                for (let i = 0; i < img.length; i++) {
                    img[i].src = "images/music_castanet_girl.png";
                }
            }
            
        }
        });

    //編輯按鈕事件
    $('#edit').on('click',function(){
        $('#prompt').text("");
        $('.profile-form').css('display','block');
        $('.profile').css('display','none');
        $('#name-form').val(resultData.name);
        $('#phone-form').val(resultData.phone);
        $('#street-form').val(resultData.street);
        if(resultData.city!=null){
            $('select[name="city"]').val(resultData.city);
            $('select[name="city"]').change();
        }
        if(resultData.cityarea!=null){
            $('select[name="cityarea"]').val(resultData.cityarea);
        }
        checkFlag();
    });

    //呼叫縣市及鄉鎮區選單並預設初始值
    $('#twzipcode').twzipcode({
        'zipcodeSel'  : '106', 
        'countySel'   : '臺北市',
        'districtSel' : '中正區'
    });

    //取消按鈕事件
    $('#cancel').on('click',function(){
        $('.profile-form').css('display','none');
        $('.profile').css('display','block');
    });


    //設置驗證旗幟
    let name_flag = true;
    let phone_flag = true;

    //確認旗幟均為true按鈕才能按
    function checkFlag(){
        if(name_flag && phone_flag){
            $("#edit-submit").removeAttr("disabled") 
        }else{
            $("#edit-submit").attr("disabled", "disabled") 
        }
    }
    
    //監聽會員名稱格式是否正確
    $('#name-form').on('input',function(){
        $('#name-prompt').text("");
        if($('#name-form').val() != ""){
            $('#name-form').css('border','2px solid #27da80');
            $('#name-form').css('box-shadow','');
            name_flag = true;
        }else{
            $('#name-prompt').text("會員名稱不得為空");
            $('#name-prompt').css('color','red');
            $('#name-prompt').css('font-size','10px');
            $('#name-form').css('border','2px solid red');
            $('#name-form').css('box-shadow','0 0 0 2px #f1a7c0');
            name_flag = false;
        }
        checkFlag();
    });

    //監聽電話格式是否正確
    $('#phone-form').on('input',function(){
        $('#phone-prompt').text("");
        if(validatePhone()){
            $('#phone-form').css('border','2px solid #27da80')
            $('#phone-form').css('box-shadow','');
            phone_flag = true;
        }else{
            $('#phone-prompt').text("請輸入有效的手機號碼");
            $('#phone-prompt').css('color','red');
            $('#phone-prompt').css('font-size','10px');
            $('#phone-form').css('border','2px solid red');
            $('#phone-form').css('box-shadow','0 0 0 2px #f1a7c0');
            phone_flag = false;
        }
        checkFlag();
    });

    //電話正則表達式驗證
    function validatePhone(){
        let phone = $('#phone-form').val();
        const re = /^09[0-9]{8}$/;
        return re.test(phone);
    }

    //送出修改表單
    $('#edit-submit').on('click',function(){
        $.ajax({
        type:"post",
        url:"updateBuyProfileServlet",
        data:$('#profile-form').serialize(),
        success:function (result) {
            if(result == "1"){
                window.location.reload();
            }else{
                $('#prompt').text("更新失敗，請重新填寫");
                $('#prompt').css('color','red');
                $('#prompt').css('font-size','10px');
            }
        }
        });
    });
});