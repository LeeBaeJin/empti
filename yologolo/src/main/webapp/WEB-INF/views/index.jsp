<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
	<!-- 차트 -->
	<div class="row">
		<div class="col-lg-4">
			<!-- 부서별 인원 수 -->
			<jsp:include page="emp/getDeptEmpCnt.jsp"/>
		</div>
		<div class="col-lg-4">
			<!-- 월별 총 매출 및 건수-->
			<jsp:include page="ledger/getMonthlySaleAmount.jsp"/>
		</div>
		<div class="col-lg-4">
			<!-- 거래량 많은 회사-->
			<jsp:include page="company/getVipCompany.jsp"/>
		</div>
		
	</div> 
    

  <!-- End of data-chart -->
 
