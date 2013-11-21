

<%@ page import="com.llamrei.domain.TimeSeries" %>
<html>
<head>
    <meta name="layout" content="main"/>


</head>
<body>
    <h2>Create Time series</h2>
    <div style="margin-left: 20px;font-size: 20px;">
        <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${timeSeriesInstance}">
                <div class="errors">
                    <g:renderErrors bean="${timeSeriesInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="timeSeriesUniqueID"><g:message code="timeSeries.timeSeriesUniqueID.label" default="Time Series Unique ID" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: timeSeriesInstance, field: 'timeSeriesUniqueID', 'errors')}">
                                <g:textField class='textInput' name="timeSeriesUniqueID" value="${timeSeriesInstance?.timeSeriesUniqueID}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="name"><g:message code="timeSeries.name.label" default="Name" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: timeSeriesInstance, field: 'name', 'errors')}">
                                <g:textField  class='textInput' name="name" value="${timeSeriesInstance?.name}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle"class="name">
                                <label for="units"><g:message code="timeSeries.units.label" default="Units" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: timeSeriesInstance, field: 'units', 'errors')}">
                                <g:textField  class='textInput' name="units" value="${timeSeriesInstance?.units}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
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
                                <input type="radio" name="myGroup" value="true" />True
                                <input type="radio" name="myGroup" value="false" style='margin-left: 20px'/>False
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="description"><g:message code="timeSeries.description.label" default="Description" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: timeSeriesInstance, field: 'description', 'errors')}">
                                <g:textArea  class='textInput' name="description" value="${timeSeriesInstance?.description}" />
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div >
                    <span>
                        <input type="SUBMIT" class="actionButton" value="Create" id="createUser"/>
                    </span>
                    <span class="button">
                        <g:link action="list">
                            <input type="button" class='actionButton' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
                        </g:link>
                    </span>
                </div>
            </g:form>
</body>
</html>