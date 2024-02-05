<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script>
	

</script>
<section class="findpassword">
	<div class="container">
		<h3>비밀번호 바꾸기</h3>
	
		<h3 class="hidden">비밀번호 바꾸기</h3>

		<form action="changePass.ks" method="post" id="changePassform">
		<input type="text" class="hidden" name="userid" id="userid" value="${param.userid }">
			<fieldset class="joinfield jf1">

				<p class="first">
					<!-- select -->
					<label for="userpass">비밀번호</label> <input type="password" name="userpass"
						id="userpass">
				</p>
				<p class="br_bottom">
					<label for="userpassre">바꿀 비밀번호 확인</label> <input type="password" name="userpassre"
						id="userpassre">
				</p>
			</fieldset>
			<!-- 필수 입력 정보  -->
			<ul class="prev">
				<li><input onclick=history.back() type="button" value="이전" /></li>
				<li><input type="submit" value="비밀번호 바꾸기" /></li>
			</ul>

		</form>

	</div>
	<!-- container -->
</section>
<!-- findpassword  -->

<%@ include file="../inc/footer.jsp"%>

