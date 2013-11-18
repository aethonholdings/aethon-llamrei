

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
                                <g:textField  class='textInput' name="dataType" value="${timeSeriesInstance?.dataType}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="description"><g:message code="timeSeries.description.label" default="Description" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: timeSeriesInstance, field: 'description', 'errors')}">
                                <g:textField  class='textInput' name="description" value="${timeSeriesInstance?.description}" />
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