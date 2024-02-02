<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cc9a08c3eb615d53638ed8318c926e6"></script>
<link rel="stylesheet" href="../css/reset.css" />
<link rel="stylesheet" href="../css/base.css" />
<link rel="stylesheet" href="../css/layout.css" />
<link rel="stylesheet" href="../css/mystyle.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/jquery.color.js"></script>
<script src="../js/myjs.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function() {
		$("#joinform1").on("submit", function() {
			let check1 = document.querySelector("#check1").checked;
			let check2 = document.querySelector("#check2").checked;
			if (check1 == false || check2 == false) {
				alert("동의여부를 확인해주세요");
				return false;
			}
			alert("회원가입 페이지로 넘어갑니다.");
		});
		$(function() {
			$("#writeform").on("submit", function() {
				let bname = $("#bname");
				let bpass = $("#bpass");
				let btitle = $("#btitle");
				let bcontent = $("#bcontent");
				let inputs = new Array();
				inputs.push(bname);
				inputs.push(bpass);
				inputs.push(btitle);
				inputs.push(bcontent);
				for (let i = 0; i < inputs.length; i++) {
					if (inputs[i].val() == "") {
						alert("빈칸을 채워주세요!");
						inputs[i].focus();
						return false;
						break;
					}
				}

			});
		});
		$("#editform").on("submit", function() {
			let bname = $("#bname");
			let bpass = $("#bpass");
			let btitle = $("#btitle");
			let bcontent = $("#bcontent");
			let inputs = new Array();
			inputs.push(bname);
			inputs.push(bpass);
			inputs.push(btitle);
			inputs.push(bcontent);
			for (let i = 0; i < inputs.length; i++) {
				if (inputs[i].val() == "") {
					alert("빈칸을 채워주세요!");
					inputs[i].focus();
					return false;
					break;
				}
			}
		});
		$("#deleteform").on("submit", function() {

			let bpass = $("#bpass");

			let inputs = new Array();
			inputs.push(bpass);
			for (let i = 0; i < inputs.length; i++) {
				if (inputs[i].val() == "") {
					alert("빈칸을 채워주세요!");
					inputs[i].focus();
					return false;
					break;
				}
			}
		});

	});

	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal1").modal();
		});
	});

	window.addEventListener(
					"load",
					function() {

						let form = document.getElementById("joinform");
						form.onsubmit = function() {

							let datavalue = [ "아이디", "이름", "비밀번호", "비밀번호확인",
									"이메일", "모바일", "우편번호", "상세주소1", "상세주소2" ]
							let inputText = document
									.querySelectorAll("#joinform input[type='text']");
							let inputPassword = document
									.querySelectorAll("#joinform input[type='password']");
							let inputRadio = document
									.querySelectorAll("#joinform input[type='radio']");
							let inputCheckbox = document
									.querySelectorAll("#joinform input[type='checkbox']");
							let inputSelect = document
									.querySelectorAll("#joinform select");

							let inputs = new Array();
							inputs.push(inputText[0]);
							inputs.push(inputText[1]);
							for (let i = 0; i < inputPassword.length; i++) {
								inputs.push(inputPassword[i]);
							}
							console.log(inputs);
							for (let i = 2; i < inputText.length; i++) {
								inputs.push(inputText[i]);
							}
							for (let i = 0; i < inputRadio.length; i++) {
								inputs.push(inputRadio[i]);
							}
							for (let i = 0; i < inputCheckbox.length; i++) {
								inputs.push(inputCheckbox[i]);
							}
							for (let i = 0; i < inputSelect.length; i++) {
								inputs.push(inputSelect[i]);
							}

							let reg_id = /^[a-zA-z0-9].{4,15}$/;
							let reg_pass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
							let reg_email = /^[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\w+\.)+\w+$/
							let reg_mobile = /^010(?:\d{3}|\d{4})\d{4}$/;

							for (let i = 0; i < 6; i++) {
								if (inputs[i].value == "") {
									alert(datavalue[i] + "의 빈칸을 채워주세요");
									inputs[i].focus();
									return false;
									break;
								}
								switch (i) {
								case 0:
									if (reg_id.test(inputs[0].value) == false) {
										alert("아이디는 영문, 숫자 4~15자리");
										inputs[0].focus();
										return false;
									}
									break;
								case 2:
									if (reg_pass.test(inputs[2].value) == false) {
										alert("비밀번호는 8~15글자 대문자1이상 +숫자 1이상 +특수문자 1이상 입력해주세요.");
										inputs[2].focus();
										return false;
									}
									break;
								case 3:
									if (inputs[2].value != inputs[3].value) {
										alert("비밀번호가 틀렸습니다.");
										inputs[2].value = " ";
										inputs[2].focus();
										return false;
									}
									break;
								case 4:
									if (reg_email.test(inputs[4].value) == false) {
										alert("이메일을 확인해주세요");
										inputs[3].focus();
										return false;
									}
									break;
								case 5:
									if (reg_mobile.test(inputs[5].value) == false) {
										alert("전화번호를 확인해주세요");
										inputs[4].focus();
										return false;
									}
									break;
								}

							}

							if (inputs[6].value == "") {
								alert("우편번호를 입력해주세요");
								search();
								return false
							}
							if (inputs[9].checked == false
									&& inputs[10].checked == false) {
								alert("SMS수신여부를 확인해주세요");
								inputs[9].focus();
								return false;
							}
							if($(".s1").text()=="중복아이디를 확인해주세요"||$(".s1").text()=="중복된 아이디입니다."){
								alert("아이디 중복체크를 해주세요!"); return false;
							}
							
						}
						
						let btn1 = document.querySelector("#dupcheck");
						let postcode = document.querySelector("#postcode");
						
						
						postcode.addEventListener("click", function() {
							search();
						})

					});

	let search = function() {
		new daum.Postcode({
			oncomplete : function(data) {
				//우편번호 : zonecode
				//주소 : address
				document.querySelector("#userpost").value = data.zonecode;
				document.querySelector('#useraddress1').value = data.address;
				document.querySelector("#useraddress2").focus();
			}
		}).open();
	}
	$(function() {
		//1. gnb_sub  안보이게 숨기기
		$(".header  .gnb_sub").hide();

		//2. li에 마우스를 올리면 해당 gnb_sub slideDown
		//3. li에 마우스를 올리면 해당 gnb_sub slideUp
		$(".header .navbar-nav  li").mouseover(function() {
			$(this).children(".gnb_sub").stop().slideDown();
		}).mouseout(function() {
			$(this).children(".gnb_sub").stop().slideUp();
		});
	});
	$(function(){
		$("#findIdform").on("submit",function(){
			
			let text = document.querySelectorAll("#findIdform input[type='text']");
			for (let i = 0; i < text.length; i++) {
				if (text[i].value == "") {
					alert("빈칸을 채워주세요");
					text[i].focus();
					return false;
					break;
				}
			}
		});
	});
	$(function(){
		$("#findPassform").on("submit",function(){
			
			let text = document.querySelectorAll("#findPassform input[type='text']");
			for (let i = 0; i < text.length; i++) {
				if (text[i].value == "") {
					alert("빈칸을 채워주세요");
					text[i].focus();
					return false;
					break;
				}
			}
		});
	});
	$(function(){
		$("#changePassform").on("submit",function(){
			
			let inputPassword = document.querySelectorAll("#changePassform input[type='password']");
			let reg_pass = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			for (let i = 0; i < inputPassword.length; i++) {
				if (inputPassword[i].value == "") {
					alert("빈칸을 채워주세요");
					inputPassword[i].focus();
					return false;
					break;
				}
				switch (i) {
				case 0:
					if (reg_pass.test(inputPassword[0].value) == false) {
						alert("비밀번호는 8~15글자 대문자1이상 +숫자 1이상 +특수문자 1이상 입력해주세요.");
						inputPassword[0].focus();
						return false;
					}
					break;
				case 1:
					if (inputPassword[1].value != inputPassword[0].value) {
						alert("비밀번호가 틀렸습니다.");
						inputPassword[1].value = " ";
						inputPassword[1].focus();
						return false;
					}
					break;
				}

			}
		});
	});
</script>