<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="myreservation">
	<div class="container">
		<h3>나의 예약 조회</h3>
		<h3 class="hidden">>나의 예약 조회</h3>
		<p>
			총 예약 - <span>${list1.size()}건</span>
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
				<c:forEach var="i" begin="0"  end="${list1.size()-1 }" varStatus="status">
					<tr>
						<td>${list1[i].company }</td>
						<td>${list1[i].name }</td>
						<td>${list1[i].date }</td>
						<td>${list1[i].departure }</td>
						<td>${list1[i].arrival }</td>
						<td>${list1[i].dtime }</td>			
						<td>${list1[i].atime }</td>
						<td>${list2[i].price }</td>
						<c:choose>
							<c:when test="${list2[i].state==1 }"><td>확정대기</td></c:when>
							<c:when test="${list2[i].state==2 }"><td>예매확정</td></c:when>
							<c:when test="${list2[i].state==3 }"><td>취소됨</td></c:when>
						</c:choose>
						<td><input type="checkbox" name="check" value="${list2[i].rno }" style="width:20%"></td>
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
					 	$("#pay").attr("action","cancle.ks");
					 	$("#pay").attr("id","cancle");
	                });
			});
			
		</script>
	</div>
	<!-- container -->
</section>
<!-- myreservation  -->
<%@ include file="../inc/footer.jsp"%>

