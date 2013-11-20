<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>

<div class='menuItem' id="assetListDiv">
    <h2>Asset List</h2>
    <div style="font-size: 15px;">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list" style='text-align: center'>
                <table>
                    <thead class='thclass'>
                    <tr>
                        <th>Asset Unique ID</th>
                        <th>Asset Name</th>
                        <th>Description</th>
                        <th>Client Name</th>
                        <th>Location</th>
                        %{--<th>Imageurl</th>--}%
                        %{--<th></th>--}%
                    </tr>
                    </thead>
                    <tbody class='tdclass'>
                    <g:each in="${assetInstanceList}" status="i" var="assetInstance">

                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" >

                            <td>  <g:link style="color: #000000" controller="assetMonitor" action="assetMonitorDetail" params="[assetId:assetInstance.id]">${fieldValue(bean: assetInstance, field: "assetUniqueID")}</g:link></td>

                            <td><g:link style="color: #000000" controller="assetMonitor" action="assetMonitorDetail"  params="[assetId:assetInstance.id]">${fieldValue(bean: assetInstance, field: "assetName")}</g:link></td>

                            <td><g:link style="color: #000000" controller="assetMonitor" action="assetMonitorDetail"  params="[assetId:assetInstance.id]">${fieldValue(bean: assetInstance, field: "description")}</g:link></td>

                            <td><g:link style="color: #000000" controller="assetMonitor" action="assetMonitorDetail"  params="[assetId:assetInstance.id]">${fieldValue(bean: assetInstance, field: "clientName")}</g:link></td>

                            <td><g:link style="color: #000000" controller="assetMonitor" action="assetMonitorDetail"  params="[assetId:assetInstance.id]">${fieldValue(bean: assetInstance, field: "location")}</g:link></td>


                        </tr>

                    </g:each>
                    </tbody>
                </table>
            </div>
            %{--<g:link controller="assetManagement" action="createAsset"><button value='Create New' class="actionButton" style='float:left; margin-top:5px'>Add +</button></g:link>--}%
        </div>
    </div>
</div>
</body>
</html>
