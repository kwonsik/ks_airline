<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<section class="ticketdetail">
	<div class="container">
		<h3>항공편 상세보기</h3>
		<h3 class="hidden">항공편 상세보기</h3>
		<form action="admin_airticket_edit_view.ks?no=${dto.no }" method="post" id="airDetailForm"
			class="useradd">
			<fieldset class="addfield">
				<legend>항공권 정보</legend>
				<p  class="first">
					<label for="no">항공권 고유번호</label> <input type="text" name="no"
						id="no" readonly value="${dto.no }">
				</p>
				<p>
					<label for="company">항공사</label> <input type="text" name="company"
						id="company" readonly value="${dto.company }">
				</p>
				
				<p>
					<label for="name">편명</label> <input type="text" name="name"
						id="name" readonly value="${dto.name }">
				</p>
				<p>
					<label for="departure">출발지</label> <input type="text"
						name="departure" id="departure" readonly value="${dto.departure }">
				</p>
				<p>
					<label for="arrival">도착지</label> <input type="text" name="arrival"
						id="arrival" readonly value="${dto.arrival }">
				</p>
				<p>
					<!-- select -->
					<label for="date">날짜</label> <input type="date" name="date"
						id="date" readonly value="${dto.date }">
				</p>
				<p>
					<!-- select -->
					<label for="dtime">출발시각</label> <input type="time" id="dtime"
						name="dtime" readonly value="${dto.dtime }">
				</p>
				<p>
					<label for="atime">도착시각</label> <input type="time" id="atime"
						name="atime" readonly value="${dto.atime }">
				</p>
				<p>
					<label for="aprice">가격</label> <input type="text" id="aprice"
						name="aprice" readonly value="${dto.aprice }">
				</p>
				<p>
					<label for="count">항공권 매수</label> <input type="text" id="count"
						name="count" readonly value="${dto.count }장">
				</p>
				<p class="br_bottom">
					<label for="addtime">항공권 추가/수정 시각</label> <input type="text" id="addtime"
						name="addtime" readonly value="${dto.addtime }">
				</p>
			</fieldset>
			<!-- no company name departure arrival date dtime atime aprice kprice count addtime -->
			<a href="admin_airticket_list.ks" title="이전으로" id="prev" style="float: left;"
				class="btn btn-default">이전으로</a> <input type="submit" value="항공권수정" id="edit_view"
				title="항공편추가" style="float: right;" class="btn btn-primary" />
		</form>
	</div>
	<!-- container -->
</section>
<!-- ticketdetail  -->
<%@ include file="../inc/footer.jsp"%>