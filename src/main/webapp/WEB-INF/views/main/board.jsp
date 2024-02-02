<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="board">
	<div class="container">
		<h3>게시판</h3>
		<h3 class="hidden">게시판</h3>
		<div class="content">
		<form action="admin_board_delete.ks" method="post" id="boardDeleteForm">
			<fieldset>
			<table class="table table-striped">
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">제목</th>
						<th scope="col">글쓴이</th>
						<th scope="col">글쓴시각</th>
						<th scope="col">조회수</th>
						<c:choose>
						<c:when test="${userno==0 }">
							<th scope="col">선택</th>
						</c:when>
						</c:choose>
					</tr>
				</thead>
				<tbody style="text-align:center;">
					<c:forEach var="i" items="${paging.blist10 }" varStatus="status">
						
						<tr>
							<td>${paging.listTotal-paging.pstartno-status.index}</td>
							<td><a href='board_detail.ks?bno=${i.bno }'>${i.btitle }</a></td>
							<td>${i.bname }</td>
							<td>${i.bdate}</td>
							<td>${i.bhit }</td>
							<c:choose>
								<c:when test="${userno==0 }">
									<th><input type="checkbox" name="check" value="${i.bno }" style="width: 20%"></th>
								</c:when>
							</c:choose>
						</tr>
						<input type="text" class="hidden" readonly value="${i.bno }"/> 
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: center;">
				<ul class="pagination">
					<c:choose>
						<c:when test="${paging.startBtn!=1 }">
							<li><a
								href="board_list.ks?pstartno=${(paging.startBtn-(paging.onepagelimit+1))*paging.onepagelimit }">previous</a></li>
						</c:when>
					</c:choose>
					<c:forEach var="i" begin="${paging.startBtn }"
						end="${paging.endBtn }" step="1" varStatus="status">
						<li class="<c:if test='${i==paging.currentBtn}'>active</c:if>"><a href="board_list.ks?pstartno=${(i-1)*paging.onepagelimit }">${i}</a></li>
					</c:forEach>
					<c:choose>
						<c:when test="${paging.endBtn!=paging.pageAll }">
							<li><a
								href="board_list.ks?pstartno=${paging.endBtn*paging.onepagelimit }">Next</a></li>
						</c:when>
					</c:choose>
				</ul>
				<c:choose>
					<c:when test="${userno==0 }">
						<input type="button" value="글삭제" title="글삭제" style="float: left;" id="deleteBoard" class="btn btn-danger" />
						<a href="board_write_view.ks"   class="btn btn-primary" style="float: right;">글쓰기</a>
					</c:when>
					<c:when test="${userno!=null }">
						<a href="board_write_view.ks"   class="btn btn-primary" style="float: right;">글쓰기</a>
					</c:when>
				</c:choose>
				
			</div>
			</fieldset>
			</form>
		</div>
	</div>
	<script>
			$(document).ready(function() {
				$("#deleteBoard").click(function() {
					$("#myModal").modal();
				});
				$("#inputPassform").on("submit",function(){
					$.ajax({
						url:"check_pass_ajax.ks", //경로
						type:"post", //get, post
						dataType:"text", //text, json, xml
						data:{inputpass : $("#inputpass").val()},
						success:function(data){
							if(data==1){
								$("#boardDeleteForm").submit();
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
</section>
<!-- end board-->
<%@ include file="../inc/footer.jsp"%>
