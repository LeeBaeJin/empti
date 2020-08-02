<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<head>
<script>
$(function(){
	$('#ledgerDiv').on('click', '#btnFindItem', function() {
		var status = $('#status option:selected').val();
		
		var wo = window.open('findItems/status','item', 'width=800, hight=800');
		return wo;
	});		
});
$(function(){
		ledgerList();
		ledgerInsert();
		ledgerUpdate(); 
		ledgerSelect();
		init();
	});
	
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#ledgerForm').each(function(){
				this.reset();
			});
		});
	}//init
	
	// 등록 요청
	function ledgerInsert(){
		//등록 버튼 클릭
		$('#ledgerForm').on('click', '#btnInsert', function(){
			console.log($("#ledgerForm").serialize());
			$.ajax({ 
			    url: "ledgers",  
			    type: 'POST',  
			    dataType: 'json', 
			    data : $("#ledgerForm").serialize(),			    
			    success: function(response) {
			    	console.log(response.kkk)
			    	if(response.result == true) {
			    		ledgerList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(""+ status+" 정보를 입력해주세요 "+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}//userInsert
	
	
	// 조회 요청
	function ledgerSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var ldgrNo = $(this).closest('tr').find('#hidden_ldgr_no').val();
			//특정 사용자 조회
			$.ajax({
				url:'ledgers/' + ldgrNo, 
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:ledgerSelectResult
			});
		}); //조회 버튼 클릭
	}//userSelect
	
	// 조회 응답
	function ledgerSelectResult(ledgers) {
		$('input:text[name="ldgr_no"]').val(ledgers.ldgr_no);
		$('[name="ldgr_date"]').val(ledgers.ldgr_date);
		$('input:text[name="total_amount"]').val(ledgers.total_amount);
		$('select[name="condition"]').val(ledgers.condition).attr("selected", "selected");
		$('select[id="status"]').val(ledgers.status).attr("selected", "selected");
		console.log((ledgers.status));
		if(ledgers.status == "매입") {
			$('#order_no').empty();
			$('#order_no')
			.append($('<label>').text("구매주문번호"))
			.append($('<input id=\'border_no\'>').val(ledgers.border_no)) 
		} else if (ledgers.status == "매출"){
 			$('#order_no').empty();
			$('#order_no')
			.append($('<label>').text("판매주문번호"))
			.append($('<input id=\'sorder_no\'>').val(ledgers.sorder_no)); 
		} else {
			$('#order_no').empty();
		}
		$('input:text[name="note"]').val(ledgers.note);
		
	}//userSelectResult
	
	
	// 수정 요청
	function ledgerUpdate() {
		//수정 버튼 클릭
		$('#ledgerForm').on('click', '#btnUpdate', function(){
			var ledgerNo = $('#ledgerDiv').find('#ldgr_no').val();
			var ldgrDate = $('[name="ldgr_date"]').val();
			var totalAmnt = $('[name="total_amount"]').val();
			var con = $('[name="condition"]').val();
			var borderNo = $('[id="border_no"]').val();
			var sorderNo = $('[id="sorder_no"]').val();
			var sts = $('[id="status"]').val();
			var note = $('[name="note"]').val();
			$.ajax({ 
			    url: "ledgers", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data : JSON.stringify({ldgr_no:ledgerNo, ldgr_date: ldgrDate, total_amount:totalAmnt, condition: con,
		    							border_no: borderNo, sorder_no : sorderNo, status: sts, note: note}),
			    contentType:'application/json;charset=utf-8',
			    success: function(data) { 
			    	console.log(data);
			    	ledgerList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}//userUpdate
	
	// 목록 조회 요청
	function ledgerList() {
		$.ajax({
			url:'ledgers',
			type:'GET',			
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:ledgerListResult
		});
	}//직원 리스트 조회
	
	// 입출고 내역 목록 뿌려줌
	function ledgerListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.ldgr_no))
			.append($('<td>').html(item.ldgr_date))
			.append($('<td>').html(item.total_amount))
			.append($('<td>').html(item.condition))
			.append($('<td>').html(item.border_no))
			.append($('<td>').html(item.sorder_no))
			.append($('<td>').html(item.status))
			.append($('<td>').html(item.note))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_ldgr_no\'>').val(item.ldgr_no))
			.appendTo('tbody');
		});//each
	}//userListResult
	
	
	$(function() {
			$('#order_no').empty();
		$('#status').change(function() {
			var status = $('#status option:selected').val();
			if(status == "매입") {
				$('#order_no').empty();
				$('#order_no')
				.append($('<label>').text("구매주문번호"))
				.append($('<input id=\'border_no\'>'))
				.append($('<button id=\'btnFindItem\'>').append('<img src="resources/images/Glass.png" width="30px" height="30px">'))
			} else if (status == "매출"){
				$('#order_no').empty();
				$('#order_no')
				.append($('<label>').text("판매주문번호"))
				.append($('<input id=\'sorder_no\'>'))
				.append($('<button id=\'btnFindItem\'>').append('<img src="resources/images/Glass.png" width="30px" height="30px">'))

			} else {
				$('#order_no').empty();
			}
		});
	});


</script>

</head>
<body>
	<div id="ledgerDiv">
	<form id="ledgerForm">
		<label>장부번호</label><input name="ldgr_no" id="ldgr_no" readonly> <br>
		<label>날짜</label>	<input name="ldgr_date" type="datetime-local"> <br>
		<label>금액</label>	<input name="total_amount"> <br>
		<label>구분</label> 	<select id="status">
								<option value="" selected> == 매출/매입 선택 == </option>
								<option value="매입">매입</option>
								<option value="매출">매출</option>
							</select><br>
			

		<div id="order_no">
		
		</div>
		
		<label>상태</label>	<select name="condition">
							<option value="" selected> ==선택하세요== </option>
							<option value="완납">완납</option>
							<option value="미수">미수</option>	
							</select> <br>
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
		<h2>장부목록</h2>
		<table class="table text-center">
			<thead>
			<tr>
				<th class="text-center">장부번호</th>
				<th class="text-center">날짜</th>
				<th class="text-center">금액</th>
				<th class="text-center">상태</th>
				<th class="text-center">구매주문번호</th>
				<th class="text-center">판매주문번호</th>
				<th calss="text-center">상태</th>
				<th class="text-center">비고</th>
			</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div>
</body>