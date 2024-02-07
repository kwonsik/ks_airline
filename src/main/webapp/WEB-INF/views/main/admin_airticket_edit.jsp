<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="ticketedit">
	<div class="container">
		<h3>항공편 수정</h3>
		<h3 class="hidden">항공편 수정</h3>
		<form action="admin_airticket_edit.ks?no=${dto.no }" method="post" id="airEditForm"
			class="useradd">
			<fieldset class="addfield">
				<legend>항공권 정보</legend>

				<p  class="first">
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
						id="date" value="${dto.date }">
				</p>
				<p>
					<!-- select -->
					<label for="dtime">출발시각</label> <input type="time" id="dtime"
						name="dtime" value="${dto.dtime }">
				</p>
				<p>
					<label for="atime">도착시각</label> <input type="time" id="atime"
						name="atime" value="${dto.atime }">
				</p>
				<p>
					<label for="aprice">가격</label> <input type="text" id="aprice"
						name="aprice" value="${dto.aprice }">
				</p>
				<p class="br_bottom">
					<label for="count">항공권 매수</label> <input type="text" id="count"
						name="count" value="${dto.count }">
				</p>

			</fieldset>
			<!-- no company name departure arrival date dtime atime aprice kprice count addtime -->			
		</form>
		<a href="admin_airticket_list.ks" title="이전으로" id="prev" style="float: left;"
				class="btn btn-default">이전으로</a> <input type="button" value="수정하기" id="edit"
				title="항공편수정" style="float: right;" class="btn btn-primary" />
	</div>
	<script>
			$(document).ready(function() {
				$("#edit").click(function() {
					$("#airEditForm").submit();
				});
						
			});
		</script>
	<!-- container -->
</section>
<!-- ticketedit  -->
<%@ include file="../inc/footer.jsp"%>

