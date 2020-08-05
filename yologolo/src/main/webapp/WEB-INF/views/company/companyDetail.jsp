<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<table class="table table-hover">
	<thead class="thead-dark">
		<tr style="text-align:center">
			<th>회사코드</th>
			<th>회사 명</th>
			<th>담당자 명</th>
			<th>담당자 연락처</th>
			<th>대표 명</th>
			<th>회사연락처</th>
			<th>회사 주소</th>
			<th>상세주소</th>
			<th>우편번호</th>
			<th>거래 은행</th>
			<th>계좌번호</th>
			<th>비고</th>
		</tr>
	</thead> 
	<tr style="text-align:center">
		<td>${company.company_no}		</td>         
		<td>${company.company_name}		</td>              
		<td>${company.dealer_name} 		</td>
		<td>${company.dealer_phone}		</td>
		<td>${company.ceo_name}    	 	</td>    
		<td>${company.phone}       	 	</td>              
		<td>${company.address}    	 	</td>        
		<td>${company.address_detail}   </td>
		<td>${company.zip_code}         </td>
		<td>${company.bank_name}   	 	</td>
		<td>${company.account_no}       </td>
		<td>${company.note}             </td>
	</tr>
</table>