<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="findid">
	<div class="container">
		<h3>아이디 찾기</h3>
		<h3 class="hidden">아이디 찾기</h3>

		<form action="findId.ks" method="post" id="findIdform">
			<fieldset class="joinfield jf1">


				<p class="first">
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
				<li><input type="submit" value="아이디 찾기" /></li>
			</ul>

		</form>

	</div>
	<!-- container -->
</section>
<!-- findid  -->

<%@ include file="../inc/footer.jsp"%>

