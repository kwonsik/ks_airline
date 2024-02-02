<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="../inc/header.jsp"%>
<section class="reservation">
          <div class="container">
          <h3>항공권 예매</h3>
          <h3 class="hidden">항공권 예매</h3>          
          <form  action="reservation_search.ks"  method="post"   id="searchform">
              <fieldset  class="reservation_search rs1">
                  
                <p style="padding-left: 5%;">
                    <input type="radio"  id="oneway"  name="way" value="oneway" checked/><label for="oneway">편도</label>
                    <input type="radio"  id="round"  name="way"  value="round"/><label for="round">왕복</label>
                      
                  </p>
                 
                  <p>
                    <span>출발지</span>                  
                    <select id="departure" name="departure">
                    	<c:forEach var="i" items="${dlist }" varStatus="status">
                        	<option value="${i.departure }">${i.departure }</option>
                        
                        </c:forEach>             
                    </select>
                    <span>도착지</span>
                    <select id="arrival" name="arrival">
                        <c:forEach var="i" items="${alist }" varStatus="status">
                        	<option value="${i.arrival }">${i.arrival }</option>
                        
                        </c:forEach>
                    </select>
                    <span>성인</span>
                    <input type="number" id="adult" name="adult"
                    min="0" max="10" step="1" value="0"/>
                   
                    <span>소아</span>
                    <input type="number" id="kid" name="kid"
                    min="0" max="10" step="1" value="0"/>
                     
                  </p>
                  <script>
                  $(function(){
                	  $('.come').hide();
                	  $("input[name='way']").change(function(){
                		 
                    		// 편도 선택 시.                   		
                    		if($("input[name='way']:checked").val() == 'oneway'){
                    			$('.come').hide(); 
                    			 $("#reset").click();
                    		}	
                    		// 왕복 선택 시.
                    		else if($("input[name='way']:checked").val() == 'round'){
                    			$('.come').show();
                    		}
                    	});
                	  $("#searchform").on("submit",function(){
                		  let people=document.querySelectorAll("#searchform input[type='number']");
                		  if(people[0].value==0&&people[1].value==0){
                			  alert("인원수를 최소 한 명은 선택해주세요"); return false;
                		  }
                		  let date=document.querySelectorAll("#searchform input[type='date']");
                		  if(date[0].value==""){
                			  alert("가는 날을 선택해주세요"); return false;
                		  }
                		  else if($("input[name='way']:checked").val() == 'round'&&date[1].value==""){
                			  alert("오는 날을 선택해주세요"); return false;
                		  }
                		  let dateStr1 = date[0].value;
                		  let dateStr2 = date[1].value;
                		  let date1 = new Date(dateStr1);
                		  let date2 = new Date(dateStr2);
                		  if(date1>date2){
                			  alert("오는 날을 가는 날보다 나중으로 선택해주세요");return false;
                		  }
                	  });          	 
                  });	
                  	
					

                  
                  		
                  
                  </script>
                  <p>
                      <span>가는날</span>
                      <input type="date" name="go" id="go" >
                      
             
                      <span class="come">오는날</span>
                      <input type="date" name="come" id="come" class="come">
                 		
                  </p>
            	<input type="reset" id="reset" class="hidden" value="초기화">
                </fieldset> <!-- 비행기 정보 검색  -->
                <div  class="search">
                <input type="submit" value="검색">
                </div>
              
          </form>
          
      </div> <!-- container -->
</section> <!-- reservation  -->
<%@ include file="../inc/footer.jsp"%>