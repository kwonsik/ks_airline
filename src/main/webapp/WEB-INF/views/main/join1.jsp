<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp"%>
<!-- contents -->
<section class="join1">
	<div class="container">
		<h3>회원가입</h3>
		<h3 class="hidden">회원가입</h3>
		<form action="join2.ks" method="post" id="joinform1">
			<fieldset class="joinfield jf1">
				<legend>
					회원 약관 동의<input type="checkbox" id="check1">
				</legend>
				<%@ include file="../inc/text1.jsp"%>				
			</fieldset>
			<fieldset class="joinfield jf1">
				<legend>
					개인정보 수집 동의<input type="checkbox" id="check2">
				</legend>
				<%@ include file="../inc/text2.jsp"%>
			</fieldset>
			<!-- 필수 입력 정보  -->
			<a class="btn btn-default" href='main.ks'>이전</a>
			<input class="btn btn-primary" style="display:block; float:right;" type="submit"  value="제출">
		</form>
	</div>
	<!-- container -->
</section>
<!-- join1  -->



<%@ include file="../inc/footer.jsp"%>