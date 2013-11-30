<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/20/13
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
  <title>AssetDetail</title>
    <script type="text/javascript">

        $(document).ready(function(){

            setInterval(function () {

               assetDetail(${assetId});

            }, 20000);
        });


        $(function() {
            $( "#tabs" ).tabs();
        });

        $(function() {
            $( "#tabs1" ).tabs();
        });



    </script>
</head>
<body>

<div class='menuItem' style="float: left; width:100%;" id="assetDetailDiv">

    %{--<h2> Assets home page</h2>--}%
    <div class="rightDiv" style="width: 20%">

        <div>

            <table style="margin-top: 5px;border: none" id="assetName">
                <tr>
                    <td><b>Asset Name</b></td><td>:</td><td>${name}</td>    </tr>
                <tr>  <td><b>Client Name</b></td><td>:</td><td>${clientName}</td>  </tr>
                <tr> <td><b>Location</b></td><td>:</td><td>${location}</td>
                </tr>
            </table>
        </div>
        <div class="imgDiv" style="width: 40%">
            <img class=imageThumbnail src=${imageUrl}>
        </div>
        <div style="margin-top: 80px">

            <div style="margin-top: 10px;margin-left: 10px">
                <input type="button" value="Lock" class="actionButton">
            </div>
            <div style="margin-top: 10px;margin-left: 10px">
                <input type="button" value="Start" class="actionButton">
            </div>
            <div style="margin-top: 10px;margin-left: 10px">
                <input type="button" value="Stop" class="actionButton">
            </div>

        </div>
    </div>



    %{--<div style="margin-right: 100px"  class="updateMsgClass" id="msgDiv1">Updating...</div>--}%




    <div class="leftDiv" style='width:70%' >

        <div id="tabs">

            <ul>
                <li><a href="#tabs-1">Operating Data</a></li>
                <li><a href="#tabs-2">Maintenance</a></li>
                <li><a href="#tabs-3">Alerts</a></li>
               <li style="margin-left: 500px"  class="updateMsgClass" id="msgDiv1">Updating..</li>
            </ul>
            <div id="tabs-1">
                %{--<input type="button" value="Add" class="buttonClass">  <input type="button" value="Remove" class="buttonClass">--}%
                <div style="margin-top: 10px">
                    <table id="detailTable">
                        <thead class='thclass'>

                        <tr>
                            <th>&nbsp;</th>
                            <th>Value</th>
                            <th >Unit</th>
                            %{--<th class="thclass">Max</th>--}%
                            %{--<th class="thclass">Min</th>--}%
                        </tr>
                        </thead>
                        <tbody class='tdclass'>
                        <g:each in="${contentMap}" status="i" var="content">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        <td>${content.value.timeSeriesName}</td>
                        <td>${content.value.value}</td>
                        <td>${content.value.unit}</td>

                        </tr>
                        </g:each>
                        <tbody class='tdclass'>
                    </table>
                </div>
            </div>
            <div id="tabs-2">
                %{--<input type="SUBMIT" value="Add" class="buttonClass">  <input type="button" value="Remove" class="buttonClass" >--}%
                <div style="margin-top: 10px">
                    <table>

                        <tr>
                            <th class="thclass">&nbsp;</th>
                            <th class="thclass">Start</th>
                            <th class="thclass">End</th>
                            <th class="thclass">Description</th></tr>


                        <tr>
                            <td class="tdclass"> <input type="checkbox" /></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                        </tr>

                    </table>
                </div>
            </div>
            <div id="tabs-3">
                <div style="margin-top: 10px">
                    <table>
                        <thead class='thclass'>
                        <tr>
                            <th class="thclass">Date Time</th>
                            <th class="thclass">Event</th>
                            <th class="thclass">Details</th>

                        </thead>
                        <tbody>
                      <g:each in="${alerts}" status="i" var="alerts">
                        <tr  class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td>${fieldValue(bean: alerts, field: "created")}</td>
                            <td>${fieldValue(bean:alerts, field: "eventType")}</td>
                            <td>${fieldValue(bean: alerts, field: "details")}</td>
                         </tr>
                          <g:if test="${i>=9}">
                          <g:link  action="list" controller="alerts" params="[id:assetId]"><button value='Cancel' class="actionButton">Show All</button></g:link>
                          </g:if>
                       </g:each>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>


    </div>
</div>

</body>
</html>