<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="myreservation">
	<div class="container">
		<h3>나의 예약 조회</h3>
		<h3 class="hidden">>나의 예약 조회</h3>
		<p>
			총 예약 - <span>${list.size() }건</span>
		</p>
		<div class="content">

			<table class="table table-borderd">
				<thead>
					<tr>
						<th scope="col">예약번호</th>
						<th scope="col">예매날짜</th>
						<th scope="col">총 가격</th>
						
					</tr>

				</thead>
				<tbody>
					<c:forEach var="i" items="${list }" varStatus="status">						
						<tr>
							<td><a href="reservation_detail.ks?time=${i.time }&&rpno=${i.rpno }">${i.rpno }</a></td>
							<td>${i.time }</td>
							<td>${i.price }</td>						
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!--  
		<div class="page">
			<a href="#" class="glyphicon glyphicon-chevron-left"></a> <a href="#">1페이지</a>
			<a href="#" class="glyphicon glyphicon-chevron-right"></a>
		</div>
		-->
	</div>
	<!-- container -->
</section>
<!-- myreservation  -->
<%@ include file="../inc/footer.jsp"%>