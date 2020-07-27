<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<h1>품목 등록</h1>
	<form action="setInsertItems">
		<label>품목코드</label>	<input name="item_no"><br/>
		<label>품목명</label>		<input name="item_name"><br/>
		<label>유형</label>		<select name="category">
								  <option value="원자재" selected>원자재</option>
								  <option value="가공품">가공품</option>
								</select>
								<br/>
		<label>단위</label>		<input name="unit"><br/>
		<label>유통기한</label>	<input name="exp_date"><br/>
		<label>가공품원가</label>	<input name="item_price"><br/>
	<button type="submit">등록</button>
	</form>
