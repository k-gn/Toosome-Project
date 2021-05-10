/*
// 카카오 키값
window.Kakao.init("d6137d33ec400707192855ef058d4a62");

// 카카오 로그인 버튼을 생성
function kakaoLogin() {
  window.Kakao.Auth.login({
    scope: "profile, account_email, gender, birthday",
    success: function (authObj) {
      
      window.Kakao.API.request({
        url: "/v2/user/me",
        success: (res) => {
          const kakao_account = res.kakao_account;
          
        },
      });
    },
  });
}
*/

function loginWithKakao() {
  $.ajax({
     url: '/ksignin',
       type: 'get',
       async: false,
       dataType: 'text',
       success: function (res) {
			let _left = (window.screen.width/2) - (500/2);
   			let _top = (window.screen.height/2) - (500/2);
			
			
			window.open(res, 'Toosome', "width=500, height=500, location=no, menubar=no, top=" + _top + ", left=" + _left);
       }
   });
}

// 네이버 키값/ 콜백
// "wVWBkaEzBLyUAWQGF1Rf",
//   "http://192.168.35.234:5500/naver-callback.html"


function loginWithNaver() {
    $.ajax({
        url: '/nsignin',
        type: 'get',
        async: false,
        dataType: 'text',
        success: function (res) {
            let _left = (window.screen.width/2) - (500/2);
   			let _top = (window.screen.height/2) - (700/2);
			
			window.open(res, 'Toosome', "width=500, height=700, location=no, menubar=no, top=" + _top + ", left=" + _left);
        }
    });
}




$(function () {
  $(".auto-login").click(function () {
    $(".auto-login .check-box").toggleClass("check");
    if ($("#remember").is(":checked") == false) {
      $("#remember").attr("checked", true);
    } else {
      $("#remember").attr("checked", false);
    }
  });
});