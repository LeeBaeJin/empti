<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!-- 차트 -->
<div class="container-fluid">
<div class="row">
	<div class="col-lg-4">
		<!-- 부서별 인원 수 -->
		<jsp:include page="charts/getDeptEmpCnt.jsp"/>
	</div>
	<div class="col-lg-4 ">
		<!-- 월별 총 매출 및 건수-->
		<jsp:include page="charts/getMonthlySaleAmount.jsp"/>
	</div>
	<div class="col-lg-4">
		<!-- 판매량 높은 품목  Best 5-->
		<jsp:include page="charts/getHigherSaleItems.jsp"></jsp:include>
	</div>
</div>
</div>
<!-- 차트 끝 -->
<br/>
<!-- 카드 -->
<div class="container-fluid">
<div class="row">
	<div class="col-xl-3 col-md-6 mb-4">
		<!-- 영업이익 -->
		<jsp:include page="cards/getProfits.jsp"></jsp:include>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<!-- 주문량 높은 거래처 -->
		<jsp:include page="cards/getVipCompany.jsp"></jsp:include>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<!-- 미배송 판매건수 -->
		<jsp:include page="cards/getReadySale.jsp"></jsp:include>
	</div>
	<div class="col-xl-3 col-md-6 mb-4">
		<!-- 수령중 구매건수 -->
		<jsp:include page="cards/getReadyBuy.jsp"></jsp:include>
	</div>
</div>
</div>