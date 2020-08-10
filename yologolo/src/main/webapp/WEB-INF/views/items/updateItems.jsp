<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
   	<style>
		label{display:inline-block; width:100px;}
	</style>

<div class="col-sm-12 my-auto">
	<h2 class="display-4 text-dark"  style=font-size:30px>품목 수정</h2>
		<form action="setUpdateItems" class="form form-group">
			<label>품목코드</label>	<input  name="item_no" value="${updateList.item_no}" readonly><br/>
			<label>품목명</label>		<input  name="item_name" value="${updateList.item_name}"><br/>
			<label>품목유형</label>	<input  name="category" value="${updateList.category}"><br/>
			<label>단위</label>		<input  name="unit" value="${updateList.unit}" ><br/>
			<label>유통기한</label>	<input  name="exp_date" value="${updateList.exp_date}"><br/>
			<label>가공품 원가</label>	<input  name="item_price" value="${updateList.item_price}"><br/>
			
			<button class="btn btn-primary" type="submit">수정</button>
		</form>
</div>

	