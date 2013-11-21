

<%@ page import="com.llamrei.domain.TimeSeries" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'timeSeries.label', default: 'TimeSeries')}" />
    <title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
<div class='menuItem'>
    <h2>Administration</h2>
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

                        <td valign="middle" class="value ${hasErrors(bean: timeSeriesInstance, field: 'dataType', 'errors')}">
                            <g:select  class='value' name="dataType" from="${timeSeriesInstance.constraints.dataType.inList}" value="${timeSeriesInstance?.dataType}" valueMessagePrefix="timeSeries.dataType" style="width:170px" />
                      </td>
                    </tr>
                    <tr class="prop">
                        <td valign="middle" class="name">
                            <label for="dataType"><g:message code="timeSeries.inDashboard.label" default="Show In Dashboard" /></label>
                        </td>
                        <td valign="top" >
                            <input type="radio" name="myGroup" value="true" checked="${timeSeriesInstance.inDashboard}"/>True
                            <input type="radio" name="myGroup" value="false" checked="${timeSeriesInstance.inDashboard}" style='margin-left: 20px'/>False
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="timeSeries.description.label" default="Description" /></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: timeSeriesInstance, field: 'description', 'errors')}">
                            <g:textArea  class='textInput' name="description" value="${timeSeriesInstance?.description}" />
                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div style='display: inline; width: 500px'>
            <g:actionSubmit  action="update" class='actionButton' value="Update">Update</g:actionSubmit>
        %{-- <span class="button"><g:actionSubmit class="delete" action="delete"
                                              value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                              onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>--}%

        </g:form>
        <g:form controller="timeSeriesManagement" style= 'display: inline' action="delete" params="[id:timeSeriesInstance.id]"><button value='Delete User' onclick=" return confirm('Are you sure you want to delete this time series?');" id='deleteButton' class="actionButton" >Delete</button></g:form>

        <g:link  action="list"   value="Cancel"><button value='Cancel' class="actionButton">Cancel</button></g:link>



    </div>

    </div>

</div>


</body>
</html>