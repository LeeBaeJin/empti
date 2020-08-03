<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('.clickNo').on('click', function(){
			opener.document.getElementById("sorder_no").value = $(this).val();
			window.close();
		});
	});

</script>


	<table>
	<th>주문번호</th><th>주문날짜</th>
<c:forEach items="${findSaleorderNo}" var="orders">
		<tr>
			<td><input type="button" class="clickNo" value="${orders.sorder_no}"></td>
			<td>${orders.sorder_date}</td>
		</tr>
</c:forEach>
	</table>