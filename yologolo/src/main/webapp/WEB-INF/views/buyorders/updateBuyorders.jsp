<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	//페이지 로드
	$(function(){
		//거래처 검색 버튼
		$('#btnFindCompany').on('click',function(){
			var winObj=window.open('findCompany','companies','width=300,height=auto');
			return winObj;
		});
		//구매상세 테이블 초기화 버튼
		$("#resetBtn").on("click", function() {
			var tr = $("#tblBody").children();
			console.log(tr);
			tr.remove();
		});
	});
	//구매상세 테이블 추가 버튼
	function addOrder()  {
		if ($('[name=item_no]').val() == '') {
			alert("품목을 선택해주십시오.");
		} else {
			var od_no1 = $('[name=item_no]').val();
			var od_no2 = $('[name=order_qty]').val();
			var od_no3 = $('[name=price]').val();
			console.log(od_no1, od_no2, od_no3);
			var td1 = $('<td />').text(od_no1);
			var td2 = $('<td />').text(od_no2);
			var td3 = $('<td />').text(od_no3);
			var tr = $('<tr />').append(td1, td2, td3);
				$('#buyTable').append(tr);
				$('[name=item_no]').val('');
				$('[name=order_qty]').val('');
				$('[name=price]').val(''); 
		}
	}
	function removeOrder()  {
		var tr = $('#tblTr');
		tr.remove();
	}
	function seq_orderInsert() {
		$.ajax ({
			url: "getBuySeq",
			contentType : "application/json",
			success: function(result) {
				ajaxInsert(result);
			}, error: function() {
				alert("시퀀스 실패.");
			}
		});
	}
	//구매주문 입력 기능
	function ajaxInsert(result) {
		
		//구매주문의 데이터
		var om_no1 = $('[name=order_date]').val();
		var om_no2 = $('[name=company_no]').val();
		var om_no3 = $('[name=emp_id]').val();
		var om_no4 = $('[name=buy_sum]').val();
		console.log(om_no1, om_no2, om_no3, om_no4);
		var mObj = {'order_date':om_no1,
				    'company_no':om_no2,
				    'emp_id':om_no3,
				    'buy_sum':om_no4,
				    'order_no': result}
		
		//구매상세주문의 데이터
		var tr = $('#tblBody').children();
		var td = [];
		$.each(tr, function(idx , item) {
			var obj = {};
			obj['order_no'] = result;
			obj['item_no'] = $(item).children().eq(0).text(); 
			obj['order_qty'] = $(item).children().eq(1).text();
			console.log($(item).children().eq(0).text());
			td.push(obj);
		})
		var datas = {vo: mObj, list:td}
			$.ajax ({
				url: "setInsertBuyorders",
				type: "POST",
				data: JSON.stringify(datas),
				contentType : "application/json",
				success: function() {
				alert("성공적으로 주문하였습니다.");
			}, error: function() {
				alert("주문을 실패하였습니다.");
			}
		});
	}
</script>
<div align="left">
	<h1>구매주문 입력</h1>
	<form id="buyOrd">
	<label>주문날짜: </label>	 <input type="datetime-local" name="order_date"> <br>
	<label>거래처코드: </label> <input name="company_no" id="company_no" type="text"> <span id="company_name"></span>
			    			<button type="button" value="거래처선택" id="btnFindCompany" style="background-color: rgba(0,0,0,0); border:0px;"><img src="resources/images/Glass.png" width="30px" hight="30px"></button><br/>
	<label>품목: </label>	    <input name="item_no"> <br>
	<label>수량: </label> 	<input type="number" name="order_qty"> <br>
	<label>단가: </label> 	<input type="number" name="price"> <br>
	<label>담당자: </label> 	<input name="emp_id"> <br>
	<label>구매합계: </label> 	<input type="number" name="buy_sum"> <br>
	<button type="button" onclick="addOrder()">추가</button>
	<button type="button" id="resetBtn">초기화</button>
	<!-- 구매상세주문 테이블 -->
	<table border="1" id="buyTable" style="width: 40%;">
		<thead>
			<tr style="align-items: center;">
				<th>품목</th><th>수량</th><th>단가</th>
			</tr>
		</thead>
		<tbody id="tblBody">
			
		</tbody>
	</table>
	
	<button type="button" onclick="seq_orderInsert()">주문입력</button>
	</form>
</div>