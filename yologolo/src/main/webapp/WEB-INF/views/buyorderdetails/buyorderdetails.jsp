<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<html>
<head>
<script>
	function multiInsert() {
		let list = [];
		//체크한 행만 전송할 데이터 만들기.
		$("[name='selChk']:checked").each(function(i, checkbox) {
			var tr = $(checkbox).parent().parent();
			var td = $(tr).children();
			var obj = {};
			
			//var orderdetailNo = td.eq(1).find("input").val();
			var itemNo = td.eq(1).find("input").val();
			var orderQty = td.eq(2).find("input").val();
			var orderNo = td.eq(3).find("input").val();
			//객체에 담기
			//obj["orderdetail_no"] = orderdetailNo; //급여 + 상여금
			obj["item_no"] = itemNo; //급여년월
			obj["order_qty"] = orderQty; //사번_이름
			obj["order_no"] = orderNo; //은행계좌

			//목록에 담기
			list.push(obj);
		});
		console.log(JSON.stringify(list));
		$.ajax("setBuyorderdetailInsert", {
			type : 'POST',
			data : JSON.stringify(list),
			dataType : 'json',
			contentType : 'application/json;charset=utf-8',
			success : function() {
				alert('성공');
			},
			error : function() {
				alert('실패');
			}
		});
	}
</script>
</head>
<body>
<table border=1 style="width: 40%;">
		<tr>
			<th><input type="checkbox" id="chkAll"></th>
			<th>품목코드</th>
			<th>품목수량</th>
			<th>주문번호(FK)</th>
		</tr>
		<tr>
			<td><input type="checkbox" name="selChk"></td>
			<td><input name="item_no" value="A01"></td>
			<td><input name="order_qty" value="100"></td>
			<td><input name="order_no" value="1"></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="selChk"></td>
			<td><input name="item_no" value="A01"></td>
			<td><input name="order_qty" value="150"></td>
			<td><input name="order_no" value="1"></td>
		</tr>
		<tr>
			<td><input type="checkbox" name="selChk"></td>
			<td><input name="item_no" value="A01"></td>
			<td><input name="order_qty" value="200"></td>
			<td><input name="order_no" value="1"></td>
		</tr>
</table>
<button type="button" onclick="multiInsert()">입력</button>
</body>
</html>