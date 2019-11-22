<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/Common/Admin.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script  src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<jsp:include page="/Common/Top.jsp"></jsp:include>
<script type="text/javascript">
//Create the chart
$(function(){
  var wageTotal = 0;
                  var wageDept10=0;
                  var wageDept20=0;
                  var wageDept30=0;
                  var wageDept40=0;

   
   var personalWage10=[];
   var deptWage10=[];
   var personalWage20=[];
   var deptWage20=[];
   var personalWage30=[];
   var deptWage30=[];
   var personalWage40=[];
   var deptWage40=[];
   
         $.ajax(
            {
               url:"empchart.do", //Ex10_ok.jsp   
              // data:{empno:$('#empno').val()}, //MemoId?id=aa
               dataType:"json", //xml , json , script , html , text
               success:function(responsedata){
                  console.log(">" + responsedata + "<");
                  
                  
                  
                  
                  $.each(responsedata,function(index, obj){
                     
                     
                     
                     
                     console.log(obj);
                     wageTotal += obj.sal;
                     
                     if(obj.deptno == 10){
                        wageDept10 += obj.sal;                        
                     }else if(obj.deptno ==20){
                        wageDept20 += obj.sal;                        
                     }else if(obj.deptno ==30){
                        wageDept30 += obj.sal;                        
                     }else if(obj.deptno ==40){
                        wageDept40 += obj.sal;                        
                     }
                  });
                  
                  
                  
                  $.each(responsedata,function(index, obj){   
                     if(obj.deptno == 10){
                       
                        
                        var personalWage10=[];
                        
                        personalWage10.push(obj.ename);
                        personalWage10.push(obj.sal/wageDept10*100);
                        deptWage10.push(personalWage10);
                        
                     }else if(obj.deptno ==20){
                        
                        
                        var personalWage20=[];
                        personalWage20.push(obj.ename);
                        personalWage20.push(obj.sal/wageDept20*100);
                        deptWage20.push(personalWage20);
                     }else if(obj.deptno ==30){
                       
                        
                        var personalWage30=[];
                        personalWage30.push(obj.ename);
                        personalWage30.push(obj.sal/wageDept30*100);
                        deptWage30.push(personalWage30);
                     }else if(obj.deptno ==40){
                       
                        
                        var personalWage40=[];
                        personalWage40.push(obj.ename);
                        personalWage40.push(obj.sal/wageDept40*100);
                        deptWage40.push(personalWage40);
                     }
                     
                     
                     
                     
                  });//이치 문 끝
                   
                  console.log(wageDept10);
                  console.log(wageDept20);
                  console.log(wageDept30);
                  console.log(wageDept40);
                  console.log(wageTotal);                  
                  console.log(wageDept10/wageTotal*100);
                  
                  
                  
                  
                  console.log(personalWage10);
                  console.log(personalWage20);
                  console.log(personalWage30);
                  console.log(personalWage40);
                  
                  console.log(deptWage10);
                  
                  
                  
                  
                  Highcharts.chart('container', {
                      chart: {
                          type: 'column'
                      },
                      title: {
                          text: 'Browser market shares. January, 2018'
                      },
                      subtitle: {
                          text: 'Click the columns to view versions. Source: <a href="http://statcounter.com" target="_blank">statcounter.com</a>'
                      },
                      accessibility: {
                          announceNewData: {
                              enabled: true
                          }
                      },
                      xAxis: {
                          type: 'category'
                      },
                      yAxis: {
                          title: {
                              text: 'Total percent market share'
                          }

                      },
                      legend: {
                          enabled: false
                      },
                      plotOptions: {
                          series: {
                              borderWidth: 0,
                              dataLabels: {
                                  enabled: true,
                                  format: '{point.y:.1f}%'
                              }
                          }
                      },

                      tooltip: {
                          headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
                          pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
                      },

                      series: [
                          {
                              name: "Average Wages By Department",
                              colorByPoint: true,
                              data: [
                                  {
                                      name: "deptno10",
                                      y: (wageDept10/wageTotal*100),
                                      drilldown: "deptno10"
                                  },
                                  {
                                      name: "deptno20",
                                      y: (wageDept20/wageTotal*100),
                                      drilldown: "deptno20"
                                  },
                                  {
                                      name: "deptno30",
                                      y: (wageDept30/wageTotal*100),
                                      drilldown: "deptno30"
                                  },
                                  {
                                      name: "deptno40",
                                      y: (wageDept40/wageTotal*100),
                                      drilldown: "deptno40"
                                  }
                                  
                              ]
                          }
                      ],
                      drilldown: {
                          series: [
                              {
                                  name: "deptno10",
                                  id: "deptno10",
                                  data: deptWage10
                              },
                              {
                                  name: "deptno20",
                                  id: "deptno20",
                                  data: deptWage20
                                  
                              },
                              {
                                  name: "deptno30",
                                  id: "deptno30",
                                  data: deptWage30
                              },
                              {
                                  name: "deptno40",
                                  id: "deptno40",
                                  data: deptWage40
                                  
                              }
                             
                          ]
                      }
                  });
                  
                  
                  
               },
               error:function(){
               }
            }      
         );

   
   
   




});
</script>

<style>
.highcharts-figure, .highcharts-data-table table {
    min-width: 310px; 
    max-width: 800px;
    margin: 1em auto;
}

#container {
    height: 400px;
}

.highcharts-data-table table {
   font-family: Verdana, sans-serif;
   border-collapse: collapse;
   border: 1px solid #EBEBEB;
   margin: 10px auto;
   text-align: center;
   width: 100%;
   max-width: 500px;
}
.highcharts-data-table caption {
    padding: 1em 0;
    font-size: 1.2em;
    color: #555;
}
.highcharts-data-table th {
   font-weight: 600;
    padding: 0.5em;
}
.highcharts-data-table td, .highcharts-data-table th, .highcharts-data-table caption {
    padding: 0.5em;
}
.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even) {
    background: #f8f8f8;
}
.highcharts-data-table tr:hover {
    background: #f1f7ff;
}

</style>



   
<section id="div2">
   

   

      <c:forEach var="list" items="${requestScope.printemplist}"/> 
         
         
         
         
         
         
   <figure class="highcharts-figure">
    <div id="container"></div>
    <p class="highcharts-description">
        Chart showing browser market shares. Clicking on individual columns
        brings up more detailed data. This chart makes use of the drilldown
        feature in Highcharts to easily switch between datasets.
    </p>
</figure>
         

   


      
      
   
</section>


<jsp:include page="/Common/Bottom.jsp"></jsp:include>
</body>
</html>