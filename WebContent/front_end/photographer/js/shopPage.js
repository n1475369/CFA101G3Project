$.ajax({
    type: "get",
    url: "../../photographer/phogServlet",
    dataType: "json",
    success: function (phog) {
        let mem_id = 0;
        let phogSun =
        `<tr><th scope="row">攝影師</th><td>${phog.length}位</td></tr>`;
        $("#table-smem-id").append(phogSun);
        for(let i = 0; i < phog.length; i++){
            mem_id = phog[i].phog_smem_id;
        }
        // console.log(mem_id);
        $.ajax({
            type: "get",
            url: "../../photoprogram/phopOneSmemIdServlet",
            data:{
                "phop_smem_id":mem_id
            },
            dataType: "json",
            success: function (phop) {
                // console.log(phop); 
                let phopSun =
                `<tr><th scope="row">方案</th><td>${phop.length}筆</td></tr>`;
                $("#table-smem-id").prepend(phopSun);
            }
        });
    }
});
$.ajax({
    type: "get",
    url: "../../photoorder/phooBySmemServlet",
    data: {
        "action":"getSmemId"
    },
    dataType: "json",
    success: function (reserve) {
        let reserveSun =
        `<tr><th scope="row">預約訂單</th><td>${reserve.length}筆</td></tr>`;
        $("#table-smem-id").append(reserveSun);
    }
});