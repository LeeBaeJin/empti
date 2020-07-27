<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

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
		$("#storages_name").append(select_obj.value);	/* 그 곳을 찾아가서 select_obj.value값, value="${storages.strg_category}"를 그 자리에 넣음. */
		}
		else {
		$("#storages_name").empty();			/* 그 자리가 공백이 아니면, 일단 비운다. */
		$("#storages_name").append(select_obj.value); /* 그리고 다시 채워넣는다. ㅇㅋ */
		}
		
	}
</script>

	<h1>입출고내역 입력</h1>
	<form action="setInsertStocks">
		
		<label>입출고번호</label>	<input name="stock_no" ><br/>
		<label>품목코드</label>	<input name="item_no" id="item_no" type="text"> <span id="item_name"></span>
								<button type="button" value="품목선택" id="btnFindItem" style="background-color: rgba(0,0,0,0); border:0px;"><img src="resources/images/Glass.png" width="30px" height="30px"></button>
								<br/>
		<label>거래유형</label>	<select name="stock_category">
								  <option value="원자재" selected>원자재</option>
								  <option value="가공품">가공품</option>
								  <option value="입고" >입고</option>
								  <option value="출고" >출고</option>
								</select><br/>
		<label>수량</label>		<input name="stock_qty"><br/>
		<label>거래가</label>		<input name="stock_price"><br/>
		<label>거래일자</label>	<input type="datetime-local" name="stock_date"><br/>
		
		<label>창고</label>		<select name="strg_no" class="selectBox" onchange="storages_select_value(this);">
									<option value="" selected> ==선택하세요== </option>
										<c:forEach items="${storages}" var="storages">
											<option value="${storages.strg_category}">${storages.strg_no}</option>
										</c:forEach>
									</select>
								<span id="storages_name"></span><br/>	<!-- 창고번호 선택했을때 옆에 창고이름이 나올 자리. -->
								
		<label>상세번호</label>	<input name="detail_no"><br/>
		<label>비고	</label>	<input name="note"><br/>
	<button>등록</button>
	</form>
