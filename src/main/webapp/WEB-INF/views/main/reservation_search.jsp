<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<style>
.table>thead>tr>th {
	text-align: center;
}

.table>tbody>tr>td {
	text-align: center;
}
</style>

<section class="reservation_search">

	<div class="container">
		<form action="reservation.ks" method="post">
			<fieldset>
				<h3>항공권 조회</h3>
				<h3 class="hidden">항공권 조회</h3>
				<input type="hidden" value="${param.kid }" name="kid">
				<input type="hidden" value="${param.kid }" name="adult">
				<div class="content">
					<table class="table table-borderd">
						<caption>가는 비행기</caption>
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
								<th scope="col">선택</th>
							</tr>

						</thead>
						<tbody>

							<c:forEach var="i" items="${list1 }" varStatus="status">
								<tr>
									<td>${i.company }</td>
									<td>${i.name }</td>
									<td>${i.date }</td>
									<td>${i.departure }</td>
									<td>${i.arrival }</td>
									<td>${i.dtime }</td>
									<td>${i.atime }</td>
									<td>${i.aprice }</td>
									<td><input type="radio" name="select" class="select"
										value="${i.no }"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<c:choose>
					<c:when test="${list2!=null}">
						<div class="content">
							<table class="table table-borderd">
								<caption>오는 비행기</caption>
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
										<th scope="col">선택</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="i" items="${list2 }" varStatus="status">
										<tr>
											<td>${i.company }</td>
											<td>${i.name }</td>
											<td>${i.date }</td>
											<td>${i.departure }</td>
											<td>${i.arrival }</td>
											<td>${i.dtime }</td>
											<td>${i.atime }</td>
											<td>${i.aprice }</td>
											<td><input type="radio" name="select2" class="select2"
												value="${i.no }"></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</c:when>
				</c:choose>


				<div>
					<input type="button" onclick="location.href='main.ks'" value="이전" class="btn btn-default"/>
					<input type="submit" value="예약" title="예약" style="float: right;" class="btn btn-primary"/>
				</div>
			</fieldset>
		</form>
	</div>
	<!-- container -->
</section>
<!-- useradd  -->
<%@ include file="../inc/footer.jsp"%>