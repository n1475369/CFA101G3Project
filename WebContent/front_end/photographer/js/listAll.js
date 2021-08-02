$.ajax({
    type:"get",
    url:"../../photographer/phogServlet",
    dataType:"json",
    success:function (phog) {
        console.log(phog);
        let list =
        `<tr>
            <th scope="col">攝影師名字</th>
            <th scope="col">攝影師狀態</th>
        </tr>`;
        $("#table-phog-id").html(list);
        for (let i=0; i<phog.length; i++) {
            //console.log(phog[i].phog_name);
            let status = phog[i].phog_status;
            let job="";
            if(status==1){
                job="在職中";
            }else{
                job="已離職";
            }
            let element =
            `<tr>
                <td>${phog[i].phog_name}</td>
                <td>${job}</td>
            </tr>`;
            $("#table-phog-id").append(element);   
        }
    }
});