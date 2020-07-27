<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
function check(){
	$.ajax({
		url:"login",
		type: "post",
		data: $('#frm').serialize(),
		dataType: "json",
		success:function(data){
			if(data.result==true){
				location.href="./";
			}else{
				alert(data.errorMsg);
			}
		}
	});
};
</script>

<!-- 콜백함수에서 페이지 이동, 에러에서 alert -->

<div align="center">
	<h1>로그인</h1>
	<form id="frm" action="login" method="post">
		<label>사원아이디</label>  <input name="emp_id">
		<label>패스워드</label> 	<input name="pwd" type="password">
		<button type="button" onclick="check()">로그인</button>
	
	</form>


</div>