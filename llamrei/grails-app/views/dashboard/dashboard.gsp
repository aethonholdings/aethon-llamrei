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
        <div id="content">
            <h2>Dashboard</h2>
            <table id="main1" >
                <thead class='thclass'>
                  <tr>
                      <th>Asset</th>
                      <g:each in="${timeSeriesList}" var="timeSeries"><th>${timeSeries.name} (${timeSeries.units})</th></g:each>
                      <th>Nodetimestamp</th>
                  </tr>
                </thead>
                <tbody class='tdclass'>
                    <g:each in="${assetList}" status="i" var="asset">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${asset.assetName}</td>
                            <g:each in="${timeSeriesList}" status="j" var="timeSeries">
                                <td><div id="${asset.assetUniqueID}.${timeSeries.timeSeriesUniqueID}" class="dataPoint">n/a</div></td>
                             </g:each>
                          <td id='${asset.assetUniqueID}'>n/a</td>
                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div style="margin-top: 10px">
                <span id="date_time"></span>
                <script type="text/javascript">window.onload = date_time('date_time');</script>
            </div>
            <div class="statusFooter">
                <span class="clock" id="serverTimestamp"></span>
               <span class="updateMsgClass" id="msgDiv">Updating...</span>
            </div>
          </div>

    </body>
</html>
