<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script>

</script>
<section class="findpassword">
	<div class="container">
		<h3>비밀번호 찾기</h3>
		<h3 class="hidden">비밀번호 찾기</h3>

		<form action="findPass.ks" method="post" id="findPassform">
			<fieldset class="joinfield jf1">

				<p class="first">
					<!-- select -->
					<label for="userid">아이디</label> <input type="text" name="userid"
						id="userid">
				</p>
				<p>
					<!-- select -->
					<label for="useremail">이메일</label> <input type="text"
						name="useremail" id="useremail">
				</p>
				<p class="br_bottom">
					<!-- select -->
					<label for="userphone">전화번호</label> <input type="text"
						id="userphone" name="userphone"> <span>'-' 를 제외하고
						숫자만 적어주세요</span>
				</p>

			</fieldset>
			<!-- 필수 입력 정보  -->




			<ul class="prev">
				<li><input onclick=history.back() type="button" value="이전" /></li>
				<li><input type="submit" value="비밀번호 찾기" /></li>
			</ul>

		</form>

	</div>
	<!-- container -->
</section>
<!-- findpassword  -->

<%@ include file="../inc/footer.jsp"%>

