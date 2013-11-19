
%{--<%@ page import="com.llamrei.domain.StateModel" %>--}%
%{--<html>--}%
%{--<head>--}%
    %{--<meta name="layout" content="main"/>--}%

%{--</head>--}%
    %{--<body>--}%
    %{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
    %{--<div >--}%
        %{--<div style="width: 100%;background-color: #666666;">--}%
            %{--<h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">StateModel List</h2>--}%
        %{--</div>--}%
        %{--<div class="body">--}%

            %{--<g:if test="${flash.message}">--}%
            %{--<div class="message">${flash.message}</div>--}%
            %{--</g:if>--}%
            %{--<div class="list" style='text-align: center'>--}%
                %{--<table>--}%
                    %{--<thead class='thclass'>--}%
                        %{--<tr>--}%

                            %{--<th> State Model Id</th>--}%
                            %{--<th>Asset Unique Id</th>--}%
                            %{--<th>Description</th>--}%
                            %{--<th>Name</th>--}%

                            %{--<th></th>--}%

                        %{----}%
                        %{--</tr>--}%
                    %{--</thead>--}%
                    %{--<tbody class='tdclass'>--}%
                    %{--<g:each in="${stateModelInstanceList}" status="i" var="stateModelInstance">--}%
                        %{--<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">--}%
                        %{----}%

                        %{----}%
                            %{--<td>${fieldValue(bean: stateModelInstance, field: "stateModelId")}</td>--}%
                        %{----}%
                            %{--<td>${fieldValue(bean: stateModelInstance, field: "asset.assetUniqueID")}</td>--}%
                        %{----}%
                            %{--<td>${fieldValue(bean: stateModelInstance, field: "description")}</td>--}%
                        %{----}%
                            %{--<td>${fieldValue(bean: stateModelInstance, field: "name")}</td>--}%

                            %{--<td>--}%
                                %{--<g:link action="edit" params="[id:stateModelInstance.id]"><button value='Edit' class="buttonClass1">Edit</button></g:link>--}%
                            %{--</td>--}%
                        %{----}%
                        %{--</tr>--}%
                    %{--</g:each>--}%
                    %{--</tbody>--}%
                %{--</table>--}%
            %{--</div>--}%
            %{--<g:link controller="stateModel" action="create"><button value='Create New' class="buttonClass1" style='float:left; margin-top:5px'>Add +</button></g:link>--}%

            %{--<g:link controller="stateModel" action="copy"><button value='Copy asset' class="buttonClass1" style='float:left; margin-top:5px'>copy </button></g:link>--}%
        %{--</div>--}%
        %{--</div>--}%
    %{--</body>--}%
%{--</html>--}%
