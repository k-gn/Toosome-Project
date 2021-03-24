// 카카오 키값
window.Kakao.init("d6137d33ec400707192855ef058d4a62");

// 카카오 로그인 버튼을 생성
function kakaoLogin() {
  window.Kakao.Auth.login({
    scope: "profile, account_email, gender, birthday",
    success: function (authObj) {
      console.log(authObj);
      window.Kakao.API.request({
        url: "/v2/user/me",
        success: (res) => {
          const kakao_account = res.kakao_account;
          console.log(kakao_account);
        },
      });
    },
  });
}

// 네이버 키값/ 콜백
// "wVWBkaEzBLyUAWQGF1Rf",
//   "http://192.168.35.234:5500/naver-callback.html"
