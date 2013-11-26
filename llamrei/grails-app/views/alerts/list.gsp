
<%@ page import="com.llamrei.domain.Alerts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'alerts.label', default: 'Alerts')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
<<<<<<< HEAD
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
=======

>>>>>>> 0bd7e61c6a4c4c31c3ff0d506af349215320da1e
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
<<<<<<< HEAD
                        
                            <g:sortableColumn property="id" title="${message(code: 'alerts.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="details" title="${message(code: 'alerts.details.label', default: 'Details')}" />
                        
                            <th><g:message code="alerts.asset.label" default="Asset" /></th>
                        
                            <g:sortableColumn property="eventType" title="${message(code: 'alerts.eventType.label', default: 'Event Type')}" />
                        
                            <g:sortableColumn property="created" title="${message(code: 'alerts.created.label', default: 'Created')}" />
                        
=======

                            <g:sortableColumn property="created" title="${message(code: 'alerts.created.label', default: 'Created')}" />
                            <g:sortableColumn property="eventType" title="${message(code: 'alerts.eventType.label', default: 'Event Type')}" />
                            <g:sortableColumn property="details" title="${message(code: 'alerts.details.label', default: 'Details')}" />



>>>>>>> 0bd7e61c6a4c4c31c3ff0d506af349215320da1e
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${alertsInstanceList}" status="i" var="alertsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
<<<<<<< HEAD
                        
                            <td><g:link action="show" id="${alertsInstance.id}">${fieldValue(bean: alertsInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: alertsInstance, field: "details")}</td>
                        
                            <td>${fieldValue(bean: alertsInstance, field: "asset")}</td>
                        
                            <td>${fieldValue(bean: alertsInstance, field: "eventType")}</td>
                        
                            <td><g:formatDate date="${alertsInstance.created}" /></td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${alertsInstanceTotal}" />
            </div>
=======

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

>>>>>>> 0bd7e61c6a4c4c31c3ff0d506af349215320da1e
        </div>
    </body>
</html>
