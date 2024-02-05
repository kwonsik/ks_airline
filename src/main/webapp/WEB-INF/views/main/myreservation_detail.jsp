<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="myreservation">
	<div class="container">
		<h3>나의 예약 조회</h3>
		<h3 class="hidden">>나의 예약 조회</h3>
		<p>
			예약 - <span>${list.size()}건</span>
		</p>
		<div class="content">
			<form action="pay.ks" method="post" id="pay">
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
						<th scope="col">상태</th>
						<th scope="col">선택</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="i" items="${list }" varStatus="status">
					<tr>
						<td>${i.company }</td>
						<td>${i.name }</td>
						<td>${i.date }</td>
						<td>${i.departure }</td>
						<td>${i.arrival }</td>
						<td>${i.dtime }</td>			
						<td>${i.atime }</td>
						<td>${i.price }</td>
						<c:choose>
							<c:when test="${i.state==1 }"><td>확정대기</td></c:when>
							<c:when test="${i.state==2 }"><td>예매확정</td></c:when>
							<c:when test="${i.state==3 }"><td>취소됨</td></c:when>
						</c:choose>
						<td><input type="checkbox" name="rno" value="${i.rno }" style="width:20%"
						<c:if test="${i.state=='3'}">disabled</c:if>
						></td>
					</tr>
				</c:forEach>
				</tbody>				
			</table>
			<input type="submit" value="취소" title="취소합니다" id="cancle" style="float: left;" class="btn btn-danger"/>
			<input type="submit" value="결제" title="결제합니다" id="pay" style="float: right;" class="btn btn-primary"/>
			</fieldset>
			</form>
		</div>
		<!--  
		<div class="page">
			<a href="#" class="glyphicon glyphicon-chevron-left"></a> <a href="#">1페이지</a>
			<a href="#" class="glyphicon glyphicon-chevron-right"></a>		
		</div>
		-->
		<script>
			$(function(){
				 $("#cancle").on("click",function(){
					 	$("#pay").attr("action","reservationCancle.ks");
					 	$("#pay").attr("id","reservationCancle");
	                });
			});
			
		</script>
	</div>
	<!-- container -->
</section>
<!-- myreservation  -->
<%@ include file="../inc/footer.jsp"%>

