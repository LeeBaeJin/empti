<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<style>
	label{display:inline-block; width:100px;}
</style>
<script>
</script>
<div class="col-sm-12 my-auto">
	<h2 class="display-4 text-dark"  style=font-size:35px;>입고 입력</h2>
	<hr class="sidebar-divider d-none d-md-block" width="40%" align="left"> 
	<form action="" id="saleOrd">
		<label>입고 번호</label>	<input value="" type="text" name="stock_no" class="form-control" style="width: 300px; display: inline;" readonly="readonly"><br/>
		<label>입고 일자</label>	<input value="${serverTime}" type="datetime-local" name="stock_date" class="form-control" style="width: 300px; display: inline;"><br/>
		<label>거래처코드</label>	<input name="company_no" id="company_no" class="form-control" style="width: 250px; display: inline;"> <span id="company_name"></span>

		<label>품목</label>		<input name="item_no" id="item_no" class="form-control" style="width: 100px; display: inline;"><span name="item_name" id="item_name" ></span>
									<button type="button" value="품목선택" id="btnFindItem" style="background-color: rgba(0,0,0,0); border:0px;"><img src="resources/images/Glass.png" width="30px" height="30px"></button><br/>
		<label>수량</label> 		<input name="sorder_qty" id="sorder_qty" type="number" class="form-control" style="width: 250px; display: inline;"> <br>
		
		<label>단가</label>		<input name="item_price" id="item_price" type="number" class="form-control" style="width: 250px; display: inline;"><br>
		<label>판매합계</label> 	<input name="sale_sum" class="form-control" style="width: 250px; display: inline;"><br/><br/>
		</form>
	</div>