<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<script>
$(function(){
		disposalList();
		disposalInsert();
		disposalUpdate();  
		disposalSelect();
		init();
		fnc_btnfindItem();
	});
	
	
	
	//초기화
	function init() {
		//초기화 버튼 클릭
		$('#btnInit').on('click',function(){
			$('#disposalForm').each(function(){
				this.reset();
			});
		});
	}//init
	
	// 등록 요청
	function disposalInsert(){
		//등록 버튼 클릭
		$('#disposalForm').on('click', '#btnInsert', function(){
			console.log($("#disposalForm").serialize());
			$.ajax({ 
			    url: "disposals",  
			    type: 'POST',  
			    dataType: 'json', 
			    data : $("#disposalForm").serialize(),			    
			    success: function(response) {
			    	console.log(response.kkk)
			    	if(response.result == true) {
			    		disposalList();
			    	}
			    }, 
			    error:function(xhr, status, message) { 
			        alert(""+ status+" 정보를 입력해주세요 "+message);
			    } 
			 });  
		});//등록 버튼 클릭
	}
	
	// 수정 요청
	function disposalUpdate() {
		//수정 버튼 클릭
		$('#disposalForm').on('click', '#btnUpdate', function(){
			var disposalNo = $('#disposalDiv').find('#disposal_no').val();
			var disposalDate = $('[name="disposal_date"]').val();
			var disposalQty = $('[name="disposal_qty"]').val();
			var price = $('[name="price"]').val();
			var category = $('[id="category"]').val();
			var itemNo = $('[name="item_no"]').val();
			var strgNo = $('[name="strg_no"]').val();
			$.ajax({ 
			    url: "disposals", 
			    type: 'PUT', 
			    dataType: 'json', 
			    data : JSON.stringify({disposal_no : disposalNo, disposal_date : disposalDate, disposal_qty : disposalQty,
			    						price : price, category : category, item_no : itemNo, strg_no: strgNo}),
			    contentType:'application/json;charset=utf-8',
			    success: function(data) { 
			    	console.log(data);
			    	disposalList();
			    },
			    error:function(xhr, status, message) { 
			        alert(" status: "+status+" 에러:"+message);
			    }
			});
		});//수정 버튼 클릭
	}
	
	
	// 조회 요청
	function disposalSelect() {
		//조회 버튼 클릭
		$('body').on('click','#btnSelect',function(){
			var disposalNo = $(this).closest('tr').find('#hidden_disposal_no').val();
			//특정 사용자 조회
			$.ajax({
				url:'disposals/' + disposalNo, 
				type:'GET',
				contentType:'application/json;charset=utf-8',
				dataType:'json',
				error:function(xhr,status,msg){
					alert("상태값 :" + status + " Http에러메시지 :"+msg);
				},
				success:disposalSelectResult
			});
		}); //조회 버튼 클릭
	}
	
	// 조회 응답
	function disposalSelectResult(disposals) {
		$('[name="disposal_no"]').val(disposals.disposal_no);
		$('[name="disposal_qty"]').val(disposals.disposal_qty);
		$('[name="price"]').val(disposals.price);
		$('[name="disposal_date"]').val(disposals.disposal_date);
		$('[name="category"]').val(disposals.category);
		$('[name="strg_no"]').val(disposals.strg_no);
		$('[name="item_no"]').val(disposals.item_no);
		
	}
	
	
	//  리스트 요청
	function disposalList() {
		$.ajax({
			url:'disposals',
			type:'GET',			
			dataType:'json',
			error:function(xhr,status,msg){
				alert("상태값 :" + status + " 에러 메세지:"+msg);
			},
			success:disposalListResult
		});
	}
	
	// 폐기불량 리스트 뿌려줌
	function disposalListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			$('<tr>')
			.append($('<td>').html(item.disposal_no))
			.append($('<td>').html(item.disposal_qty))
			.append($('<td>').html(item.price))
			.append($('<td>').html(item.disposal_date))
			.append($('<td>').html(item.category))
			.append($('<td>').html(item.strg_no))
			.append($('<td>').html(item.item_no))
			.append($('<td>').html('<button id=\'btnSelect\'>조회</button>'))
			.append($('<input type=\'hidden\' id=\'hidden_disposal_no\'>').val(item.disposal_no))
			.appendTo('tbody');
		});//each
	}//userListResult
	
	function fnc_btnfindItem(){
		//품목 검색 기능
		$('#btnFindItem').on('click', function() {
			var wo = window.open('findItems','item', 'width=800, height=800');
			return wo;
		});
	};
	
	var storages_select_value = function(select_obj) {
		if($("#storages_no").text() == ""){
		$("#storages_no").append(select_obj.value);
		}
		else {
		$("#storages_no").empty();
		$("#storages_no").append(select_obj.value);
		}	
	}
	


</script>

<div class="row">
	<!-- 목록 시작 -->
	<div class="col-lg-7 col-md-12">
		<h2>장부목록</h2>
		<table class="table text-center">
			<thead>
				<tr>
					<th class="text-center">폐기/불량 번호</th>
					<th class="text-center">폐기 수량</th>
					<th class="text-center">단가</th>
					<th class="text-center">폐기일</th>
					<th class="text-center">구분</th>
					<th class="text-center">창고번호</th>
					<th class="text-center">품목코드</th>
				</tr>
			</thead>
			<tbody></tbody>
		</table>
	</div> 
	<!-- 목록 끝-->
	 
	<!-- 등록수정 폼 시작 -->
	<div class="col-lg-5 col-md-12">
		<div id="disposalDiv" class="ml-5">
			<h1>폐기불량 입력</h1>
			<form id="disposalForm">
				<label>폐기/불량 번호</label>	<input name="disposal_no" id="disposal_no" readonly><br/>
				<label>폐기 수량</label>		<input name="disposal_qty"  ><br/>
				<label>단가</label>			<input name="price"  ><br/>
				<label>폐기일</label>			<input name="disposal_date" type="datetime-local"><br/>
				<label>구분</label>			<select name="category">
														<option value="폐기">폐기</option>
														<option value="불량">불량</option>
											</select><br/>
				
				<label>창고</label>			<select name="strg_no" class="selectBox" onchange="storages_select_value(this);">
												<option value="" selected> ==선택하세요== </option>
													<c:forEach items="${storages}" var="storages">
														<option value="${storages.strg_no}">${storages.strg_category}</option>
													</c:forEach>
											</select><span id="storages_no"></span><br/>
				
				<label>품목코드</label>		<input name="item_no" id="item_no" > <span id="item_name"></span>
												<button type="button" value="품목선택" id="btnFindItem">
													<img src="resources/images/Glass.png" width="30px" height="30px"></button>
													<br/>
				<div class="btn-group">
					<input type="button" class="btn btn-primary" value="등록" id="btnInsert" /> 
					<input type="button" class="btn btn-primary" value="수정" id="btnUpdate" /> 
					<input type="button" class="btn btn-primary" value="초기화" id="btnInit" />
				</div>
			</form>
		</div>
	</div>
	<!-- 등록수정 폼 끝-->
</div>
