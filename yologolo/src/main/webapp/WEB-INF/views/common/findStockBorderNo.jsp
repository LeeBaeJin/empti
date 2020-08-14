<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	
</script>

<div> 구매주문 내역</div>
<table>
	<thead>
		<tr>
			<th>#</th>
			<th>주문날짜</th>
			<th>거래처명</th>
			<th>품목명</th>
			<th>수량</th>
			<th><input type="checkbox" class="chkAll"/></th>
			<th style="display:none;">주문번호</th>
			<th style="display:none;">주문상세번호</th>
			<th style="display:none;">품목코드</th>
			<th style="display:none;">거래처번호</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${findStcBo}" var="fsb" varStatus="status">
				<tr>
					<th>${status.count}</th>
					<th>${fsb.border_date}</th>
					<th>${fsb.company_name}</th>
					<th>${fsb.item_name}</th>
					<th>${fsb.border_qty}</th>
					<th><input type="checkbox" value="${fsb.border_no}"/></th>
					<th style="display:none;">${fsb.border_no}</th>
					<th style="display:none;">${fsb.borderdetail_no}</th>
					<th style="display:none;">${fsb.item_no}</th>
					<th style="display:none;">${fsb.company_no}</th>
				</tr>
		</c:forEach>
	</tbody>
</table>
<button type="button" class="btn btn-success btn-lg" id="Btn">확인</button>