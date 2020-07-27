<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="resources/common/css/modal.css" rel="stylesheet" type="text/css">

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">구매주문 입력</button>

<div id="id01" class="modal">
	<div class="modal-content animate" >
		<div class="row">
	<div class="col-md-6">
	<form action="setInsertBuyorders" method="post">
	<div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
	      <label for="uname"><b>주문날짜</b></label> &nbsp;
	      <input type="datetime-local"  name="order_date" required>
	      <br/><br/>
	     	 

	      <label for="psw"><b>구매합계</b></label> &nbsp;
	      <input type="text" name="buy_sum" required>
	      <br/><br/>
	      

		  <label for="uname"><b>거래처</b></label> &nbsp;
	      <input type="text"  name="company_no" required>
	      <br/><br/>

	      <label for="uname"><b>담당자</b></label> &nbsp;
	      <input type="text"  name="emp_id" required>
	      <br/><br/>
	 </div>
		 <div class="container" style="background-color:#f1f1f1">
	     	<button type="submit">입력</button> &nbsp;
	     	<button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
	     </div>
	 </form>
	 </div>
	 <div class="col-md-6">
	 	<form action="setInsertBuyorders" method="post">
		 	<div  class="container">
		      <label for="uname" style="padding-left: 160px;"><b>품목코드</b></label> &nbsp;
	      	  <input type="text" name="item_no">
		      <br/><br/>
		      
		  	  <label for="psw" style="padding-left: 230px;"><b>구매수량</b></label> &nbsp;
	      	  <input type="text" name="order_qty">
		      <br/><br/>
			  
			  <label for="psw" style="padding-left: 278px;"><b>단가</b></label> &nbsp;
		      <input type="text"  name="price">
			  <br/><br/>
			  
			  <label for="uname" style="padding-left: 278px;"><b>총합</b></label> &nbsp;
		      <input type="text"  name="totalPrice" onchange="cal()">
			  <br/><br/>
			  
			  <div class="container">
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
			    <button type="button" onclick="order_d_btn()" class="btn btn-outline-success">등록</button> &nbsp;
			    <button type="button" onclick="order_re_btn()" class="btn btn-outline-danger">초기화</button>
				</div>
			</div>
		</form>
		</div>
	</div>
</div>
</div>
