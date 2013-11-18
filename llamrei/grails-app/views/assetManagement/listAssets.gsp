<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class='menuItem'>
    <h2>Asset management</h2>
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
                        <th>client Name</th>
                        <th>Location</th>
                        <th>Imageurl</th>
                        <th></th>
                    </tr>
                    </thead>
                    <tbody class='tdclass'>
                    <g:each in="${assetInstanceList}" status="i" var="assetInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td>${fieldValue(bean: assetInstance, field: "assetUniqueID")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "assetName")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "description")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "clientName")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "location")}</td>

                            <td>${fieldValue(bean: assetInstance, field: "imageurl")}</td>
                            <td>
                                <g:link action="editAsset" params="[id: assetInstance.id]"><button value='Edit' class="actionButton">Edit</button></g:link>
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
