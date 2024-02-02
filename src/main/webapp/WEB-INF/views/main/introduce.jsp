<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
<section class="introduce">
	<div class="container">
		<h3>항공사 소개</h3>
		<h3 class="hidden">항공사 소개</h3>
		<div>
			<iframe width="500" height="400" class="iFrame"
				src="https://www.youtube.com/embed/iw6VpuCbHVs?si=vzQtULHMYjDVzJnZ"
				title="YouTube video player" frameborder="0"
				allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
				allowfullscreen></iframe>
		</div>
		<%-- 
		<c:choose>
			<c:when test="${userno==0 }">
			<input type="text" id="url" placeholder="변경할 영상 주소를 적어주세요" style="width:300px">
			<input type="button" class="btn btn-default" value="변경" title="" id="change">			
			<script>
				$(function(){
					$("#change").on("click",function(){
						alert("asdasd");
					
						$(".iFrame").attr("src",$("#url").val());
					});
					
				});
			</script>
			</c:when>
		</c:choose>	--%>



		<div id="map1" class="m1" style="width: 500px; height: 400px;">

		</div>
		<input type="button" class="mbtn b1 btn btn-danger" value="서울 사무실" title=""
			data-lat="37.5008166" data-lng="127.0258413"> <input 
			type="button" class="mbtn b2 btn btn-primary" value="인천공항 사무실" data-lat="37.4492111"
			data-lng="126.4483707">

		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6cc9a08c3eb615d53638ed8318c926e6"></script>
		<script>
			var btnvalue = "";
			window.addEventListener("load", function() {
				let btn = document.querySelectorAll(".mbtn");
				let mapshow = document.querySelector(".m1");
				var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
				mapOption = { //{key : value, key : value}
					center : new kakao.maps.LatLng(37.4020631, 127.1064348), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨

				};

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);

				for (let i = 0; i < 2; i++) {
					btn[i].addEventListener("click", function() {

						btnvalue = btn[i].value;

						mapchange(btn[i].getAttribute('data-lat'), btn[i]
								.getAttribute('data-lng'));
					})
				}
			})

			let mapchange = function(lat, lng) {
				var mapContainer = document.getElementById('map1'), // 지도를 표시할 div 
				mapOption = { //{key : value, key : value}
					center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
					level : 3
				// 지도의 확대 레벨

				};

				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(mapContainer, mapOption);

				console.log(map);
				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(lat, lng);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = '<div style="padding:5px;">'
						+ btnvalue
						+ '<br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					position : iwPosition,
					content : iwContent
				});

				// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
				infowindow.open(map, marker);

			}
		</script>
	</div>






	</form>
	</div>
	<!-- container -->
</section>
<!-- introduce  -->
<%@ include file="../inc/footer.jsp"%>