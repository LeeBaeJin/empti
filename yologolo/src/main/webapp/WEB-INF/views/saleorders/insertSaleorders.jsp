<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javaScript">
	$(function(){
		//거래처 검색 기능
		$('#btnFindCompany').on('click',function(){
			var winObj=window.open('findCompany','companies','width=300,height=auto');
			return winObj;
		});
	});
	//담당 사원 검색 기능
	var emp_select_value = function(select_obj) {
		if($("#emp_name").text() == ""){
			$("#emp_name").append(select_obj.value);
		}
		else {
			$("#emp_name").empty();
			$("#emp_name").append(select_obj.value);
		}	
	}
</script>

<div align = "center">
	<h1>판매주문 입력</h1>
	<form action="setInsertSaleorders">
		주문번호 <input name= "order_no"><br/>
		주문일자 <input type="datetime-local" name="order_date"><br/>
		판매합계 <input name= "sale_sum"><br/>
		배송상태	<select name="del_status">
				  <option value="배송준비중" selected>배송준비중</option>
				  <option value="배송중">배송중</option>
				  <option value="배송완료" >배송완료</option>
				</select><br/>
		사원번호<select name="emp_id" onchange="emp_select_value(this);">
				<option value="" selected>==사원 선택==</option>
				<c:forEach items="${emps}" var="emps"> 
				<option value="${emps.name}">${emps.emp_id}</option>
				</c:forEach>
				</select>
				<span id="emp_name"></span>
				<br/>
		입출고번호 <input name= "stock_no"><br/>
		거래처코드 <input name="company_no" id="company_no" type="text"> <span id="company_name"></span>
			    <button type="button" value="거래처선택" id="btnFindCompany" style="background-color: rgba(0,0,0,0); border:0px;"><img src="resources/images/Glass.png" width="30px" hight="30px"></button>
	<br/>
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
	<button type="submit">등록</button>
	</form>
</div>










<!-- 
//	주문번호 order_no -number
//	주문일자	order_date -date
//	판매합계	sale_sum number
//	배송상태	del_status string
//  ---가져오는 data (fk)---
//	사원번호	emp_id (fk) number
//	입출고 번호	stock_no (fk) number
//	거래처 코드	 company_no (fk) number
-->