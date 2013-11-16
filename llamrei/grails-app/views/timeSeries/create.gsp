

<%@ page import="com.llamrei.domain.TimeSeries" %>
<html>
<head>
    <meta name="layout" content="main"/>


</head>
<body>
%{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
<g:render template="/layouts/adminSubMenu" />
<div class='menuItem'>
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Create TimeSeries</h2>
    </div>
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
                        %{--        <g:submitButton name="Create" class="save"
                                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
                        <input type="SUBMIT" class="buttonClass" value="Create" id="createUser"/>
                    </span>
                    <span class="button">
                        <g:link action="list">
                            <input type="button" class='buttonClass' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
                        </g:link>
                    </span>
                </div>
            </g:form>
        </div>
</body>
</html>