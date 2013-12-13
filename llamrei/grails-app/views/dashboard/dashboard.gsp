<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback; org.codehaus.groovy.grails.web.json.JSONArray; net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />

    <title>Dashboard</title>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#datePickerFrom").datepicker({ changeMonth: true,changeYear: true ,dateFormat: 'yy-mm-dd',maxDate: "0" });
            $("#datePickerTo").datepicker({ changeMonth: true,changeYear: true,dateFormat: 'yy-mm-dd',maxDate: "0"   });
            setInterval(function () {
                showContents();
            }, 30000);
        });
    </script>
</head>
<body>
    <div class="dboardDiv">
        <g:render template="chartPage" />
    </div>
    <div>
        <div><div style="float: left"><h2>Dashboard</h2></div><div class="updateMsgClass" id="msgDiv">Updating...</div></div>
        <table id="main1" >
            <thead class='thclass'>
              <tr>
                  <th>Asset Name</th>
                  <th>Connection status</th>
                  <th>State</th>
                  <g:each in="${timeSeriesList}" var="timeSeries"><th>${timeSeries.name}<br>${timeSeries.units}</th></g:each>
                  <th>Start</th>
                  <th>Stop</th>
              </tr>
            </thead>
<!--            <tbody class='tdclass'>
                <g:each in="${contentmap}" status="i" var="content">
                    <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td>${content.value.name} </td>
                        <td>${content.value.connection}</td>
                        <td>${content.value.stateName[0][0]}</td>
                        <g:each in="${content.value.value}"  status="j" var="ac">
                            <g:if test="${ac.value.toString().contains('NA')}" >
                                <td>${ac.value}</td>
                            </g:if>
                             <g:else>
                                 <td onclick=openChart(${content.value.uID},${content.value.timeSeriesID[j]}) class="linkClass">${ac.value}</td>
                             </g:else>
                        </g:each>
                        <td><input type="button" class="actionButton" value="Start"></td>
                        <td><input type="button" class="actionButton" value="Stop"></td>
                    </tr>
                </g:each>
              </tbody>-->
        </table>
        %{--</div>--}%

    </body>
</html>
