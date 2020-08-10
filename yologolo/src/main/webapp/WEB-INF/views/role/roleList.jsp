<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!-- 데이터 테이블 js 및 css -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.21/js/dataTables.semanticui.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.1/semantic.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.semanticui.min.css">

<!-- 버튼 CSS -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script>
	$(document).ready(function() {
		// 데이터테이블로 적용
		$('#example').DataTable();
		
		//확인 버튼 close 기능
		$('#closeBtn').on('click', function() {
			windows.close();
		});
		
		erList(empId);
		
	});
	
	function erList(empId) {
		$.ajax({
			url : "getEmpRoleList",
			contentType : "application/json",
			success: function() {
				$('[name=roleChk]').attr("chekced", true);
			}, error: function() {
				alert("롤 조회 실패하였습니다.");
			}
		});
	}
</script>
<table id="example" class="ui celled table" style="width:100%; margin-left: 1%">
	<thead>
		<tr>
			<th><input type="checkbox" name="chkALL"></th>
			<th>롤 ID</th>
			<th>롤 이름</th>
			<th>롤 설명</th>
		</tr>
	</thead>
	<tbody id="tblBody">
	<c:forEach items="${roleList}" var="role">
		<tr>
			<td><input type="checkbox" name="roleChk" value="${role.id}"></td>
			<td>${role.id}</td>
			<td>${role.role_name}</td>
			<td>${role.description}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<button type="button" class="btn btn-success" id="closeBtn">확인</button>