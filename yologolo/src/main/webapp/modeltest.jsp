<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="resources/common/css/modal.css" rel="stylesheet" type="text/css">

<button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">구매주문 입력</button>
<div id="id01" class="modal">
  
  <form class="modal-content animate" action="setInsertBuyorders" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
      <label for="uname"><b>주문날짜</b></label> &nbsp;
      <input type="datetime-local"  name="order_date" required>
      <br/><br/>
	
      <label for="psw"><b>구매합계</b></label> &nbsp;
      <input type="text"  name="buy_sum" required>
      <br/><br/>
    
      <label for="uname"><b>거래처</b></label> &nbsp;
      <input type="text"  name="company_no" required>
	  <br/><br/>
	  
      <label for="psw"><b>담당자</b></label> &nbsp;
      <input type="text"  name="emp_id" required>
	  <br/><br/>
	
      <label for="uname"><b>품목코드</b></label> &nbsp;
      <input type="text"  name="item_no" required>
	<br/><br/>
	
      <label for="psw"><b>구매수량</b></label> &nbsp;
      <input type="text" name="order_qty" required>
	<br/><br/>
	</div>
    <div class="container" style="background-color:#f1f1f1">
      <button type="submit">입력</button> &nbsp;
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
    </div>
  </form>
</div>

