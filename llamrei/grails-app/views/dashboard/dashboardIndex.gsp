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

    %{--<script src="http://code.highcharts.com/stock/highstock.js"></script>--}%
    <script src="http://code.highcharts.com/stock/modules/exporting.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            showContents();
            setInterval(function () {
                showContents();
            }, 30000);
        });

              DataPoint


    </script>
</head>
<body>
<div class="subMenuDiv" id="dash"><div style="margin-left: 29px;"><g:link controller="dashboard" action="dashboardIndex"> DashBoard</g:link></div> <div><g:link controller="assets" action="assetIndex" class="linkClass">Asset Monitor</g:link></div><div><g:link controller="#" action="#">Fuel Monitor</g:link></div> </div>


<div class="dboardDiv">
    <g:render template="chartPage" />
</div>
%{--<div class="subMenuDiv" id="dash"><div style="margin-left: 50px"><g:link controller="dashboard" action="dashboardIndex"> DashBoard</g:link></div> <div><g:link controller="assets" action="assetIndex" class="linkClass">Asset Monitor</g:link></div><div><g:link controller="fuelMonitor" action="fuelMonitorIndex">Fuel Monitor</g:link></div> </div>--}%
<div  style="width:90%; margin-left:30px" class='list'>
    <table id="main1">
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