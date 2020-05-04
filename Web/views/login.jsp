<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>로그인</title>
  <meta charset="utf-8">
  <link rel="stylesheet" href="./css/login.css">
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<style>
	* {
  box-sizing: border-box;
  font-family: 'Noto Sans KR', sans-serif;
  
}
body {
  margin: 0;
  /* background-color: #0f4c81; 2f4f4f */
  background: linear-gradient(45deg,#1d112c,#8f61b3)fixed;
}
.login-form {
  position: absolute;
  background-color: rgb(177, 149, 214);
  border-radius: 5px;
  margin-left: auto;
  margin-right: auto;
  width: 300px;
  height: 500px;
  padding: 20px;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
}
.text-field {
  border: none;
  width: 90%;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-bottom: 10px;
  margin-left: auto;
  margin-right: auto;
  display: block;
}
.submit-btn {
  border: none;
  width: 90%;
  background-color: #3e0b79;
  border-radius: 5px;
  font-size: 14px;
  padding: 10px;
  margin-left: auto;
  margin-right: auto;
  margin-bottom: 30px;
  color: white;
  display: block;
  }
.links {
  text-align: center;
}
.links a {
  font-size: 12px;
  color: #9B9B9B;
}
.winwin{
  padding-left: 55px; width: auto; height: auto; padding-top: 35px; padding-bottom: 50px;
}
	</style>


</head>
 
  <div class="login-form">
   	<form action="/Semi/login.me" method="post" name="frm" id="frm">
      <img src="./resource/images/로고.png" width="260" height="250px"  >
      <input type="text" name="id" id="id" class="text-field" placeholder="아이디"><br>
      <input type="password" name="pw" id="pw" class="text-field" placeholder="비밀번호"><br>
      <input type="submit" value="로그인" class="submit-btn" id="loginbutton"  onclick="submitAttion()"/>
     </form> 

    <div class="links">
      <a href="#">아이디 찾기 </a> &nbsp;
      <a href="#">비밀번호 찾기 </a> <br>
 
    </div>
  </div>
  <script>

  function submitAttion(){
    theFrom=document.frm;
    if(theFrom.id.value==""){
        alert("ID를 입력해주세요.")
        return theForm.id.focous();
    }
    if(theFrom.pw.value==""){
        alert("Password를 입력해주세요.")
        return theForm.pw.focous();
    }
    theFrom.submit();
    } 
    
   
    
  </script>

</body>
</html>