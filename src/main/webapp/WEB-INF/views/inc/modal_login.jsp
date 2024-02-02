<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<!-- Trigger the modal with a button -->


	<!-- Modal -->
	<div class="modal fade" id="myModal1" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4>
						<span class="glyphicon glyphicon-lock"></span> 로그인
					</h4>
				</div>
				<div class="modal-body" style="padding: 40px 50px;">
					<form action="login.ks" method="post">
						<div class="form-group">
							<label for="username"><span
								class="glyphicon glyphicon-user"></span></label> 아이디 <input type="text"
								class="form-control" id="username" name="userid"
								placeholder="아이디 입력">
						</div>
						<div class="form-group">
							<label for="psw"><span
								class="glyphicon glyphicon-eye-open"></span> 비밀번호</label> <input
								type="password" class="form-control" id="psw" name="userpass"
								placeholder="비밀번호 입력">
						</div>
						<button type="submit" class="btn btn-success btn-block">
							<span class="glyphicon glyphicon-off"></span> 로그인
						</button>
					</form>
				</div>
				<div class="modal-footer">
					<button type="submit" class="btn btn-danger btn-default pull-left"
						data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span> 취소
					</button>
					<p>
						<a href="join1.ks">회원가입</a>
					</p>
					<p>
						<a href="findId_view.ks">아이디 찾기</a>
					</p>
					<p>
						<a href="findPass_view.ks">비밀번호 찾기</a>
					</p>
				</div>
			</div>

		</div>
	</div>
</div>
<!-- end login-->