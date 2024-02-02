<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>

<section>
            <div class="container">
            <h3>${dto.username }님의 정보</h3>
            <h3 class="hidden">회원정보</h3>
            <form  action="changeuser_view.ks?userno=${userno }"  method="post"   id="userdetailform">
                <fieldset  class="joinfield jf1 useradd userdetail">
                <legend >회원정보</legend>
                    <p class="first">
                        <label for="userid">아이디</label> 
                        <input type="text" name="userid" id="userid" readonly value="${dto.userid }">
                    </p>
                    <p>
                        <label for="useremail">이메일</label> 
                        <input type="text" name="useremail" id="useremail" readonly value="${dto.useremail }">
                    </p>
                    <p>
                        <label for="userphone">전화번호</label>
                        <input type="text" id="userphone" name="userphone" readonly value="${dto.userphone }">
                    </p>
                    <p><label for="userpost">우편번호</label>
                        <input type="text" id="userpost" name="userpost" readonly value="${dto.userpost }">
                         
                    </p>
                    <p  class="br_bottom">
                        <label for="useraddress">상세주소</label>
                        <input type="text" id="useraddress1" name="useraddress1" readonly value="${dto.useraddress1 }">
                        <input type="text" id="useraddress2" name="useraddress2" readonly value="${dto.useraddress2 }">
                    </p>
                </fieldset> <!-- 필수 입력 정보  -->
                <fieldset   class="joinfield jf2 useradd userdetail" style="margin-bottom:50px">
                <legend > 수신 정보 동의</legend>
                    <p   class="br_bottom first">
                        <strong  class="addinfo_title">SMS 수신여부 : ${dto.sms } </strong>
                        
                    </p>
                </fieldset> <!-- 수신 정보 동의  -->                
                   
                        <input class="btn btn-default" onclick="location.href='main.ks'" type="button" value="이전" />
                        
                        
                        <input type="button" value="회원탈퇴" class="btn btn-danger" id="delete"/>
                        <input type="submit" value="회원정보 수정" class="btn btn-primary" style="float:right"/>
                        
                  
                
            </form>
            <script>
            $(document).ready(function() {
				$("#delete").click(function() {
					$("#myModal").modal();
					$("#check_pass_ajax").on("click",function(){		
						$.ajax({
							url:"check_pass_ajax.ks", //경로
							type:"post", //get, post
							dataType:"text", //text, json, xml
							data:{userpass : $("#inputpass").val()},
							success:function(data){
							
								
								if(data=='1'){
									location.href='deleteUser.ks?userno=${userno}';
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
            });
            </script>
        </div> <!-- container -->
</section> <!-- userdetail  -->

<%@ include file="../inc/footer.jsp"%>