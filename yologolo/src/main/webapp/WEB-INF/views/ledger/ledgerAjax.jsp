<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<head>
<script>
$(function(){
	$('#btnFindItem').on('click', function() {
		var wo = window.open('findItems','item', 'width=800, hight=800');
		return wo;
	});
});
		/* 창고번호를 선택했을때 옆에 창고이름이 나오는 '그 자리'를 찾아가는 함수   */
var storages_select_value = function(select_obj) {
	if($("#storages_name").text() == ""){	/* id값이 storage_name인 자리의 text가 공백이면 */
	$("#storages_name").append(select_obj.value);	<%-- 그 곳을 찾아가서 select_obj.value값, value="${storages.strg_category}"를 그 자리에 넣음. --%>
	}
	else {
	$("#storages_name").empty();			/* 그 자리가 공백이 아니면, 일단 비운다. */
	$("#storages_name").append(select_obj.value); /* 그리고 다시 채워넣는다. ㅇㅋ */
	}
	
}
		

$(function(){
		stocksList();
		stocksSelect();
		stocksInsert();
		stocksUpdate(); 
		init();
	});
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#stocksform').each(function(){
				this.reset();
			});
		});
	}//init
	
	//사용자 등록 요청
	function stocksInsert(){
		//등록 버튼 클릭
		$('#btnInsert').on('click',function(){
			console.log($("#stocksform").serialize());
			$.ajax({ 
			    url: "adminStocks",  
			    type: 'POST',  
			    dataType: 'json', 
			    data : $("#stocksform").serialize(),			    
			    success: function(response) {
			    	console.log(response.kkk)
			    	if(response.result == true) {
			    		stocksList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(""+ status+" 정보를 입력해주세요 "+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	
	
	//사용자 조회 요청
	function stocksSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
		$("#storages_name").empty();
			var stocksNo = $(this).closest('tr').find('#hidden_stock_no').val();
			//특정 사용자 조회
			$.ajax({
				url:'adminStocks/' + stocksNo,
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:stocksSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	//사용자 조회 응답
	function stocksSelectResult(stocks) {
		$('input:text[name="stock_no"]').val(stocks.stock_no);
		$('input:text[name="item_no"]').val(stocks.item_no);
		$('select[name="stock_category"]').val(stocks.stock_category).attr("selected", "selected","selected","selected");
		$('input:text[name="stock_qty"]').val(stocks.stock_qty);
		$('input:text[name="stock_price"]').val(stocks.stock_price);
		$('[name="stock_date"]').val(stocks.stock_date);
		$('select[name="strg_no"]').val(stocks.strg_no).attr("selected", "selected","selected","selected");
		$('input:text[name="detail_no"]').val(stocks.detail_no);
		$('input:text[name="note"]').val(stocks.note);
		
	}//userSelectResult
	
	
	//사용자 수정 요청
	function stocksUpdate() {
		//수정 버튼 클릭
		$('#stocksform').on('click', '#btnUpdate', function(){
			var stocksNo = $('#storckDiv').find('#stock_no').val();
			var itemNo = $('[name="item_no"]').val();
			var stockCategory = $('[name="stock_category"]').val();
			var stockQty = $('[name="stock_qty"]').val();
			var stockPrice = $('[name="stock_price"]').val();	
			var stockDate = $('[name="stock_date"]').val();
			var strgNo = $('[name="strg_no"]').val();
			var detailNo = $('[name="detail_no"]').val();
			var note = $('[name="note"]').val();
			$.ajax({ 
			    url: "adminStocks", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data : JSON.stringify({stock_no:stocksNo, item_no: itemNo, stock_category:stockCategory, stock_qty: stockQty,
			    						stock_price: stockPrice, stock_date: stockDate, strg_no: strgNo, detail_no: detailNo,  note: note}),
			    contentType:'application/json;charset=utf-8',
			    success: function(data) { 
			    	console.log(data);
			       stocksList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	
	//사용자 목록 조회 요청
	function stocksList() {
		$.ajax({
			url:'adminStocks',
			type:'GET',			
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:stocksListResult
		});
	}//직원 리스트 조회
	
	// 입출고 내역 목록 뿌려줌
	function stocksListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.stock_no))
			.append($('<td>').html(item.item_no))
			.append($('<td>').html(item.stock_category))
			.append($('<td>').html(item.stock_qty))
			.append($('<td>').html(item.stock_price))
			.append($('<td>').html(item.stock_date))
			.append($('<td>').html(item.strg_no))
			.append($('<td>').html(item.detail_no))
			.append($('<td>').html(item.note))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_stock_no\'>').val(item.stock_no))
			.appendTo('tbody');
		});//each
	}//userListResult
</script>

</head>
<body>
		<div id="ledgerDiv">
	<form id="ledgersForm">
		<label>장부번호</label><input name="ldgr_no"> <br>
		<label>날짜</label>	<input name="ldgr_date" type="datetime-lacal"> <br>
		<label>금액</label>	<input name="total_amount"> <br>
		<label>상태</label>	<select name="condition">
							<option value="" selected disabled hidden> ==선택하세요== </option>
							<option value="완납">완납</option>
							<option value="미수금">미수금</option>	
							</select> <br>
		<label>주문 번호</label>	<input name="order_no"> <br>
		<label>비고</label>	<input name="note"> <br>
					<div class="btn-group">      
						<input type="button"  class="btn btn-primary" value="등록"  id="btnInsert" /> 
						<input type="button"  class="btn btn-primary" value="수정"  id="btnUpdate" />
						<input type="button"  class="btn btn-primary" value="초기화" id="btnInit" />		
					</div>
	</form>
	</div>
	<hr/>		
	<div class="col-lg-6">
		<h2>매출장부목록</h2>
		<table class="table text-center">
			<thead>
			<tr>				
				<th class="text-center">장부번호</th>
				<th class="text-center">날짜</th>
				<th class="text-center">금액</th>
				<th class="text-center">상태</th>
				<th class="text-center">주문번호</th>
				<th class="text-center">비고</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</body>