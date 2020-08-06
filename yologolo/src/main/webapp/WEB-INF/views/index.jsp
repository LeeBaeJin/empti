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
    
<div>사원이름: ${login.name} &nbsp;&nbsp;</div>
<a href="getLedgerList">장부현황</a>

<a href="getCompanyList">거래처목록</a>
<a href="setInsertFormCompany">거래처 등록</a><br/>

<a href="getDeptList">부서목록</a>
<a href="setInsertFormDept">부서등록</a><br/>

<a href="getEmpList">사원목록</a>
<a href="setInsertFormEmp">사원등록</a><br/>

<a href="getItemsList">품목목록</a>
<a href="setInsertFormItems">품목등록</a><br/>

<a href="getStoragesListMap">창고목록</a>
<a href="setInsertFormStorages">창고등록</a><br/>

<a href="setStocksForm">입출고내역</a>
<a href="setInsertFormStocks">입출고등록</a><br/>

<a href="getDisposalList">폐기/불량 목록</a>
<a href="setInsertFormDisposal">폐기/불량 등록</a><br/>

<a href="getSaleordersListMap">판매주문현황</a>
<a href="setInsertFormSaleorders">판매주문등록</a><br/>

<a href="getBuyordersListForm">구매주문현황</a>
<a href="setInsertFormBuyorders">구매주문등록</a><br/>


<a href="loginForm">로그인</a>
<c:if test="${login != null}">
<a href="logout">로그아웃</a>
</c:if>

  <!-- End of data-chart -->
 
