
<%@ page import="llamreiAssets.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>>
    <body>
<div class="subMenuDiv" id="admin"><div style='margin-left: 50px'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 50px;width: 200px"><g:link>Data service management</g:link></div> <div style="width :140px"><g:link controller="asset" action="list">Asset manager</g:link></div>  </div>

<div >
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Asset's List</h2>
    </div>
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

                        <th></th>
                        <th></th>

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

                            <td>
                                <g:link action="edit" params="[id:assetInstance.id]"><button value='Edit' class="buttonClass1">Edit</button></g:link>
                            </td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:link controller="asset" action="create"><button value='Create New' class="buttonClass1" style='float:left; margin-top:5px'>Add +</button></g:link>
        </div>
    </div>

</div>


    </body>
</html>
