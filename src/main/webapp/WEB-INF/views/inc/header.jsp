<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Theme Made By www.w3schools.com -->
<title>항공사어플</title>
<meta charset="utf-8">
<%@ include file="../inc/script.jsp"%>
<style>
* {
	margin: 0;
	padding: 0;
}

li {
	list-style-type: none;
}

.header {
	height: 56px; /* background-color:#000;  */
}

.banner {
	height: 600px;
	background-color: #666;
}

.channel {
	height: 600px;
	background-color: #ccc;
}
/*  base.css  */
body {
	font-family: 'Noto Sans KR', sans-serif;
	background-color: white;
	color: #000;
}

a:link, a:visited {
	color: #000;
	text-decoration: none;
}

a:hover, a:focus {
	color: #ff6900;
	text-decoration: underline;
}

/*  style.css  */
.basic {
	width: 80%;
	margin: 50px auto;
	padding: 50px;
	background-color: white;
	border-top: 5px solid #ddd;
}

.myhidden {
	position: absolute;
	left: -9999%;
	width: 1px;
	height: 1px;
	overflow: hidden;
	font-size: 0;
	line-height: 0;
}

/*   header  */
/*   header  */
/* 노트북 & 테블릿 가로 (해상도 1024px ~ 1279px)*/
@media all and (min-width:1024px) and (max-width:1680px) {
	.visual {
		width: 100%;
		height: 20%
	}
}

/* 테블릿 가로 (해상도 768px ~ 1023px)*/
@media all and (min-width:768px) and (max-width:1023px) {
	.visual {
		height: 310px
	}
}

/* 모바일 가로 & 테블릿 세로 (해상도 480px ~ 767px)*/
@media all and (min-width:480px) and (max-width:767px) {
	.header {
		height: 56px;
	}
	.visual {
		height: 200px
	}
}

/* 모바일 세로 (해상도 ~ 479px)*/
@media all and (max-width:479px) {
	.header {
		height: 56px;
	}
	.visual {
		height: 150px
	}
}

#logo img {
	height: 80px;
	overflow: hidden;
}

.footer li {
	display: inline-block;
}

.footer .container {
	width: 900px;
}

.visual {
	clear: both;
}

.visual img {
	width: 100%;
}

.visual .container {
	padding: 0;
}

.carousel-inner>.item>a>img, .carousel-inner>.item>img, .img-responsive,
	.thumbnail a>img, .thumbnail>img {
	height: 700px;
}

.navbar.navbar-inverse .container {
	height: 80px;
}

.navbar.navbar-inverse .container img {
	width: 120px;
}

.navbar.navbar-inverse .container a {
	height: 80px;
	line-height: 40px;
	font-size: 18px;
	width: 160px;
	text-align: center;
}

.footer {
	background-color: white;
	color: black;
	height: 350px;
	clear: both;
	padding-top: 50px;
}

.footer .top  a {
	color: #000;
	display: inline-block;
	padding: 0 10px 0 10px;
	border-right: 1px solid black;
}

.footer .top {
	padding-bottom: 25px;
}

#top-last {
	border-right: none;
}

.line {
	border-top: 1px solid gray;
}

.footer .center {
	padding-top: 25px;
}

.footer .center a {
	color: #000;
	display: inline-block;
	padding: 0 10px 0 10px;
	border-right: 1px solid black;
}

#center-last {
	border-right: none;
	padding-right: 335px;
}

.footer .center .glyphicon {
	border-right: none;
}

.bottom {
	padding-top: 25px;
}

.address, .copy {
	padding-left: 10px;
}

.header .navbar-inverse {
	background-color: white;
	border-radius: 0px;
	border: 0 none;
}

.header h2 {
	margin: 0;
}

.header .navbar-inverse .navbar-brand, .header .navbar-inverse .navbar-nav>li>a
	{
	border-bottom: 3px solid #fff;
	color: #333;
	font-weight: 600;
}

.header .navbar-inverse .navbar-nav>li>a:hover, .header .navbar-inverse .navbar-nav>li>a:focus
	{
	border-bottom: 3px solid darkblue;
	transition: border .2s ease-in-out;
}

.navbar-brand {
	height: 80px;
}

.btn-group-lg>.btn, .btn-lg {
	margin-top: 22px;
	padding: 5px;
	font-size: 30px;
}

/*  header-GNB    */
/*  header-GNB    */
.header .navbar-nav>li {
	position: unset;
}

.header .gnb_sub {
	width: 100%;
	position: absolute;
	left: 0;
	background-color: whitesmoke;
	height: 90px;
	padding-top: 10px;
	text-align: center;
	z-index: 10; /*   visual 추가시 화면에서 안보임 - 대상,대상이 position  */
}

.header .gnb_sub li {
	display: inline-block;
	width: 240px;
}

.header .gnb_sub>li span {
	display: block;
	width: 100%;
	font-size: 18px;
	font-weight: bold;
	margin: 10px 0;
}

/*    index      */
.carousel-control.left, .carousel-control.right {
	background-image: none;
	color: black;
}

.carousel-control .glyphicon-chevron-left, .carousel-control .glyphicon-chevron-right
	{
	width: 22px;
	height: 22px;
	font-size: 18px;
	background-color: white;
	border-radius: 5px;
}

.carousel-indicators li {
	margin: 0;
} /* ## */
.carousel-indicators li, .carousel-indicators .active {
	display: inline-block;
	width: 40px;
	height: 4px;
	cursor: pointer;
	background-color: gray;
	border: 0 none;
	border-radius: 0px
}

.carousel-indicators .active {
	background-color: white;
}

.carousel-control {
	text-shadow: none;
	font-weight: bold;
}

.modal-header, h4, .close {
	background-color: skyblue;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}

.btn-success {
	background-color: skyblue;
	border: none;
}

/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype  a:link, a:visited {
	color: #000;
	text-decoration: none;
}

.prototype {
	width: 80%;
	margin: 50px auto;
	padding: 30px;
	background-color: white;
}

.prototype	h3 {
	margin: 10px 0;
	font-weight: bold;
	text-indent: 1em;
	margin-bottom: 50px;
}

.prototype	form {
	width: 100%;
}

.prototype .useradd	fieldset {
	border: 0 none;
	margin: 50px 0;
}

.prototype	legend {
	font-weight: bold;
	margin-bottom: 20px;
	border-bottom: none;
}

.prototype	form p {
	text-align: left;
	width: 100%;
	margin: 0;
	padding: 15px;
	background-color: #fff;
	border: 1px solid #ddd;
	border-bottom: none;
}

.prototype	form p.center {
	text-align: center;
}

.prototype .useradd .required {
	color: rgb(41, 128, 185);
}

.prototype .useradd label, .prototype .reservation label {
	display: inline-block;
	text-align: left;
	width: 12%;
	text-transform: uppercase;
}

.prototype .useradd input {
	width: 24%;
	background-color: white;
}

.prototype .useradd input, .prototype .reservation input[type='text'],
	input[type='password'], input[type='email'] 
.prototype .useradd {
	width: 25%;
	padding: 3px 8px;
	background-color: #efece7;
	border: 1px solid #a19197;
	line-height: 20px;
}

.prototype .useradd input[type='button'], .prototype.useradd input[type="submit"]
	{
	width: 15%;
	padding: 5px;
	background-color: rgb(41, 128, 185);
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.prototype .useradd	input[type='radio'], input[type='checkbox'] {
	width: 7%;
}

.prototype	.br_bottom {
	border-bottom: 1px solid #ddd;
}

.prototype .useradd .addinfo_title {
	display: inline-block;
	width: 12%;
}

.prototype .useradd .addinfo_desc {
	display: inline-block;
	width: 20%;
}

.prev {
	display: inline-block;
	width: 100%;
}

.prototype .useradd .prev input[type='button'] {
	float: left;
	background-color: grey;
}

.prototype .useradd .prev input[type='submit'] {
	float: right;
	width: 15%;
	padding: 5px;
	background-color: rgb(41, 128, 185);
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.useradd .first, .findid .first, .findpassword .first {
	border-top: 3px solid grey;
}

#useraddress2 {
	width: 80%;
}

#useraddress2 {
	margin: 1% 12.5%;
}

#useraddress22 {
	width: 80%;
}

#useraddress22 {
	margin: 1% 12.5%;
}
/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype .findid	fieldset {
	border: 0 none;
	margin: 50px 0;
}

.prototype .findid label {
	display: inline-block;
	text-align: left;
	width: 12%;
	text-transform: uppercase;
}

.prototype .findid input {
	width: 24%;
	background-color: white;
}

.prototype .findid input, .prototype .findid input[type='text'], input[type='password'],
	input[type='email'] 
.prototype .findid {
	width: 25%;
	padding: 3px 8px;
	background-color: #efece7;
	border: 1px solid #a19197;
	line-height: 20px;
}

.prototype .findid .prev input[type='button'] {
	float: left;
	width: 15%;
	padding: 5px;
	background-color: grey;
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.prototype .findid .prev input[type='submit'] {
	float: right;
	width: 15%;
	padding: 5px;
	background-color: rgb(41, 128, 185);
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.prototype .findid	input[type='radio'], input[type='checkbox'] {
	width: 7%;
}

/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype .findpassword	fieldset {
	border: 0 none;
	margin: 50px 0;
}

.prototype .findpassword label {
	display: inline-block;
	text-align: left;
	width: 12%;
	text-transform: uppercase;
}

.prototype .findpassword input {
	width: 24%;
	background-color: white;
}

.prototype .findpassword input, .prototype .findpassword input[type='text'],
	input[type='password'], input[type='email'] 
.prototype .findpassword {
	width: 25%;
	padding: 3px 8px;
	background-color: #efece7;
	border: 1px solid #a19197;
	line-height: 20px;
}

.prototype .findpassword .prev input[type='button'] {
	float: left;
	width: 15%;
	padding: 5px;
	background-color: grey;
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.prototype .findpassword .prev input[type='submit'] {
	float: right;
	width: 15%;
	padding: 5px;
	background-color: rgb(41, 128, 185);
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.prototype .findpassword	input[type='radio'], input[type='checkbox'] {
	width: 7%;
}

/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype .reservation p {
	border: none;
}

.prototype .reservation input[type="radio"] {
	width: 13px;
	padding-left: 4%;
}

.prototype .reservation input, .prototype .reservation select {
	width: 12%;
}

.prototype .reservation form {
	border: 1px solid grey;
	padding: 30px 40px;
	border-top: 3px solid grey;
}

.prototype .reservation span {
	padding: 4%;
}

.prototype .reservation .search {
	display: block;
	text-align: center;
	padding-top: 20px;
}

.prototype .reservation .search input {
	width: 15%;
	padding: 5px;
	background-color: rgb(41, 128, 185);
	border-radius: 5px;
	border: 0 none;
	color: white;
}
/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.btn-block:hover {
	background-color: rgb(41, 128, 185);
}
/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype .myreservation .content {
	border: none;
}

.myreservation .content th, .myreservation .content td {
	text-align: center;
}

.table>caption+thead>tr:first-child>td, .table>caption+thead>tr:first-child>th,
	.table>colgroup+thead>tr:first-child>td, .table>colgroup+thead>tr:first-child>th,
	.table>thead:first-child>tr:first-child>td, .table>thead:first-child>tr:first-child>th
	{
	border-top: 3px solid grey;
	border-bottom: 2px solid #ccc;
	padding: 20px;
	font-size: 20px;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	border: none;
	border-bottom: 2px dashed #ddd;
	font-size: 15px;
}

.myreservation .content {
	font-size: 20px;
	text-align: center;
}

.myreservation .container .glyphicon {
	color: #aaa;
}

.myreservation p {
	font-size: 16px;
	font-weight: bold;
}

.myreservation p>span {
	color: rgb(41, 128, 185);
}

.prototype .page {
	font-size: 20px;
	text-align: center;
}
/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype .alluserinfo .content {
	border: none;
}

.alluserinfo .content th, .alluserinfo .content td {
	text-align: center;
}

.table>caption+thead>tr:first-child>td, .table>caption+thead>tr:first-child>th,
	.table>colgroup+thead>tr:first-child>td, .table>colgroup+thead>tr:first-child>th,
	.table>thead:first-child>tr:first-child>td, .table>thead:first-child>tr:first-child>th
	{
	border-top: 3px solid grey;
	border-bottom: 2px solid #ccc;
	padding: 20px;
	font-size: 20px;
}

.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td, .table>thead>tr>th {
	border: none;
	border-bottom: 2px dashed #ddd;
	font-size: 15px;
}

.alluserinfo .content {
	font-size: 20px;
	text-align: center;
}

.alluserinfo .container .glyphicon {
	color: #aaa;
}

.alluserinfo p {
	font-size: 16px;
	font-weight: bold;
}

.alluserinfo p>span {
	color: rgb(41, 128, 185);
}

/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/


.board th {
	text-align: center;
}
/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.reservation_result .content {
	font-size: 20px;
	text-align: center;
}

.reservation_result .container .glyphicon {
	color: #aaa;
}

.reservation_result p {
	font-size: 16px;
	font-weight: bold;
}

.reservation_result p>span {
	color: rgb(41, 128, 185);
}

.reservation_result th {
	text-align: center;
}
/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
.prototype .userdetail .required {
	color: rgb(41, 128, 185);
}

.prototype .userdetail label, .prototype .reservation label {
	display: inline-block;
	text-align: left;
	width: 12%;
	text-transform: uppercase;
}

.prototype .userdetail input {
	width: 24%;
	background-color: white;
}

.prototype .userdetail input, .prototype .reservation input[type='text'],
	input[type='password'], input[type='email'] 
.prototype .userdetail {
	width: 25%;
	padding: 3px 8px;
	background-color: #efece7;
	border: 1px solid #a19197;
	line-height: 20px;
}

.prototype .userdetail input[type='button'], .prototype.userdetail input[type="submit"]
	{
	width: 15%;
	padding: 5px;
	background-color: rgb(41, 128, 185);
	border-radius: 5px;
	border: 0 none;
	color: white;
	margin: 0 5px;
}

.prototype .userdetail	input[type='radio'], input[type='checkbox'] {
	width: 7%;
}

.allreservation th {
	text-align: center;
}

.allreservation table {
	text-align: center;
}

/*********************************************************************************************************************************************************/
/*********************************************************************************************************************************************************/
#psw {
	display: block;
	width: 100%;
	height: 34px;
	padding: 6px 12px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}

#text1, #text2 {
	display: block;
	padding: 20px;
	border: 1px solid #ccc;
	width: 90%;
	height: 200px;
	color: #8f8f8f;
	line-height: 150%;
	font-size: 11px;
	margin: 20px;
	background-color: #eee;
	resize: none;
}

.jf1 input[type='checkbox'] {
	position: relative;
	float: right;
	top: 5px;
}

.btn-group-lg>.btn, .btn-lg {
	font-size: 15px;
}

.introduce .m1 {
	display: block;
	padding-top: 50px;
}

.btn-default, .btn-primary, .btn-danger {
	width: 15%
}
	#addTicket,#edit_view{
		    display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    -ms-touch-action: manipulation;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    border-radius: 4px;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    width: 15%;
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
	}
</style>

</head>
<body>
	<div class="container">
			<!-- Modal -->
			<div class="modal fade" id="myModal" role="dialog">
				
				<div class="modal-dialog">				
					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">비밀번호 입력</h4>
						</div>
						<p style="text-align: center;">
							<!-- select -->
							<label for="inputpass">비밀번호</label> <input type="password"
								name="userpass" id="inputpass">
						</p>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" style="float: left"
								data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-primary" id="check_pass_ajax">확인</button>
						</div>
					</div>				
				</div>
				
			</div>
		</div>
	<div class="prototype">
		<header class="header">
			<h1 class="myhidden">prototype</h1>
			<!-- gnb -->
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<div class="container">
					<div class="navbar-header">
						<h2>
							<a class="navbar-brand" href="main.ks" style="padding: 0;"> <span
								class="myhidden">주메뉴</span> <span class="logo_wrapper"> <span
									class="logo_img"><img src="${pageContext.request.contextPath}/resources/images/airplanelogo.jpg"
										alt=""></span>
							</span>
							</a>
						</h2>
					</div>
					<ul class="nav navbar-nav">
						<c:choose>
							<c:when test="${userno==0 }">
								<li><a href="admin_airticket_list.ks">항공편 관리</a></li>
								<li><a href="admin_reservation_list.ks">예약 관리</a></li>
								<li><a href="admin_user_list.ks">회원 관리</a></li>
								<li><a href="board_list.ks">게시판</a></li>
								<%-- 
								<li><a href='#'>마이페이지</a>
									<ul class='gnb_sub'>
										<li><a href='userdetail.ks'> <span
												class='glyphicon glyphicon-user'></span> <span>나의 정보
													보기</span>
										</a></li>
										<li><a href='myreservation.ks'> <span
												class='glyphicon glyphicon-list-alt'></span> <span>나의
													예약 조회</span>
										</a></li>
									</ul></li>
								--%>
							<!-- end  관리자페이지  -->
							</c:when>
							
							<c:when test="${userno!=0&&userno!=null }">
								<li><a href="reservation_view.ks">항공권예약</a></li>
								<li><a href='#'>마이페이지</a>
									<ul class='gnb_sub'>
										<li><a href='userdetail.ks?userno=${userno }'> <span
												class='glyphicon glyphicon-user'></span> <span>나의 정보
													보기</span>
										</a></li>
										<li><a href='myreservation.ks?userno=${userno }'> <span
												class='glyphicon glyphicon-list-alt'></span> <span>나의
													예약 조회</span>
										</a></li>
										
									</ul></li>
									<li><a href="board_list.ks">게시판</a></li>
						<!-- end 게시판 -->
								
								<!-- end  사용자페이지  -->
							</c:when>
							
							<c:when test="${userno==null }">
								<li><a href="board_list.ks">게시판</a></li>
						<!-- end 게시판 -->
								
						<!-- end 항공사소개 -->
								<!-- end  사용자페이지  -->
							</c:when>
							
						</c:choose>
						<li><a href="introduce.ks">항공사소개</a></li>
					</ul>

					<ul class="nav navbar-nav navbar-right">
						<li><c:choose>
								<c:when test="${userno!=null }">
									<span class="btn btn-lg"
										onclick="location.href='logout.ks'" style="border: none;">로그아웃</span>
								</c:when>
								<c:otherwise>
									<span class='btn btn-lg' id='myBtn'
										style='border: none;'>로그인</span>
								</c:otherwise>
							</c:choose></li>
					</ul>


				</div>
			</nav>
		</header>
		<!-- end header-->