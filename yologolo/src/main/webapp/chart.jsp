<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
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
			  url: "getChartData", 
			  async : false, 			// 비동기여부. false = 동기식
			  success : function(result){
				  for(i=0; i<result.length; i++){
					  chartdata.push([result[i].dept_name, parseInt(result[i].cnt) ]); //push : data담음
				  }
			  }
		  });
          data.addRows(chartdata);

          
          
          // Set chart options
          var options = {'title':'부서별 인원수',
                         'width':400,
                         'height':300,
                         is3D : true,
                         hAxis: { format:'0,000', gridlines: {count:10} } ,
                         colors: ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6']
          				};
          

        var chart = new google.visualization.ColumnChart(document.getElementById('columnchart_material'));
        chart.draw(data, options);
        
/*         google.visualization.events.addListener(chart, 'select', selectHandler);

        function selectHandler(e) {
          var row = chart.getSelection()[0]["row"]
          var column = chart.getSelection()[0]["column"]
          console.log(data[row][0]);
        } */
      }
    </script>
  </head>
  <body>
    <div id="columnchart_material" style="width: 800px; height: 500px;"></div>
  </body>
</html>
