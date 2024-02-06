<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../inc/header.jsp"%>
<div class="container" style="margin-top: 5%; min-height: 500px">
	<h3>글내용 수정하기</h3>
	<form action="board_edit.ks?bno=${dto.bno }" method="post"
		id="boardEditForm">
		<fieldset>
			<div class="form-group">
				<label for="bname">이름</label> <input type="text" name="bname"
					id="bname" class="form-control" value="${dto.bname }" readonly>
			</div>
			<div class="form-group">
				<label for="btitle">제목</label> <input type="text" name="btitle"
					id="btitle" class="form-control" value="${dto.btitle }">
			</div>
			<div class="form-group">
				<label for="bcontent">내용</label>
				<textarea name="bcontent" id="bcontent" cols="60" rows="10"
					class="form-control">${dto.bcontent }</textarea>
			</div>
			<div class="form-group">
				<a href="board_list.ks" class="btn btn-default">목록보기</a> <input
					type="button" value="수정하기" class="btn btn-primary" id="boardEdit"
					style="color: white; background-color: rgb(41, 128, 185); float: right;">
			</div>
		</fieldset>
	</form>
	<script>
	$(document).ready(function() {
		
				$("#boardEdit").on("click",function() {
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
								$("#boardEditForm").submit();
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
	</script>
	<!-- end form -->
</div>
<%@ include file="../inc/footer.jsp"%>