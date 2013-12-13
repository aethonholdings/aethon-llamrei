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
        <script type="text/javascript" src="${resource(dir: 'js/DataTables-1.8.2', file: 'media/js/jquery.dataTables.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.ui.datepicker.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'highchart.js')}"></script>
    </head>
    <body>
        <div id="content">
            <h2>Dashboard</h2>
            <div class="updateMsgClass" id="msgDiv">Updating...</div>
              <table id="main1" >
                  <thead class='thclass'>
                    <tr>
                        <th>Asset Name</th>
                        <th>Connection status</th>
                        <th>Timestamp</th>
                        <g:each in="${timeSeriesList}" var="timeSeries"><th>${timeSeries.name} (${timeSeries.units})</th></g:each>
                    </tr>
                  </thead>
                  <tbody class='tdclass'>
                    <g:each in="${assetList}" status="i" var="asset">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${asset.assetName}</td>
                            <td>test</td>
                            <td>test</td>
                            <g:each in="${timeSeriesList}" status="j" var="timeSeries">
                                <td><div id="${asset.assetUniqueID}.${timeSeries.timeSeriesUniqueID}">fetching</div></td>
                            </g:each>
                        </tr>
                    </g:each>
                </tbody>
            </table>
        </div>
    </body>
</html>
