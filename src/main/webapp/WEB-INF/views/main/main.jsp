<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/header.jsp"%>
		<section class="visual">
            <div class="container-fluid">
                <h3 class="hidden">홍보용 슬라이딩</h3>
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li><!-- 
                       --><li data-target="#myCarousel" data-slide-to="1"></li><!-- 
                       --><li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                  
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner">
                      <div class="item active">
                        <img src="${pageContext.request.contextPath}/resources/images/banner1.jpg" alt="배너1">
                        
                      </div>
                  
                      <div class="item">
                        <img src="${pageContext.request.contextPath}/resources/images/banner2.jpg" alt="배너2">
                           
                      </div>
                  
                      <div class="item">
                        <img src="${pageContext.request.contextPath}/resources/images/banner3.jpg" alt="배너3">
                        
                      </div>
                    </div>
                  
                    <!-- Left and right controls -->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                      <span class="glyphicon glyphicon-chevron-left"></span>
                      <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                      <span class="glyphicon glyphicon-chevron-right"></span>
                      <span class="sr-only">Next</span>
                    </a>
                  </div>
            <!-- 3. visual  -->
            </div>
        </section><!-- end visual-->

        

<%@ include file="../inc/footer.jsp"%>