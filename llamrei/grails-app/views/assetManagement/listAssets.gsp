
<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>
<div class='menuItem'>
    <h2>Asset List</h2>
    <div style="font-size: 15px;">
        <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list" style='text-align: center'>
                <table >
                    <thead class='thclass'>
                    <tr>

                        %{-- <g:sortableColumn property="id" title="${message(code: 'user.id.label', default: 'Id')}"/>--}%
                        <th>Asset Name</th>
                        <th>Client Name</th>
                        <th>Location</th>
                        <th>State Model Id</th>
                        <th>Image</th>
                        <th>Imagethumburl</th>
                        <th> </th>
                    </tr>
                    </thead>
                    <tbody class='tdclass'>
                    <g:each in="${assetInstanceList}" status="i" var="assetInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            %{--<td><g:link action="show" id="${assetInstance.id}">${fieldValue(bean: assetInstance, field: "id")}</g:link></td>--}%

                            <td>${fieldValue(bean: assetInstance, field: "assetName")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "clientName")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "location")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "stateModelId")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "imageurl")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "imagethumburl")}</td>

                            <td style="text-align: center">
                                <g:link action="editAsset" params="[id:assetInstance.id]"><button value='Edit' class="actionButton">Edit</button></g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:link controller="assetManagement" action="createAsset"><button value='Create New' class="actionButton" style='float:left; margin-top:5px'>Add +</button></g:link>
        </div>
    </div>

</div>


</body>
</html>
