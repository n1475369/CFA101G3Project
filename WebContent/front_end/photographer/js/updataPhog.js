$(function(){
    //動態選擇攝影師
    $.ajax({
        type:"get",
        url:"../../photographer/phogServlet",
        dataType:"json",
        success:function(phog){
            console.log(phog);
            for(let i=0; i<phog.length; i++){
                let element = 
                `<option value="${phog[i].phog_id}">${phog[i].phog_name}</option>`;
                $("#phog-id").append(element);
            }
        }
    });
});
//找到攝影師ID
$("#phog-id").on("change", function(e){
    let phog_id = $(e.target).val();
    //更新攝影狀態
    $.ajax({
        type:"get",
        url:"../../photographer/phogGetOneSetvlet",
        dataType:"json",
        data:{
            "phog_id":phog_id,
        },
        success:function(phog){
            let status = phog.phog_status;
            if(status == 1){
                $("#phog_status_1").prop('checked', true);
            }else{
                $("#phog_status_0").prop('checked', true);
            }
        }
    });
});
//用name取到攝影師狀態的value
$("#phog-status-id").on("change","input[name=phog_status]:checked",function(e){
    let phog_status = e.target.value;
    //送回後端做更新
    $("#confirm").on("click", function(){
        let phog_id = $("#phog-id").val();
        $.ajax({
            type: "post",
            url: "../../photographer/phogUpdateServlet",
            dataType: "json",
            data: {
                "phog_id": phog_id,
                "phog_status": phog_status
            },
            success: function (phog) {
                alert("更新成功");
                window.location.href="listAllPhotographer.html";//新增成功直接到查詢頁面
            },
            error: function (phog) {
                alert("更新失敗");
            }
        });
    });
});
//選單
$(document).ready(function(){
    $(".demo2").on("click",function(){
        $("#test").slideToggle("slow");
    });
});