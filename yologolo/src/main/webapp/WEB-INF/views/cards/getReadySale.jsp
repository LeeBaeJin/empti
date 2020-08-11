<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	//페이지 로드
	$(function() {
		$.ajax({
			url : 'getReadySaleorders',
			type : 'GET',
			dataType : 'json',
			async: false,
			success : function(result) {
				result = result + '건';
				$('.count').text(result);
			}
		});
	});
</script>

<div class="card border-left-warning shadow h-100 py-2">
  <div class="card-body">
    <div class="row no-gutters align-items-center">
      <div class="col mr-2">
        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">미배송 판매주문 건수</div>
        <div class="h5 mb-0 font-weight-bold text-gray-800 count"></div>
      </div>
      <div class="col-auto">
        <i class="fas fa-comments fa-2x text-gray-300"></i>
      </div>
    </div>
  </div>
</div>