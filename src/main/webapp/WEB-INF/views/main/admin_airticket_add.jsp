<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="ticketadd">
	<div class="container">
		<h3>항공편 추가</h3>
		<h3 class="hidden">항공편 추가</h3>
		<form action="admin_airticket_add.ks" method="post" id="airAddForm"
			class="useradd">
			<fieldset class="addfield">
				<legend>항공권 정보</legend>
				<p class="first">
					<label for="company">항공사</label> <input type="text" name="company"
						id="company">
				</p>
				<p>
					<label for="name">편명</label> <input type="text" name="name"
						id="name">
				</p>
				<p>
					<label for="departure">출발지</label> <input type="text"
						name="departure" id="departure">
				</p>
				<p>
					<label for="arrival">도착지</label> <input type="text" name="arrival"
						id="arrival">
				</p>
				<p>
					<!-- select -->
					<label for="date">날짜</label> <input type="date" name="date"
						id="date">
				</p>
				<p>
					<!-- select -->
					<label for="dtime">출발시각</label> <input type="time" id="dtime"
						name="dtime">
				</p>
				<p>
					<label for="atime">도착시각</label> <input type="time" id="atime"
						name="atime">
				</p>
				<p>
					<label for="aprice">가격</label> <input type="text" id="aprice"
						name="aprice">
				</p>
				<p class="br_bottom">
					<label for="count">항공권 매수</label> <input type="text" id="count"
						name="count">
				</p>
			</fieldset>
			<!-- company,name,departure,arrival,date,dtime,atime,aprice,count  -->
			<a href="admin_airticket_list.ks" title="이전으로" id="prev" style="float: left;"
				class="btn btn-default">이전으로</a> <input type="submit" value="항공편추가" id="addTicket"
				title="항공편추가" style="float: right;" class="btn btn-primary" />
		</form>
	</div>
	<!-- container -->
</section>
<!-- ticketadd  -->
<%@ include file="../inc/footer.jsp"%>