<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('.clickNo').on('click', function(){
			opener.document.getElementById("border_no").value = $(this).val();
			window.close();
		});
	});

</script>
<div class="alert alert-primary" role="alert" style="text-align:center; font-size:2.5em" >
  구매주문 리스트
</div>

<table class="table table-hover">
	 <thead class="thead-dark">
		<tr>
			<th>주문번호</th><th>주문날짜</th>
		</tr>
	</thead>
		<c:forEach items="${findBuyorderNo}" var="orders">
			<tr>
				<td><input type="button" class="clickNo" value="${orders.border_no}"></td>
				<td>${orders.border_date}</td>
			</tr>
		</c:forEach>
</table>