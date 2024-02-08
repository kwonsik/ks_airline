<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<section class="myreservation">
	<div class="container">
		<h3>모든 회원</h3>
		<h3 class="hidden">모든 회원</h3>
		<p>
			총 회원 - <span>${paging.listTotal }명</span>
		</p>
		<div class="content">
			<form action="admin_user_delete.ks" method="post" id="userDeleteForm">
			<fieldset>
			<table class="table table-borderd">
				<thead>
					<tr>
						<th scope="col">유저번호</th>
						<th scope="col">아이디</th>
						<th scope="col">이름</th>
						<th scope="col">이메일</th>
						<th scope="col">연락처</th>
						<th scope="col">가입날짜</th>
						<th scope="col">가입한ip</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody style="text-align: center;" class="tbody">
					<c:forEach var="i" items="${list }" varStatus="status">
						<tr>
							<td>${i.userno }</td>
							<td><a href='userdetail.ks?userno=${i.userno }'>${i.userid }</a></td>
							<td>${i.username}</td>
							<td>${i.useremail }</td>
							<td>${i.userphone }</td>
							<td>${i.time }</td>
							<td>${i.userip }</td>
							<td><input type="checkbox" name="check" value="${i.userno }"
								style="width: 20%" <c:if test='${i.userno==0 }'>disabled</c:if> ></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${paging.startBtn!=1 }">
							<li><a
								href="admin_user_list.ks?pstartno=${(paging.startBtn-(paging.onepagelimit+1))*paging.onepagelimit }&username=${param.username}">previous</a></li>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${paging.startBtn }"
						end="${paging.endBtn }" step="1" varStatus="status">
						<li class="<c:if test='${i==paging.currentBtn}'>active</c:if>"><a
							href="admin_user_list.ks?pstartno=${(i-1)*paging.onepagelimit }&username=${param.username}">${i}</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${paging.endBtn!=paging.pageAll }">
							<li><a
								href="admin_user_list.ks?pstartno=${paging.endBtn*paging.onepagelimit }&username=${param.username}">Next</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			 <a href="main.ks" title="이전으로" id="pay"
				style="float: left; color:white;" class="btn btn-primary">이전으로</a>
			<input type="button" value="유저강제탈퇴" title="유저강제탈퇴" style="float: right;"id="deleteUser" class="btn btn-danger" />
			</fieldset>
			</form>
			</div>
			 
			<div class="inner_search" style="text-align:center; " >
			
			  		<input type="text" name="username" id="username" title="이름 검색" placeholder="찾을 이름 검색">
			  		<input class="btn" type="button" value="검색" id="search">
			  		
			  
			</div>
					
		</div>
		
		
		
		<script>
			$(document).ready(function() {
				$("#deleteUser").click(function() {
					$("#myModal").modal();
				});
				$("#check_pass_ajax").on("click",function(){
					$.ajax({
						url:"check_pass_ajax.ks", //경로
						type:"post", //get, post
						dataType:"text", //text, json, xml
						data:{userpass : $("#inputpass").val()},
						success:function(data){
							if(data==1){
								$("#userDeleteForm").submit();
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
				
				$("#search").on("click",function(){
					let username=$("#username").val();
					location.href='admin_user_list.ks?username='+username;
				});
					
			});
		</script>
	
	<!-- container -->
</section>
<!-- myreservation  -->
<%@ include file="../inc/footer.jsp"%>

