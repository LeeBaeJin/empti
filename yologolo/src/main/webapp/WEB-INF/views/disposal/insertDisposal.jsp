<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<script>
	$(function(){
		//품목 검색 기능
		$('#btnFindItem').on('click', function() {
			var wo = window.open('findItems','item', 'width=800, height=800');
			return wo;
		});
	});
	
	var storages_select_value = function(select_obj) {
		if($("#storages_no").text() == ""){
		$("#storages_no").append(select_obj.value);
		}
		else {
		$("#storages_no").empty();
		$("#storages_no").append(select_obj.value);
		}	
	}
	
	function check() {
		if(frm.disposal_no.value ==""){
			alert("폐기/불량 번호를 입력해주세요.");
			frm.disposal_no.focus();
			return;
		}
		if(frm.disposal_qty.value == ""){
			alert("폐기/불량 수량을 입력해주세요.");
			frm.disposal_qty.focus();
			return;
		}
		if(frm.price.value == ""){
			alert("비용을 입력해주세요.");
			frm.price.focus();
			return;
		}
		if(frm.disposal_date.value == ""){
			alert("날짜를 선택해주세요.");
			frm.disposal_date.focus();
			return;
		}
		if(frm.strg_no.value == ""){
			alert("창고을 선택해주세요.");
			frm.strg_no.focus();
			return;
		}
		if(frm.item_no.value == ""){
			alert("품목코드을 입력해주세요.");
			frm.item_no.focus();
			return;
		}

	}
	
	
</script>
		<h1>폐기불량 입력</h1>
		<hr class="sidebar-divider d-none d-md-block" style="width: 15%;"> 
			<form action="setInsertDisposal">
				
				<label>폐기/불량 번호</label>	<input name="disposal_no" id="disposal_no"><br/>
				<label>폐기/불량 수량</label>	<input type="number" name="disposal_qty" id="disposal_qty"><br/>
				<label>비용</label>	<input type="number" name="price" id="price"><br/>
				<label>날짜</label>	<input type="datetime-local" name="disposal_date" id="disposal_date"><br/>
				<label>구분</label>	<select name="category">
										<option value="폐기">폐기</option>
										<option value="불량">불량</option>
									</select><br/>
				
				<label>창고</label>	<select name="strg_no" id="strg_no" class="selectBox" onchange="storages_select_value(this);">
									<option value="" selected> ==선택하세요== </option>
										<c:forEach items="${storages}" var="storages">
											<option value="${storages.strg_no}">${storages.strg_category}</option>
										</c:forEach>
									</select><span id="storages_no"></span><br/>
				
				<label>품목코드</label>	<input name="item_no" id="item_no" type="text"> <span id="item_name"></span>
				<button type="button" value="품목선택" id="btnFindItem" style="background-color: rgba(0,0,0,0); border:0px;"><img src="resources/images/Glass.png" width="30px" height="30px"></button>
				<br/>
			<button type="submit" onclick="check()">등록</button>
			</form>
</body>
</html>