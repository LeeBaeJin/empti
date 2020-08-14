<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
	label{display:inline-block; width:100px;}
</style>
<script>
	var option="";
	$(function() {
		findStockBorderList();	
		strgList();
		
		$('#insertBtn').on('click', function() {
			$('.checkbox:checked').each(function(idx, item) {
				var item_no = $(this).closest('tr').find('.td').text()
			});
		});
		
	    $(".chkAll").click(function(){
	        var chk = $(this).is(":checked");//.attr('checked');
	        if(chk) $(".checkbox ").prop('checked', true);
	        else  $(".checkbox ").prop('checked', false);
	    });
		
	});	
	function findStockBorderList() {
	      $.ajax({
	          url:'findStockBorderNo',
	          type:'GET',         
	          dataType:'json',
	          error:function(xhr,status,msg){
	             alert("상태값 :" + status + " 에러 메세지:"+msg);
	          },
	          success:findListResult
	       });	
	}
	
	function strgList() {
		$.ajax({
			url: 'strgList',
			type: 'GET',
			dataType: 'json',
			success: findStrgList	
		});
	}
	
	function findStrgList(data){
		$.each(data, function(idx,item){
			option += '<option value="' + item.strg_no +'">' +item.strg_category+ '</option>'
		});
		
	}
	
	function findListResult(data) {
		$("tbody").empty();
		$.each(data,function(idx,item){
			 $('<tr>')
	   		 .append($('<td>').html(idx+1))
	         .append($('<td>').html(item.border_date))
	         .append($('<td>').html(item.company_name))      
	         .append($('<td>').html(item.item_name))
	         .append($('<td>').html(item.border_qty))
	         .append($('<td>').append($('<select>').html(option)))
	         .append($('<td>').html('<input type="checkbox" class="checkbox" value="'+ item.border_no + '"/>'))
	         .append($('<td>').html(item.border_no).css("display", "none"))
	         .append($('<td>').html(item.borderdetail_no).css("display", "none"))
    	     .append($('<td>').html(item.item_no).css("display", "none"))
    	     .append($('<td>').html(item.company_no).css("display", "none"))
	         .appendTo('tbody');	
		});
	}
	

</script>
<div class="col-sm-12 my-auto">
	<h2 class="display-4 text-dark" style=font-size:35px;>입고 입력</h2>
	<hr class="sidebar-divider d-none d-md-block" width="40%" align="left"> 
	<form action="" id="stockFrm">
		<label>입고 번호</label>	<input value="" type="text" name="stock_no" class="form-control" style="width: 130px; display: inline;" readonly="readonly"><br/>
		<label>입고 일자</label>	<input value="${serverTime}" type="datetime-local" name="stock_date" class="form-control" style="width: 260px; display: inline;"><br/>

		<label>유형</label>		<input value="입고" name="stock_category" class="form-control" style="width: 80px; display: inline;" readonly="readonly"><br/>
		<label>주문 조회</label>	
								
		<table border="1" id="orderTable" class="table table-bordered" style="width: 70%;">
			<thead>
				<tr>
					<th>#</th>
					<th>주문날짜</th>
					<th>거래처명</th>
					<th>품목명</th>
					<th>수량</th>
					<th>창고</th>
					<th><input type="checkbox" class="chkAll"/></th>
					<th style="display:none;">주문번호</th>
					<th style="display:none;">주문상세번호</th>
					<th style="display:none;">품목코드</th>
					<th style="display:none;">거래처번호</th>
				</tr>
			</thead>
			<tbody id="tblBody">
			</tbody>
		</table>						
		<button type="button" id="insertBtn" class="btn btn-success">입력</button>
		<button type="button" id="resetBtn" class="btn btn-warning">초기화</button>								
	</form>
</div>