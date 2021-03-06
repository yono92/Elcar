<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Elcar loginForm</title>

    <link rel ="stylesheet" href="resources/css/Login.css">
    
    <!-- 카아로 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
    
    <!-- 네아로 -->
    <!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script> -->
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    
</head>
<body>
    <section class="login-form" style="margin-bottom: 100px; margin-top: 30px;">
        <h1>LOGIN</h1>

        <form action="login" method="post" >
            <div class="int-area">
            <input type="text" name="id" id="id"
            autocomplete="off" required>
            <label for="id">ID</label>
            </div>
            <div class="int-area">
                <input type="password" name="pw" id="pw"
                autocomplete="off" required>
                <label for="pw">PW</label>
                </div>
                
               <!--  아이디 저장 기능 구현부
                <div class="checkbox">
                <li><input type = "checkbox" id="chk_id"><label for="chk_id"> 아이디 저장</label></li>
            </div> -->
            
                <div class="btn-area">
                <button id="btn" type="submit" class="btn btn-dark" style="width:230px;">LOGIN</button>
                <a href="joinform">
                    <button id="btn" type="button" class="btn btn-outline-dark" style="width:230px;">JOIN</button>
                </a>
                </div>
            </form>
            <div class = "Forgot">  
                <li><a href="findid">아이디 찾기</a></li>
                <li><a href="findpw">비밀번호 찾기</a></li>
        </div>
        <div class="Forgot2">
        <!-- 카아로버튼 -->
            <a id="kakao-login-btn" href="javascript:kakaoLogin();" >
            <img src="resources/img/kakao_id_login_bt.png"alt="카카오 로그인 버튼" style="padding-bottom: 15px; width: 208px; height: 60px;"/>
            </a>
            <!--  <a href="" id="naverLogin">
    	<img src="resources/img/btnG_완성형.png "alt="네이버 로그인 버튼" style="width: 183px !important; height: 45px !important;"/> -->
        </a> 
   		<!-- 네아로버튼 -->
   		<div id="naverIdLogin" ></div>
   		<!--  <a href="" id="naverLogin">
    	<img src="resources/img/btnG_완성형.png "alt="네이버 로그인 버튼" style="width: 183px !important; height: 45px !important;"/>
        </a> -->
        </div>
    </section>
 <!-- <form id="loginForm" action="sign-in" method="post">
                    <label for="Input Email" class="form-label">Input ID</label>
                    <input type="text" class="form-control mb-3" id="id" name="id" placeholder="Input your ID">

                    <label for="inputPW" class="form-label">Input PW</label>
                    <input type="password" class="form-control mb-3" id="password" name="password"
                        placeholder="Input your password">


                    <input class="btn btn-primary w-100 mb-3" type="submit"  value="Sign In">      
                    <button id="signup" type="button" class="btn btn-outline-success mb-3"
                        style="float:right; width:100%">Sign Up</button>
                </form>
                <a id="kakao-login-btn" href="javascript:kakaoLogin();"><img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg"
    alt="카카오 로그인 버튼"/></a> -->
</body>


<!-- 카아로 -->
<script type="text/javascript">
Kakao.init('8a9556b483ee07ff9538989cc3f83453');
			
			
function kakaoLogin(){
	window.Kakao.Auth.login({
		scope:'profile_nickname, account_email, gender',
		success:function(authObj){
			window.Kakao.API.request({
				url:'/v2/user/me',
				success:res=>{
					let kakao_account = res.kakao_account;
					console.log(kakao_account);
					let jsonData={
							"id":kakao_account.email,
							"gender":kakao_account.gender,
							"nickname":kakao_account.profile.nickname
					};
					window.location.href="/login-kakao?id="+kakao_account.email+"&gender="+kakao_account.gender+"&nickname="+kakao_account.profile.nickname;
					return false;
				}
			});
		}
	})
}
			/* Kakao.Auth.createLoginButton({
			  container: '#kakao-login-btn',
			  success: function(authObj) {
			    Kakao.API.request({
			      url: '/v2/user/me',
			      success: function(result) {
			        $('#result').append(result);
			        id = result.id
			        connected_at = result.connected_at
			        kakao_account = result.kakao_account
			        $('#result').append(kakao_account);
			        resultdiv="<h2>로그인 성공 !!"
			        resultdiv += '<h4>id: '+id+'<h4>'
			        resultdiv += '<h4>connected_at: '+connected_at+'<h4>'
					email ="";
					gender ="";
					birthday ="";
					if(typeof kakao_account != 'undefined'){
						email = kakao_account.email;
						gender = kakao_account.gender;
						birthday = kakao_account.birthday;
					}
					resultdiv += '<h4>email: '+email+'<h4>'
					resultdiv += '<h4>gender: '+gender+'<h4>'
					resultdiv += '<h4>birthday: '+birthday+'<h4>'
					$('#result').append(resultdiv);
				},
				fail: function(error){
					alert('login success, but failed to request user information: '+JSON.stringify(error))
					},
			})
		},
		fail: function(err){
			alert('failed to login: '+JSON.stringify(err))
		},
	}) */
</script>


<!-- 네아로 -->
<script type="text/javascript"> 
var naverLogin = new naver.LoginWithNaverId( { 
	clientId: "EZJDTdNIOoDkCowSs_Ux", 
	callbackUrl: "https://118.67.133.185:8080/join_naver1", 
	loginButton: {color: "green", type: 3, height: 45} /* 로그인 버튼의 타입을 지정 */ 
	} 
	); /* 설정정보를 초기화하고 연동을 준비 */ 
	naverLogin.init(); 
	naverLogin.logout();
	
	$(document).on("click", "#naverLogin", function(){ 
		var btnNaverLogin = document.getElementById("naverIdLogin").firstChild;
		btnNaverLogin.click();
	});
</script>

<!-- <script type="text/javascript">
	//naver_id_login.init();
  	var naver_id_login = new naver_id_login("EZJDTdNIOoDkCowSs_Ux", "http://localhost:8080/join_naver1");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("http://localhost:8080/login-kakao");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script> -->
<script>


    let id = $('#id');
    let pw = $('#pw');
    let btn = $('#btn');
    let naver = $('#naverLogin');

    $(btn).on('click',function(){
        if($(id).val() =="") {
            $(id).next('label').addClass('warning');
            setTimeout(function() {
                $('label').removeClass('warning');
            },1500);
        }
        else if($(pw).val() == ""){
            $(pw).next('label').addClass('warning');
        }
    });

</script>


</html>