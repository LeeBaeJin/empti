<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<link href="resources/common/css/modal.css" rel="stylesheet" type="text/css">

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;" class="btn btn-primary">구매주문 입력</button>

<div id="id01" class="modal">
  <div class="modal-content animate">
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
    <div class="container" style="background-color:#f1f1f1">
      <button>입력</button>
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">취소</button>
    </div>
    </div>
</div>