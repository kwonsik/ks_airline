<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="myreservation">
	<div class="container">
		<h3>모든 항공편</h3>
		<h3 class="hidden">모든 항공편</h3>
		<p>
			총 항공편 - <span>${paging.listTotal }편</span>
		</p>
		${list }
		${paging}
		<div class="content">
			<form action="admin_airticket_delete.ks" method="post" id="airDeleteForm">
			<fieldset>
			<table class="table table-borderd">
				<thead>
					<tr>
						<th scope="col">항공사</th>
						<th scope="col">편명</th>
						<th scope="col">날짜</th>
						<th scope="col">출발지</th>
						<th scope="col">도착지</th>
						<th scope="col">출발시간</th>
						<th scope="col">도착시간</th>
						<th scope="col">가격</th>
						<th scope="col">남은 수</th>
						<th scope="col">운행 상태</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<c:forEach var="i" items="${list }" varStatus="status">
						<tr>
							<td>${i.company }</td>
							<td><a href='airticket_detail.ks?no=${i.no }'>${i.name }</a></td>
							<td>${i.date }</td>
							<td>${i.departure}</td>
							<td>${i.arrival }</td>
							<td>${i.dtime }</td>
							<td>${i.atime }</td>
							<td>${i.aprice }</td>
							<td>${i.count }</td>
							<c:choose>
								<c:when test="${i.state==1 }">
									<td>운행중</td>
								</c:when>
								<c:when test="${i.state==2 }">
									<td>운행중단</td>
								</c:when>
							</c:choose>
							
							<td><input type="checkbox" name="check" value="${i.no }"
								style="width: 20%"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${paging.startBtn!=1 }">
							<li><a
								href="admin_airticket_list.ks?pstartno=${(paging.startBtn-(paging.onepagelimit+1))*paging.onepagelimit }">previous</a></li>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${paging.startBtn }"
						end="${paging.endBtn }" step="1" varStatus="status">
						<li class="<c:if test='${i==paging.currentBtn}'>active</c:if>"><a
							href="admin_airticket_list.ks?pstartno=${(i-1)*paging.onepagelimit }">${i}</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${paging.endBtn!=paging.pageAll }">
							<li><a
								href="admin_airticket_list.ks?pstartno=${paging.endBtn*paging.onepagelimit }">Next</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			<input type="button" value="운행중지" title="운행중지" style="float: left;"
				id="delete" class="btn btn-danger" />
			<input type="button" value="운행재개" title="운행재개" style="float: left;"
				id="restart" class="btn btn-default" />
				 <a
				href="admin_airticket_add_view.ks" title="항공편추가" id="pay"
				style="float: right; color:white;" class="btn btn-primary">항공편추가</a>
			</fieldset>
			</form>
			</div>
			<!--  
			<div class="inner_search">
			  <input class="in_keyword" type="text" name="search_keyword" title="검색어 입력" value="">
			</div>
			<button class="sp_img bnt_search"><span class="blind">검색</span></button>-->
		  
			
		</div>
		
		
		
		<script>
			$(document).ready(function() {
				$("#delete").click(function() {
					$("#myModal").modal();
					$("#inputPassform").on("submit",function(){
						$.ajax({
							url:"check_pass_ajax.ks", //경로
							type:"post", //get, post
							dataType:"text", //text, json, xml
							data:{inputpass : $("#inputpass").val()},
							success:function(data){
								if(data==1){
									$("#airDeleteForm").submit();
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
					
				$("#restart").click(function() {
					$("#myModal").modal();
					$("#inputPassform").on("submit",function(){
						$.ajax({
							url:"check_pass_ajax.ks", //경로
							type:"post", //get, post
							dataType:"text", //text, json, xml
							data:{inputpass : $("#inputpass").val()},
							success:function(data){
								if(data==1){
									$("#airDeleteForm").attr("action","admin_airticket_restart.ks");
									$("#airDeleteForm").submit();
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
				/*
				$("#airDeleteForm").on("submit",function(){
					let check=document.querySelectorAll;
					if(check[0].value==""&&check[1].value==""&&check[2].value==""&&check[3].value==""&&
							check[4].value==""&&check[5].value==""&&check[6].value==""&&check[7].value==""&&
							check[8].value==""&&check[9].value==""&&check[10].value==""){
						alert('체크박스를 하나는 선택해주세요!'); return false;
					}
				});
				*/
			});
		</script>

	
	<!-- container -->
</section>
<!-- myreservation  -->
<%@ include file="../inc/footer.jsp"%>

