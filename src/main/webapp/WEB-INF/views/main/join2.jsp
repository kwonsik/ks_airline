<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script>
	$(function() {
		$("#dupcheck").on("click", function() {
			if($("#userid").val()==""){alert("아이디의 빈칸을 채워주세요");}
			else{
				$.ajax({
					url : "dupcheck.ks", //경로
					type : "get", //get, post
					dataType : "text", //text, json, xml
					data : {
						userid : $("#userid").val()
					},
					success : function(data) {
						console.log(data);
						if(data=="1"){$("#s1").html("중복된 아이디입니다.");}
						else{$("#s1").html("사용가능한 아이디입니다.");}
					}, //성공시 처리
					error : function(xhr, textStatus, errorThrown) {
						//$("#s1").html(textStatus + "(HTTP-" + xhr.status + "");
					} //실패시 처리
				});//ajax
			}
				
		});
	});
</script>
<section class="useradd">
	<div class="container">
		<h3>회원가입</h3>
		<h3 class="hidden">회원가입</h3>
		<form action="join_action.ks" method="post" id="joinform">
			<fieldset class="joinfield jf1">
				<legend>회원가입 정보</legend>
				<p class="first">
					<label for="userid">아이디</label> <input type="text" name="userid"
						id="userid"><span> (아이디는 영문, 숫자 4~15자리)</span> <input
						type="button" value="중복확인" id="dupcheck" /><span id="s1">중복아이디를
						확인해주세요</span>
				</p>
				<p>
					<label for="userid">이름</label> <input type="text" name="username"
						id="username">
				</p>
				<p>
					<label for="userpass">비밀번호</label> <input type="password"
						name="userpass" id="userpass"> <span>(8~15글자 대문자1이상
						+숫자 1이상 +특수문자 1이상)</span>
				</p>
				<p>
					<label for="userpassre">비밀번호 확인</label> <input type="password"
						name="userpassre" id="userpassre">
				</p>
				<p>
					<!-- select -->
					<label for="useremail">이메일</label> <input type="text"
						name="useremail" id="useremail">
				</p>
				<p>
					<!-- select -->
					<label for="userphone">전화번호</label> <input type="text"
						id="userphone" name="userphone"> <span>'-' 를 제외하고
						숫자만 적어주세요</span>
				</p>
				<p>
					<label for="userpost">우편번호</label> <input type="text" id="userpost"
						name="userpost" readonly> <input type="button"
						value="우편번호검색" id="postcode">
				</p>
				<p class="br_bottom">
					<label for="useraddress">상세주소</label> <input type="text"
						id="useraddress1" name="useraddress1" readonly> <input
						type="text" id="useraddress2" name="useraddress2">
				</p>
			</fieldset>
			<!-- 필수 입력 정보  -->
			<fieldset class="joinfield jf2">
				<legend> 수신 정보 동의</legend>
				<p class="br_bottom first">
					<strong class="addinfo_title">SMS 수신여부</strong> <span
						class="addinfo_desc">SMS 수신에 동의하시겠습니까?</span> <input type="radio"
						id="yes" name="sms" value="Y" /><label for="yes">예</label>
					<input type="radio" id="no" name="sms" value="N" /><label
						for="no">아니요</label>
				</p>
			</fieldset>
			<!-- 수신 정보 동의  -->
			<ul class="prev">
				<li><input type="button" onclick="location.href='main.ks'"
					value="이전" /></li>
				<li><input type="submit" value="회원가입" /></li>
			</ul>

		</form>
	</div>
	<!-- container -->
</section>
<!-- useradd  -->
<%@ include file="../inc/footer.jsp"%>