
<%@ page import="com.llamrei.domain.Alerts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'alerts.label', default: 'Alerts')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>

        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                <g:sortableColumn property="created" title="${message(code: 'alerts.created.label', default: 'Created')}" />
                            <g:sortableColumn property="eventType" title="${message(code: 'alerts.eventType.label', default: 'Event Type')}" />
                            <g:sortableColumn property="details" title="${message(code: 'alerts.details.label', default: 'Details')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${alertsInstanceList}" status="i" var="alertsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <td><g:formatDate date="${alertsInstance.created}" /></td>
                            <td>${fieldValue(bean: alertsInstance, field: "eventType")}</td>
                            <td>${fieldValue(bean: alertsInstance, field: "details")}</td>
                        </tr>
                     </g:each>
                    <g:link controller="assetMonitor" action='assetMonitorDetail'  params="[assetId:assetId]">
                    <button value='Back'  id='backButton' class="actionButton">Back</button>
                    </g:link>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
