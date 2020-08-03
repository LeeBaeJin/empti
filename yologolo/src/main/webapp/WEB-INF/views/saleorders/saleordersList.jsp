<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<html>
<head>
<script type="text/javascript">
	var selDel = [];
	//페이지 로드
	$(function(){
		//데이터 테이블 주문일자 역 정렬
		$('#dataTable').DataTable({
			  order: [[0, 'desc']],
			  ordering: true,
			  serverSide: false
		});
		//옵션 태그의 값을 입력받아서 전체 수정
		var tr = $('#tblBody').children();
		
		$.each(tr, function(idx , item) {
			var obj = {};
			obj['sorder_no'] = $(item).children().eq(5).children().val();
			obj['del_status'] = $(item).children().eq(2).children().val();  
			console.log(obj['del_status']);
			selDel.push(obj);
		});
		console.log(selDel);
		$('#tblhead').on('click', '#delUpdate', function() {
				$.ajax ({
					url: "setUpdateSaleDel",
					type: "POST",
					data: JSON.stringify(selDel),
					contentType : "application/json",
					success: function() {
					alert("성공적으로 수정하였습니다.");
				},  error: function() {
					alert("수정을 실패하였습니다.");
				}
			});
		});
		
	});
	//Select 박스의 옵션 값을 바꿀때 마다 값을 onchange하는 기능
	function selChk(sorderNo, sorderDel) {
		var orId = sorderNo;
		var orSta = $(sorderDel).val();
		for (var i=0; i<selDel.length; i++) {
			if(selDel[i].sorder_no == orId) {
				selDel[i].del_status = orSta; 
			}
		}
		console.log(selDel);
	}
	//주문일자를 누르면 상세정보를 새창으로 띄워주는 소스
	function orderDetails(sorder_no) {
		window.open('getSaleorderdetailList?sorder_no=' + sorder_no,
					'saleorderdetails',
					'width=800, height=250, left=150, top=250, location=no, status=no, scrollbars=yes');
		return false;
	}
</script>
</head>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getSaleordersListMap">판매주문 조회</a> | 
			<a href="setInsertFormSaleorders">판매주문 입력</a> |
			<a href="saleorders_list.do">PDF</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
		<a href="getSaleordersListMap">주문내역</a> | <a href="#">반품내역</a>
			<table class="table table-bordered" id="dataTable" style="width: 100%; cellspacing=0;">
				<thead id="tblhead">
					<tr>
						<th>주문일자</th>
						<th>판매합계</th>
						<th style="width: 200px;">배송상태&nbsp;
						<button class="btn btn-success btn-sm" type="button" id="delUpdate" style="">수정</button>
						</th>
						<th>담당사원</th>
						<th>거래처</th>
						<th style="display: none;"/>
					</tr>
				</thead>
				<tbody id="tblBody">
					<c:forEach items="${saleordersMap}" var="sale">
						<tr>
						<td>
						 <a href="javascript:void(0);" onclick="orderDetails(${sale.sorder_no});">${sale.sorder_date}</a>
						</td>
						<td align="right">
						<fmt:parseNumber value="${sale.sale_sum}" var="fmt"/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${fmt}"/>
						</td>
						<td><select id="del_status" name="del_status" onchange="selChk(${sale.sorder_no}, this)">
						<option value="배송준비중" <c:if test="${fn:contains(sale.del_status,'배송준비중')}">selected="selected"</c:if>>배송준비중</option>
						<option value="배송중" <c:if test="${fn:contains(sale.del_status,'배송중')}">selected="selected"</c:if>>배송중</option>
						<option value="배송완료" <c:if test="${fn:contains(sale.del_status,'배송완료')}">selected="selected"</c:if>>배송완료</option>
						</select></td>
						<td>${sale.name}</td>
						<td>${sale.company_name}</td>
						<!--다중 업데이트의 조건을 받기위한 히든 데이터 -->
						<td style="display: none;">
						<input type="hidden" name="sorder_no" value="${sale.sorder_no}">  
						</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</html>