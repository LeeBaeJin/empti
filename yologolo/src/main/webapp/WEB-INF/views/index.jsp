<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
  <!-- 부서별 사원 수 차트 시작 -->
    <script type="text/javascript">
    
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
         
    	  // Create the data table.
          var data = new google.visualization.DataTable();
          data.addColumn('string', '부서명');
          data.addColumn('number', '사원수');
		  var chartdata = [];
          $.ajax({  
			  url: "getDeptEmpCnt", 
			  async : false, 			// 비동기여부. false = 동기식
			  success : function(result){
				  for(i=0; i<result.length; i++){
					  chartdata.push([result[i].dept_name, parseInt(result[i].cnt) ]); //push : data담음
				  }
			  }
		  });
          data.addRows(chartdata);
          
          // Set chart options
          var options = {'title':'부서별 인원 수',
                         'width':450,
                         'height':300,
                         is3D : true,
                         hAxis: { format:'0,000', gridlines: {count:10} } ,
                         colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
          				};


        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));
        chart.draw(data, options);
        
      }
    </script>
    <!--  <div id="columnchart_material" style="width: 400px; height: 320px;"></div> -->
    <!-- Bar Chart -->
	<div class="card shadow mb-4" style="width: 30%;">
		<div class="card-header py-3" >
			<h6 class="m-0 font-weight-bold text-primary">Bar Chart</h6>
		</div>
		<div class="card-body" style="width: 30%;">
			<div class="chart-bar" style="width: 30%;">
				<div id="columnchart_material"></div>
			</div>
		</div>
	</div>
    <!-- 부서별 사원 수 차트 끝 -->
    

    
    <div>사원이름: ${login.name} &nbsp;&nbsp;</div>
    
    
<a href="getLedgerList">장부현황</a>

<a href="getCompanyList">거래처목록</a>
<a href="setInsertFormCompany">거래처 등록</a><br/>

<a href="getDeptList">부서목록</a>
<a href="setInsertFormDept">부서등록</a><br/>

<a href="getEmpList">사원목록</a>
<a href="setInsertFormEmp">사원등록</a><br/>

<a href="getItemsList">품목목록</a>
<a href="setInsertFormItems">품목등록</a><br/>

<a href="getStoragesListMap">창고목록</a>
<a href="setInsertFormStorages">창고등록</a><br/>

<a href="setStocksForm">입출고내역</a>
<a href="setInsertFormStocks">입출고등록</a><br/>

<a href="getDisposalList">폐기/불량 목록</a>
<a href="setInsertFormDisposal">폐기/불량 등록</a><br/>

<a href="getSaleordersListMap">판매주문현황</a>
<a href="setInsertFormSaleorders">판매주문등록</a><br/>

<a href="getBuyordersListForm">구매주문현황</a>
<a href="setInsertFormBuyorders">구매주문등록</a><br/>


<a href="loginForm">로그인</a>
<c:if test="${login != null}">
<a href="logout">로그아웃</a>
</c:if>

  <!-- End of data-chart -->
 
