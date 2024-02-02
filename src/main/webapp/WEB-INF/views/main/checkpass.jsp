<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script>
	$(function(){
		$("#checkform").on("submit",function(){
			if($("#userpass").val()==""){
				alert("비밀번호를 입력해주세요");return false;
			}
			
		});
	});
</script>
<section class="useradd checkpass">
	<div class="container">
		<h3>비밀번호 확인</h3>
		<h3 class="hidden">비밀번호 확인</h3>
		<form action="${action }" method="post" id="checkform">
			<fieldset class="joinfield jf1">


				<p class="first" style="border-bottom: 1px solid #ddd">
					<!-- select -->
					<label for="userpass">비밀번호</label> <input type="password"
						name="userpass" id="userpass">
				</p>

			</fieldset>
			<!-- 필수 입력 정보  -->
			<ul class="prev">
				<li><input onclick="location.href='main.ks'" type="button"
					value="메인으로" /></li>
				<li><input type="submit" value="비밀번호확인" /></li>
			</ul>

		</form>

	</div>
	<!-- container -->
</section>
<!-- findid  -->

<%@ include file="../inc/footer.jsp"%>

