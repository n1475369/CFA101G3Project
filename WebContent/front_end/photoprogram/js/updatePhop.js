$.ajax({
    url: "../../photoprogram/listAllPhotoProgram",
    type: "post",
    dataType: "json",
    success: function (phop) {
        console.log(phop);
        for (let i = 0; i < phop.length; i++) {
            let html = `<option value="${phop[i].phop_id}">${phop[i].phop_name}</option>`;
            $("#phop_id").append(html);
        }
    }
});
//動態產生方案資訊
$("#phop_id").on("change", function (e) {
    $("#program-left-id").empty();//change前先清除元素
    $("#phop-imgs-id").empty();//清除圖片
    let phop_id = $(e.target).val();
    console.log(phop_id);
    $.ajax({
        type: "post",
        url: "../../photoprogram/phopFindByPhopId",
        dataType: "json",
        data: {
            "phop_id": phop_id
        },
        success: function (phop) {
            console.log(phop);
            let element =
            `<div class="form-group">
                <label>方案名字</label>
                <input type="text" class="form-control" id="phop_name" name="phop_name" value="${phop.phop_name}"></input>
                <input type="hidden" class="form-control" id="phop_id" name="phop_id" value="${phop.phop_id}"></input>
            </div>
            <div class="form-group">
                <label>方案價錢</label>
                <input type="text" class="form-control" id="phop_price" value="${phop.phop_price}"></input>
            </div>
            <div class="form-group">
                <label>開始時間</label><br>
                <input class="form-control" id="phop_start_time" type="text" name="phop_start_time" value="${phop.phop_start_time}">
            </div>
            <div class="form-group">
                <label>結束時間</label><br>
                <input class="form-control" id="phop_end_time" type="text" name="phop_end_time" value="${phop.phop_end_time}">
            </div>
            <div class="form-group">
                <label>方案內容</label>
                <textarea class="form-control" id="phop_content" rows="5" name="phop_content">${phop.phop_content}</textarea>
            </div>
            <div class="form-group">
                <label>方案狀態</label><br>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="phop_status" id="phop_status_1" value="1" checked>
                    <label class="form-check-label" for="phop_status_1">上架</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="phop_status" id="phop_status_0" value="0">
                    <label class="form-check-label" for="phop_status_0">下架</label>
                </div>    
            </div>`;
            $("#program-left-id").append(element);
            let status = phop.phop_status;
            // console.log(status);
            if (status == 0) {
                $("#phop_status_0").prop("checked", true);
            } else {
                $("#phop_status_1").prop("checked", true);
            }
            //產生上傳圖片方案ID
            $("#phop-img-id").prop("value",phop.phop_id);
        }
    });
});
//修改方案資料
$("#confirm-program").on("click", function () {
    let phop_id = $("#phop_id").val();
    let phop_name = $("#phop_name").val();
    let phop_price = $("#phop_price").val();
    let phop_start_time = $("#phop_start_time").val();
    let phop_end_time = $("#phop_end_time").val();
    let phop_content = $("#phop_content").val();
    let phop_status = $("input[name=phop_status]:checked").val();
    console.log(phop_status);
    $.ajax({
        url:"../../photoprogram/phopUpdateServlet",
        type:"post",
        dataType:"json",
        data:{
            "phop_id":phop_id,
            "phop_name":phop_name,
            "phop_price":phop_price,
            "phop_start_time":phop_start_time,
            "phop_end_time":phop_end_time,
            "phop_content":phop_content,
            "phop_status":phop_status
        },
        success:function(phop) {
            if((phop) == "1"){
                alert("更新成功");
                location.reload(true);
            }else{
                alert("更新失敗");
            }
        },
        error:function(phop) {
            alert("更新失敗，請重新檢查");
        },
    });
});
//日期
$("#program-left-id").on("mouseenter","#phop_start_time",function(){
    $.datetimepicker.setLocale("zh");
    $(function(){
        $("#phop_start_time").datetimepicker({
            format:"Y-m-d",
            value: new Date(), 
            minDate: "-1970-01-01",
            onShow:function(){
                this.setOptions({
                    maxDate:$("#phop_end_time").val()?$("#phop_end_time").val():false
                })
            },
            timepicker:false
        });
        $("#phop_end_time").datetimepicker({
            format:"Y-m-d",
            onShow:function(){
                this.setOptions({
                    minDate:$("#phop_start_time").val()?$("#phop_start_time").val():false
                })
            },
            timepicker:false
         });
    });
});
//修改圖片
$("#phop_id").on("change", function(e){
    let phop_id = $(e.target).val();
    //show出圖片
    $.ajax({
        type:"post",
        url:"../../photoprogramimages/phopFKservlet",
        dataType:"json",
        data:{
            "phop_id": phop_id,
        },
        success:function(phopImg){
            for(let i=0; i<phopImg.length; i++){
                let element = 
                `<label class="col-sm phop-img" id="phopi-img-id">
                    <img src="../../photoprogramimages/phopImgServlet?phopi_id=${phopImg[i].phopi_id}" alt="">
                    <a class="delimg" href="javascript:void(0)" data-phopiid="${phopImg[i].phopi_id}"><i class="fas fa-trash-alt"></i></a>
                </label>`;
                $("#phop-imgs-id").append(element);
            }
        }
    });
});
//刪除圖片
$("#phop-imgs-id").on("click",".delimg",function(e){
    //取得偽元素值
    let phopi_id = e.currentTarget.dataset.phopiid
    console.log(phopi_id);
    let con = confirm("確定刪除嗎？");
    if(con){
        $(this).parent().remove();
    }
    $.ajax({
        type:"get",
        url:"../../photoprogramimages/phopiDelServlet",
        data:{
            "phopi_id":phopi_id
        }
    });
});
//新增圖片
$("#imgform").on("submit", function (e) {
    $.ajax({
        url:"../../photoprogramimages/phopiUpdateServlet",
        type:"post",
        data: new FormData(this),
        processData: false,
        contentType: false,
        success: function (phopimg) {
            if (phopimg == "1") {
                alert("更新成功");
                location.reload(false);
            } else {
                alert("更新失敗");
            }
        },
        error: function (phopimg) {
            alert("更新失敗，請重新檢查");
        }
    });
    //取消form表單的跳轉畫面
    e.preventDefault();
});
//瀏覽多張圖片
$("#file_img").on("change", function () {
    if(this.files && this.files[0]){//判斷是否有檔案存在
        for(let i=0; i<this.files.length; i++){
            let reader = new FileReader();//讀取檔案
            reader.onload = function(e){
                let imgData = e.target.result;
                let element = $("<img>").prop("src",imgData);
                $("#new-imgs-id").append(element);
            }
        reader.readAsDataURL(this.files[i]);
        }
    }
});