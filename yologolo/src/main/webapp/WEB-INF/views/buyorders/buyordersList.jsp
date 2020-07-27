<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link href="resources/common/css/modal.css" rel="stylesheet" type="text/css">
<script>
	function order_d_btn() {
		if ($('[name=item_no]').val() == '') {
			alert("품목을 선택해주십시오.");
		} else {
			var od_no1 = $('[name=item_no]').val();
			var od_no2 = $('[name=order_qty]').val();
			var od_no3 = $('[name=price]').val();
			var od_no4 = $('[name=totalPrice]').val();
			/*	console.log(od_no1, od_no2, od_no3, od_no4);
			var td1 = $('<td />').text(od_no1);
			var td2 = $('<td />').text(od_no2);
			var td3 = $('<td />').text(od_no3);
			var td4 = $('<td />').text(od_no4);
			var tr = $('<tr />').append(td1, td2, td3, td4);
				$('#buyTable').append(tr);
				$('[name=item_no]').val('');
				$('[name=order_qty]').val('');
				$('[name=price]').val('');
				$('[name=totalPrice]').val(''); */
			var newItem = $(".tbody").find("tr").eq(0).clone();
				newItem.find("td").eq(0).text(od_no1);
				newItem.find("td").eq(1).text(od_no2);
				newItem.appendTo($(".tbody"));
			}
		}
	
	function order_re_btn() {
		$('.tbody *').remove();
	}
	
	function cal() {
		var num1 = document.getElementsByTagName("order_qty").value;
		var num2 = document.getElementsByTagName("price").value;
		var result = parseInt(num1) * parseInt(num2);
		document.getElementsByTagName("totalPrice").value=result;
	}
	
	$(function(){
		$('.btnDelete').on("click", function() {
			var order_no = $(this).closest('tr').find('.buyorder01').text();
			console.log(order_no);
			var result = confirm(order_no +"번 구매주문을 삭제하시겠습니까?"); 
			if(result)
	            location.href="setDeleteBuyorders/" + order_no;
		    else 
		        	return false;
		});
		
	});


</script>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getBuyordersList">구매주문 내역 </a> | 
			<a href="setInsertFormBuyorders">구매주문 입력</a> |
			<a href="buyorders_list_pdf.do">PDF</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
				<thead>
					<tr>
						<th>주문번호</th>
						<th>주문일자</th>
						<th>구매합계</th>
						<th>사원번호</th>
						<th>거래처 코드</th>
						<th>반품</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${buyordersList}" var="buy">
						<tr>
						<td><a class="buyorder01" href="getBuyorders?order_no=${buy.order_no}">${buy.order_no}</a></td>
						<td>${buy.order_date}</td>
						<td>${buy.buy_sum}</td>
						<td>${buy.emp_id}</td>
						<td>${buy.company_no}</td>
						<td><button type="button" class="btnReturn">반품</button></td>
						<td><button type="button" class="btnUpdate">수정</button></td>
						<td><button type="button" class="btnDelete">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="btn btn-primary">구매주문 입력</button>

<div id="id01" class="modal">
  <form class="modal-content animate" action="setInsertBuyorders" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
	      <label for="uname"><b>주문날짜</b></label> &nbsp;
	     	 <input type="datetime-local"  name="order_date" required>
	     	 
	     <label for="uname" style="padding-left: 160px;"><b>품목코드</b></label> &nbsp;
      		<input type="text" name="item_no">
	      <br/><br/>
	
	      <label for="psw"><b>구매합계</b></label> &nbsp;
	      <input type="text" name="buy_sum" required>
	      
	      <label for="psw" style="padding-left: 230px;"><b>구매수량</b></label> &nbsp;
      		<input type="text" name="order_qty">
	      <br/><br/>
			
		  <label for="uname"><b>거래처</b></label> &nbsp;
	      <input type="text"  name="company_no" required>
			
	      <label for="psw" style="padding-left: 278px;"><b>단가</b></label> &nbsp;
	      <input type="text"  name="price">
		  <br/><br/>
		  
	      <label for="uname"><b>담당자</b></label> &nbsp;
	      <input type="text"  name="emp_id" required>
	      
	      <label for="uname" style="padding-left: 278px;"><b>총합</b></label> &nbsp;
	      <input type="text"  name="totalPrice" onchange="cal()">
		  <br/><br/>
		  
		<div class="container">
			<form id="frm">
			    <table style="border:1px solid gray; width: 100%" id="buyTable">
			    <thead>
				    <tr>
				    	<th style="font-size: 12pt">품목명</th>
				    	<th style="font-size: 12pt">수량</th>
				    	<th style="font-size: 12pt">가격</th>
				    	<th style="font-size: 12pt">총합</th>
				    </tr>
			    </thead>
			    <tbody class="tbody">
			    	<tr>
			    		<td><input name="item_no"></td>
			    		<td><input name="order_qty"></td>
			    		<td> </td>
			    		<td> </td>
			    	</tr>
			    </tbody>
			    </table>
			  <button type="button" onclick="order_d_btn()"
			  			class="btn btn-outline-success">등록</button> &nbsp;
			  <button type="button" onclick="order_re_btn()"
			  			class="btn btn-outline-danger">초기화</button>
			</form>
		</div>
	</div>
	
	<form action="">
    <div class="container" style="background-color:#f1f1f1">
      <button>입력</button>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
    </div>
    </form>
    </form>
</div>