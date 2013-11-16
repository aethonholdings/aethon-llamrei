

<%@ page import="com.llamrei.domain.TimeSeries" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'timeSeries.label', default: 'TimeSeries')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
%{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
<g:render template="/layouts/adminSubMenu" />
<div class='menuItem'>
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Administration</h2>
    </div>
    <div class="body">

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${timeSeriesInstance}">
            <div class="errors">
                <g:renderErrors bean="${timeSeriesInstance}" as="list" />
            </div>
        </g:hasErrors>
        <g:form method="post" >
            <g:hiddenField name="id" value="${timeSeriesInstance?.id}" />
            <g:hiddenField name="version" value="${timeSeriesInstance?.version}" />
            <div class="dialog">
                <table>
                    <tbody>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="timeSeriesUniqueID"><g:message code="timeSeries.timeSeriesUniqueID.label" default="Time Series Unique ID" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: timeSeriesInstance, field: 'timeSeriesUniqueID', 'errors')}">
                            <g:textField  class='textInput' name="timeSeriesUniqueID" value="${timeSeriesInstance?.timeSeriesUniqueID}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="timeSeries.name.label" default="Name" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: timeSeriesInstance, field: 'name', 'errors')}">
                            <g:textField  class='textInput' name="name" value="${timeSeriesInstance?.name}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="units"><g:message code="timeSeries.units.label" default="Units" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: timeSeriesInstance, field: 'units', 'errors')}">
                            <g:textField  class='textInput' name="units" value="${timeSeriesInstance?.units}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="dataType"><g:message code="timeSeries.dataType.label" default="Data Type" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: timeSeriesInstance, field: 'dataType', 'errors')}">
                            <g:textField  class='textInput' name="dataType" value="${timeSeriesInstance?.dataType}" />
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="timeSeries.description.label" default="Description" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: timeSeriesInstance, field: 'description', 'errors')}">
                            <g:textField  class='textInput' name="description" value="${timeSeriesInstance?.description}" />
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div style='display: inline; width: 500px'>
            <g:actionSubmit  action="update" class='buttonClass1' value="Update">Update</g:actionSubmit>
        %{-- <span class="button"><g:actionSubmit class="delete" action="delete"
                                              value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>--}%

        </g:form>
        <g:form controller="timeSeries" style= 'display: inline' action="delete" params="[id:timeSeriesInstance.id]"><button value='Delete User' onclick=" return confirm('Are you sure you want to delete this TimeSeries?');" id='deleteButton' class="buttonClass1" >Delete</button></g:form>

        <g:link  action="list"   value="Cancel"><button value='Cancel' class="buttonClass1">Cancel</button></g:link>



    </div>

    </div>

</div>


</body>
</html>