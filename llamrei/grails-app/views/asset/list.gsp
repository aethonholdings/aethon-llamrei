<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>>
<body>
%{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
<g:render template="/layouts/adminSubMenu"/>

<div class='menuItem'>
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Asset List</h2>
    </div>

    <div style="margin-left: 20px;font-size: 20px;border:1px solid">
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
                                <g:link action="edit" params="[id: assetInstance.id]"><button value='Edit'
                                                                                              class="buttonClass1">Edit</button></g:link>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
        </div>
        <g:link controller="asset" action="create"><button value='Create New' class="buttonClass1"
                                                           style='float:left; margin-top:5px'>Add +</button></g:link>
    </div>
</div>
</body>
</html>
