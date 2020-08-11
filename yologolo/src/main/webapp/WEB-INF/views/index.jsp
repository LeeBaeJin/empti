<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- 차트 -->
<div class="row">
	<div class="col-lg-4">
		<!-- 부서별 인원 수 -->
		<jsp:include page="charts/getDeptEmpCnt.jsp"/>
	</div>
	<div class="col-lg-4">
		<!-- 월별 총 매출 및 건수-->
		<jsp:include page="charts/getMonthlySaleAmount.jsp"/>
	</div>
	<div class="col-lg-4">
		<!-- 거래량 많은 회사-->
		<jsp:include page="charts/getVipCompany.jsp"/>
	</div>
</div>
<!-- 차트 끝 -->

<!-- 카드 -->
<div class="row">
	<div class="col-xl-4 col-md-6 mb-4">
		<jsp:include page="cards/card1.jsp"></jsp:include>
	</div>
	<div class="col-xl-4 col-md-6 mb-4">
		<jsp:include page="cards/card2.jsp"></jsp:include>
	</div>
	<div class="col-xl-4 col-md-6 mb-4">
		<jsp:include page="cards/card3.jsp"></jsp:include>
	</div>
</div>

<div class="row">
	<div class="col-xl-3 col-md-6 mb-4">
		<jsp:include page="cards/getReadySale.jsp"></jsp:include>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<jsp:include page="cards/getReadyBuy.jsp"></jsp:include>
	</div>
</div>
    
<!-- 텍스트 카드 -->
<div class="row">
	<div class="col-lg-6 col-md-6 mb-4">
		<jsp:include page="cards/collapsCard.jsp"></jsp:include>
	</div>
</div>