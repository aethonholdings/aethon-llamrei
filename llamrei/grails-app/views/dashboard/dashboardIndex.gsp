<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/7/13
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
    <title>DashBoard</title>
    <script type="text/javascript">
        $(document).ready(function(){
            showContents();

            $("#main1") .find("tr:gt(0)").addClass("odd");
//          $("#main1 tr:odd").addClass("odd");
//          $("#main1 tr:not(.odd)").hide();
//      setTimeout(showContents, 100);
            setInterval(function () {
                showContents();
            }, 30000);
        });

        //  $(document).ready(function(){
        //    $('#assertName').click(function(){
        //
        //        $('#main1').hide();
        //        $('#main2').hide();
        //        $('#chartDiv').show();
        //
        //    })

        $(function () {
            $(document).ready(function() {
                Highcharts.setOptions({
                    global: {
                        useUTC: false
                    }
                });
                 var X1=83;
                var chart;
                $('#chartDiv1').highcharts({
                    chart: {
                        type: 'line',
                        animation: Highcharts.svg, // don't animate in old IE
                        marginRight: 10,
                        events: {
                          load: function() {

                              // set up the updating of the chart each second
                              var series = this.series[0];
                              var x=83;
                                x=x+10;
                              setInterval(function() {
//                                  var x = 83;
                                  series.addPoint([x, y], true, true);
                              }, 1000);
                          }
                        }
                    },
                    title: {
                        text: 'Fuel Data'
                    },
                    xAxis: {
                        type: 'datetime',
                        tickPixelInterval: 150
                    },
                    yAxis: {
                        title: {
                            text: 'Value'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        formatter: function() {
                            return '<b>'+ this.series.name +'</b><br/>'+
                                    Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
                                    Highcharts.numberFormat(this.y, 2);
                        }
                    },
                    legend: {
                        enabled: false
                    },
                    exporting: {
                        enabled: false
                    },
                    series: [{
                        name: 'Random data',
                        data: (function() {
                            // generate an array of random data
                            var data = [],
                                    time = (new Date()).getTime(),

                                    i;
                            debugger;
                            var test=[20,60,150,30,45,78,34,67,314,89,34]
                            for (i = 0,j=5; i <= test.length; i++,j++) {
                                data.push({
                                    x: test[i],
                                    y: j
                                });

                            }

//                          for(i=1;i<100;i++){
//                              data.push({
//                                  x:  i * 1000,
//                                  y: Math.random()
//                              });
//
//                          }
                            return data;
                        })()
                    }]
                });
            });

        });

        //  })
    </script>
</head>
<body>
%{--<div class="subMenuDiv" id="dash"><div style="margin-left: 29px;"><g:link controller="dashboard" action="dashboardIndex"> DashBoard</g:link></div> <div><g:link controller="assets" action="assetIndex" class="linkClass">Asset Monitor</g:link></div><div><g:link controller="#" action="#">Fuel Monitor</g:link></div> </div>--}%
<g:render template="/layouts/operatorSubMenu" />

<div class="dboardDiv">
    <g:render template="chartPage" />
</div>
%{--<div class="subMenuDiv" id="dash"><div style="margin-left: 50px"><g:link controller="dashboard" action="dashboardIndex"> DashBoard</g:link></div> <div><g:link controller="assets" action="assetIndex" class="linkClass">Asset Monitor</g:link></div><div><g:link controller="fuelMonitor" action="fuelMonitorIndex">Fuel Monitor</g:link></div> </div>--}%
<div  style="width:90%; margin-left:20px;margin-top:50px" class='list'>
    <table >
        <thead class='thclass'>
        <tr>
            <th >Asset Name</th>
            <th >Connection</th>
            <th >State</th>
            <th >Humidity</th>
            <th >Temperature</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>

        <tbody class='tdclass'>

        </tbody>
    </table>
</div>
<div style="float: right">
    %{--<table style="border: none" id="main2">--}%
    %{--<tr>--}%
    %{--<td></td> <td></td><td></td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td></td> <td></td><td></td>--}%
    %{--</tr>--}%
    %{--<tr>--}%
    %{--<td><input type="button" class="buttonClass" value="Lock"></td>--}%
    %{--<td><input type="button" class="buttonClass" value="Start"></td>--}%
    %{--<td><input type="button" class="buttonClass" value="Stop"></td>--}%
    %{--</tr>--}%
    %{--</table>--}%

</div>
</div>
</body>
</html>