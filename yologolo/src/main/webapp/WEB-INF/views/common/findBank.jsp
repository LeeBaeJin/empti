<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	$(function(){
		$('.clickBank').on('click', function(){
			opener.document.getElementById("bank_name").value = $(this).parent().next().html();
			window.close();
		});
	});

</script>


<c:forEach items="${findBank}" var="bank">
	<table>
		<tr>
			<td><input type="button" class="clickBank" value="${bank.bank_code}"></td>
			<td>${bank.bank_name}</td>
		</tr>
	</table>
</c:forEach>