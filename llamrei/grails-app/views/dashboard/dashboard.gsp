<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page import="net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback; org.codehaus.groovy.grails.web.json.JSONArray; net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback; net.sf.cglib.core.ProcessSwitchCallback" contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="main" />
        <title>Dashboard</title>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'dashBoard.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'realDateTime.js')}"></script>

    </head>
    <body>
    <g:render template='chartPage' />
        <div id="content">
            <h2>Dashboard</h2>
            <table id="main1" >
                <thead class='thclass'>
                  <tr>
                      <th>Asset</th>
                      <th>Node timestamp</th>
                      <g:each in="${timeSeriesList}" var="timeSeries"><th>${timeSeries.name} (${timeSeries.units})</th></g:each>
                  </tr>
                </thead>
                <tbody class='tdclass'>
                    <g:each in="${assetList}" status="i" var="asset">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${asset.assetName}</td>
                            <td id='${asset.assetUniqueID}'>n/a</td>
                            <g:each in="${timeSeriesList}" status="j" var="timeSeries">
                                <td onclick=openChart(${asset.id},${timeSeries.id})><div id="${asset.assetUniqueID}.${timeSeries.timeSeriesUniqueID}" class="dataPoint">n/a</div></td>
                             </g:each>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="clock">
                <div style="float: left" id="date_time"></div>
                <script type="text/javascript">window.onload = date_time('date_time',serverTime);</script>
                <div style="float: right" id="serverTimestamp"></div>
            </div>
            <span class="updateMsgClass" id="msgDiv">Updating...</span>
       </div>
    </body>
</html>
