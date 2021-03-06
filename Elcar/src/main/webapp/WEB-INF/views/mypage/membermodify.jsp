<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ELCAR | Hello :)</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
     <style>
      section {
        width: 100%;
        height: 1200px;
        display: table;
      }
    
      div.top_text {
        width: 500px;
        height: 600px;
        text-align: center;
        margin: 0 auto;
      }


      input.text {
        margin-top: 15px;
        width: 500px;
        height: 40px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
      }
      textarea {
        width: 1000px;
        height: 300px;
        font-size: 15px;
        border: 0;
        border-radius: 15px;
        outline: none;
        padding-left: 10px;
        background-color: rgb(233, 233, 233);
        resize: none;
      }
    </style>
</head>
<body>
<!-- Breadcrumb End -->
    <div class="breadcrumb-option set-bg" data-setbg="resources/img/breadcrumb-bg.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <a href="./mypage"><h2>My page</h2></a>
                        <div class="breadcrumb__links">
                            <a href="../"><i class="fa fa-home"></i> Home</a>
                            <span>회원 정보</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb end -->
    
    
    <section class="services spad">
      <div class="container">
         <div class="row">
            <div class="col-lg-12">
               <div class="section-title">
                  <h2>내정보 변경</h2>
                   <hr width=”” color=”” noshade />
                  <div align="left" style="height:1px;">
                  <br><br><br>
                  <span style="color: green;">${member.name}</span>
                  <span style="color: black;" >님의 정보를 변경합니다.</span>
                  </div>
               </div>
            </div>
         </div>
      </div>

<div style=height:150px;></div>
       <div class="top_frame">
          <div class="top_text">
            <form action="membermodify" method="post" >
            <h4 style="float: left">아이디 <small style="color: red;">&nbsp;*수정 불가</small></h4>
            <input type="hidden" id="id" name='id' value="${id }">
            <input
              type="text"
              class="text_custom text"
              value="${id}"
              readonly
            >

         <br /><br />
            <h4 style="float: left">이름</h4>
            <input
              type="text"
               id="name"
              class="text_custom text"
              name="name"
              value="${member.name }"             
            >

         <br /><br />
      <h4 style="float: left">이메일</h4>
            <input
              type="text"
              id="email"
              class="text_custom text"
              value="${member.email }"
              name="email" 
            />
         <br /><br />
            <h4 style="float: left">닉네임</h4>
            <input
              type="text"
               id="nickname"
              class="text_custom text"
              name="nickname"
              value="${member.nickname }"
            />
         <br /><br />
            <h4 style="float: left">전화번호</h4>
            <input
              type="text"
              id="phone"
              class="text_custom text"
              name="phone"
              value="${member.phone }"
            />
         <br /><br />
            <h4 style="float: left">성별 <small style="color: red;">&nbsp;*수정 불가</small></h4>
            
            <input type="hidden" id="gender" name='gender' value="${member.gender}">                         
            <input
              type="text"
              class="text_custom text"
              value="${member.gender == 0 ? '남성' : '여성'}"
              disabled
            />
         <br /><br />
         
         
            <div style=" height:150px;"></div>  <!--버튼 높이 조정-->
                           
                            <div style="width:550px; float: right"> <!--  버튼 위치 수정 -->
                            <button type="submit" class="site-btn" >내 정보 변경하러 가기</button>
                            </div>          
            </form>
          </div>
   </div>
   </section>
   
   
   
   
   

</body>
</html>