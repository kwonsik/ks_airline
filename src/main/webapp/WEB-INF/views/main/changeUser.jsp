<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<script>
	$(function() {
		let postcode = document.querySelector("#postcode2");
		postcode.addEventListener("click", function() {
			search();
		})
		let search = function() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							//우편번호 : zonecode
							//주소 : address
							document.querySelector("#userpost2").value = data.zonecode;
							document.querySelector('#useraddress12').value = data.address;
							document.querySelector("#useraddress22").value = "";
							document.querySelector("#useraddress22").focus();
						}
					}).open();
		}
		$("#changeform")
				.on(
						"submit",
						function() {
							let datavalue = [ "아이디", "이메일", "전화번호", "우편번호", ,
									"상세주소1", "상세주소2" ]
							let inputText = document
									.querySelectorAll("#changeform input[type='text']");
							let inputRadio = document
									.querySelectorAll("#changeform input[type='radio']");

							let inputs = new Array();

							for (let i = 0; i < inputText.length; i++) {
								inputs.push(inputText[i]);
							}
							for (let i = 0; i < inputRadio.length; i++) {
								inputs.push(inputRadio[i]);
							}

							let reg_id = /^[a-zA-z0-9].{4,15}$/;
							let reg_pass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
							let reg_email = /^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/
							let reg_mobile = /^010(?:\d{3}|\d{4})\d{4}$/;

							for (let i = 0; i < 5; i++) {
								if (inputs[i].value == "") {
									alert(datavalue[i] + "의 빈칸을 채워주세요");
									inputs[i].focus();
									return false;
									break;
								}
								switch (i) {

								case 1:
									if (reg_email.test(inputs[1].value) == false) {
										alert("이메일을 확인해주세요");
										inputs[1].focus();
										return false;
									}
									break;
								case 2:
									if (reg_mobile.test(inputs[2].value) == false) {
										alert("전화번호를 확인해주세요");
										inputs[2].focus();
										return false;
									}
									break;
								}

							}

							if (inputs[3].value == "") {
								alert("우편번호를 입력해주세요");
								search();
								return false
							}
							if (inputs[6].checked == false
									&& inputs[7].checked == false) {
								alert("SMS수신여부를 확인해주세요");
								return false;
							}
						});

	});
</script>
<section>
	<div class="container">
		<h3>회원정보 수정</h3>
		<h3 class="hidden">회원정보 수정</h3>
		<form action="changeuser.ks" method="post" id="changeform">
			<fieldset class="joinfield jf1 useradd userchange">
				<legend>${dto.username }님의 정보</legend>
				<p class="first">
					<label for="userid">아이디</label> <input type="text" name="userid"
						id="userid" readonly value="${dto.userid }">
				</p>
				<p>
					<label for="useremail">이메일</label> <input type="text"
						name="useremail" id="useremail" value="${dto.useremail }">
				</p>
				<p>
					<label for="userphone">전화번호</label> <input type="text"
						id="userphone" name="userphone" value="${dto.userphone }">
				</p>
				<p>
					<label for="cuserpost">우편번호</label> <input type="text"
						id="userpost2" name="userpost" value="${dto.userpost }"> <input
						type="button" value="우편번호검색" id="postcode2">

				</p>
				<p class="br_bottom">
					<label for="cuseraddress">상세주소</label> <input type="text"
						id="useraddress12" name="useraddress1"
						value="${dto.useraddress1 }" readonly> <input type="text"
						id="useraddress22" name="useraddress2"
						value="${dto.useraddress2 }">
				</p>
			</fieldset>
			<!-- 필수 입력 정보  -->
			<fieldset class="joinfield jf2 useradd userchange" style="margin-bottom:50px">
				<legend> 수신 정보 동의</legend>
				<p class="br_bottom first">
					<strong class="addinfo_title">SMS 수신여부</strong> <span
						class="addinfo_desc">SMS 수신에 동의하시겠습니까?</span> <input type="radio"
						id="yes" name="smsaccept" value="yes" /><label for="yes">예</label>
					<input type="radio" id="no" name="smsaccept" value="no" /><label
						for="no">아니요</label>
				</p>
			</fieldset>
			<!-- 수신 정보 동의  -->
			
				 <input class="btn btn-default" onclick="location.href='Main.jsp'" type="button" value="메인으로" />
                 <input type="submit" value="회원정보 수정" class="btn btn-primary" style="float:right"/>
			

		</form>
		<script>
            $(document).ready(function() {
				$("#changeUser").click(function() {
					$("#myModal").modal();
					$("#inputPassform").on("submit",function(){
						$.ajax({
							url:"check_pass_ajax.ks", //경로
							type:"post", //get, post
							dataType:"text", //text, json, xml
							data:{inputpass : $("#inputpass").val()},
							success:function(data){
								if(data==1){
									$("#changeform").submit();
								}
								else{
									alert("비밀번호를 확인해주세요");$(".close").on;
								}
							}, //성공시 처리
							error:function(xhr, textStatus, errorThrown){
								$(".p1").html(textStatus+"(HTTP-"+xhr.status+"");
							} //실패시 처리
						});//ajax
					});		
				});
            });
            </script>
	</div>
	<!-- container -->
</section>
<!-- useradd  -->
<%@ include file="../inc/footer.jsp"%>
