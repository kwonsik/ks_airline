<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="myreservation">
	<div class="container">
		<h3>모든 예약</h3>
		<h3 class="hidden">모든 예약</h3>
		<p>
			총 예약 - <span>${paging.listTotal }건</span>
		</p>
		<div class="content">
			<form action="admin_airticket_delete.ks" method="post" id="airDeleteForm">
			<fieldset>
			<table class="table table-borderd">
				<thead>
					<tr>
						<th scope="col">예약번호</th>
						<th scope="col">예약자</th>
						<th scope="col">항공편</th>
						<th scope="col">예약시간</th>
						<th scope="col">가격</th>
						<th scope="col">성인/소아</th>
						<th scope="col">예약상태</th>
					</tr>
				</thead>
				<tbody style="text-align: center;">
					<c:forEach var="i" items="${list }" varStatus="status">
						<tr>
							<td>${i.rno }</td>
							<td><a href='userdetail.ks?userno=${i.userno }'>${i.userno }</a></td>
							<td><a href='admin_airticket_detail.ks?no=${i.no }'>${i.no }</a></td>
							<td>${i.time}</td>
							<td>${i.price }</td>
							<c:choose>
								<c:when test="${i.adult=='A' }">
									<td>성인</td>
								</c:when>
								<c:when test="${i.adult=='K' }">
									<td>소아</td>
								</c:when>
							</c:choose>

							<c:choose>
								<c:when test="${i.state==1 }">
									<td>결제대기</td>
								</c:when>
								<c:when test="${i.state==2 }">
									<td>결제완료</td>
								</c:when>
								<c:when test="${i.state==3 }">
									<td>취소됨</td>
								</c:when>
							</c:choose>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${paging.startBtn!=1 }">
							<li><a
								href="admin_reservation_list.ks?pstartno=${(paging.startBtn-(paging.onepagelimit+1))*paging.onepagelimit }">previous</a></li>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${paging.startBtn }"
						end="${paging.endBtn }" step="1" varStatus="status">
						<li class="<c:if test='${i==paging.currentBtn}'>active</c:if>"><a
							href="admin_reservation_list.ks?pstartno=${(i-1)*paging.onepagelimit }">${i}</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${paging.endBtn!=paging.pageAll }">
							<li><a
								href="admin_reservation_list.ks?pstartno=${paging.endBtn*paging.onepagelimit }">Next</a></li>
						</c:when>
					</c:choose>
				</ul>
			</div>
			</fieldset>
			</form>
			</div>
			<!--  
			<div class="inner_search">
			  <input class="in_keyword" type="text" name="search_keyword" title="검색어 입력" value="">
			</div>
			<button class="sp_img bnt_search"><span class="blind">검색</span></button>-->
		  
			
		</div>
		
		

	
	<!-- container -->
</section>
<!-- myreservation  -->
<%@ include file="../inc/footer.jsp"%>

