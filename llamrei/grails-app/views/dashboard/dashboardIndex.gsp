<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/7/13
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback; org.codehaus.groovy.grails.web.json.JSONArray; net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />

    <title>DashBoard</title>



    <script type="text/javascript">

        $(document).ready(function(){
//            showContents();

            $("#datePickerFrom").datepicker({ changeMonth: true,changeYear: true ,dateFormat: 'yy-mm-dd',maxDate: "0" });
            $("#datePickerTo").datepicker({ changeMonth: true,changeYear: true,dateFormat: 'yy-mm-dd',maxDate: "0"   });
            setInterval(function () {
                showContents();
            }, 50000);
        });



    </script>
</head>
<body>
<div class="dboardDiv">
    <g:render template="chartPage" />
</div>
<div>
    <div><div style="float: left"><h2>Dashboard</h2></div><div class="updateMsgClass" id="msgDiv">Updating...</div></div>
    %{--<h2>Dashboard</h2>--}%
    %{--<div><div style="float: left;background-color: red"><h2>Dashboard</h2></div><div style="float: right">aaa</div></div>--}%
    %{--<table style="border: none"><tr><td><h2>Dashboard</h2></td><td>Updating...</td></tr></table>--}%
    %{--<div style="float: right">Updating...</div> </div>--}%
    <table id="main1" >
        <thead class='thclass'>
        <tr>
            <th>Asset Name</th>
            <th>Connection</th>
            <th>State</th>
            %{--<g:each in="${timeSeriesName}" status="i" var="name">--}%
            %{--<th>${name}</th>--}%
            %{--</g:each>--}%

            <g:each in="${timeSeriesName}"  status="i" var="ac1">

                <th>${ac1.name}</th>

                    </g:each>
            %{--<th>Humidity</th>--}%
            %{--<th>Temperature</th>--}%
            <th></th>
            <th></th>
            <th></th>
        </tr>

        </thead>

        <tbody class='tdclass'>

        <g:each in="${contentmap}" status="i" var="content">

            <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                <td>${content.value.name} </td>
                <td>${content.value.connection}</td>
                <td>${content.value.stateName[0][0]}</td>

            <g:each in="${content.value.value}"  status="j" var="ac">

                    <td onclick=openChart(${content.value.uID},${content.value.timeSeriesID[j]}) class="linkClass">${ac.value}</td>
                    %{--<td onclick=openChart(${content.value.uID},${content.value.timeSereisID}) class="linkClass">${content.value.value1}</td>--}%
                    %{--<td onclick=openChart(${content.value.uID},${content.value.timeSereisID}) class="linkClass">${content.value.value2}</td>  --}%
                </g:each>


                <td><input type="button" class="actionButton" value="Lock"></td>
                <td><input type="button" class="actionButton" value="Start"></td>
                <td><input type="button" class="actionButton" value="Stop"></td>
            </tr>
        </g:each>
        </tbody>
    </table>
    %{--</div>--}%

</body>
</html>