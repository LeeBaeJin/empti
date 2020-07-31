<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<html>
<head>

</head>
<body>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th scope="col">#</th>
				<th scope="col">품목</th>
				<th scope="col">수량</th>
				<th scope="col">단가</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buyDetails}" var="detail" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${detail.item_name}</td>
				<td>${detail.border_qty}</td>
				<td>${detail.item_price}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>

</body>

</html>