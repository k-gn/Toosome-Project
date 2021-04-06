$('.sms_phone_btn').click(function(){
    let phoneNumber = $('.sms_phone_number_box').val();

    $.ajax({
        type: "GET",
        url: "sendSms?phoneNumber=" + phoneNumber,
        data: {
            "phoneNumber" : phoneNumber
        },
        success: function(res){
        	alert("인증번호 발송 완료!")
            $(".sms_check_btn").click(function(){
                if($.trim(res) ==$(".sms_check_nember_box").val()){
                    alert('인증성공!')
                    document.location.href="/signin";
                }else{
                	alert('error')
                }
            })
        }
    })
});