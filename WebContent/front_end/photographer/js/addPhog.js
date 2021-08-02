//用name屬性來註冊事件，取得攝影師狀態
// let phog_statue = null;
// $("input[name='phog_status']").on("change", function(e){
//     phog_statue = e.target.value;
//     console.log(phog_statue);
// });
//進階版本
let phog_status = $("input[name=phog_status]:checked").val();
//送出新增
$("#confirm").on("click", function () {
    let phog_name = $("#phog_name").val()
    $.ajax({
        url: "../../photographer/phogAddServlet",
        type: "post",
        dataType: "json",
        data: {
            "phog_name": phog_name,
            "phog_status": phog_status
        },
        success: function (data) {
            alert("新增成功");
            window.location.href="listAllPhotographer.html";//新增成功直接到查詢頁面
        },
        error: function (data) {
            alert("新增失敗");
        }
    });
});
//設置旗幟
let name_flag = false;

//確認旗幟均為true按鈕才能按
function checkFlag(){
     if(name_flag){
        $("#confirm").removeAttr("disabled"); 
     }else{
        $("#confirm").prop("disabled", "disabled");
     }
 };
 //監聽攝影師格式是否正確
$("#form-name").on("input","#phog_name", function(){
    $("#name-prompt").text("");
    if(validatephogname()){
        $(".form-control:focus").css("border-color","#28a745");
        $(".form-control:focus").css("box-shadow","0 0 0 0.2rem rgba(40, 167, 69, 0.25)");
        name_flag = true;
    }else{
        $(".form-control:focus").css("border-color","#ff5549");
        $(".form-control:focus").css("box-shadow","0 0 0 0.2rem rgba(255, 76, 76, 0.25)");
        $("#name-prompt").text("攝影師名字不得為空");
        $("#name-prompt").css("color","red");
        $("#name-prompt").css("font-size","6px");
        $("#name-prompt").css("margin-top","5px");
        name_flag = false;
    }
    checkFlag();
});
//攝影師名子正則表達式
function validatephogname(){
    let phogname = $("#phog_name").val();
    const re = /^[(\u4e00-\u9fa5)(A-za-z)]/;
    return re.test(phogname);
}

