

<%@ page import="com.llamrei.domain.Alerts" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'alerts.label', default: 'Alerts')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${alertsInstance}">
            <div class="errors">
                <g:renderErrors bean="${alertsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${alertsInstance?.id}" />
                <g:hiddenField name="version" value="${alertsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="details"><g:message code="alerts.details.label" default="Details" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: alertsInstance, field: 'details', 'errors')}">
                                    <g:textField name="details" value="${alertsInstance?.details}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="asset"><g:message code="alerts.asset.label" default="Asset" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: alertsInstance, field: 'asset', 'errors')}">
                                    <g:select name="asset.id" from="${com.llamrei.domain.Asset.list()}" optionKey="id" value="${alertsInstance?.asset?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="eventType"><g:message code="alerts.eventType.label" default="Event Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: alertsInstance, field: 'eventType', 'errors')}">
                                    <g:select name="eventType" from="${alertsInstance.constraints.eventType.inList}" value="${alertsInstance?.eventType}" valueMessagePrefix="alerts.eventType"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="created"><g:message code="alerts.created.label" default="Created" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: alertsInstance, field: 'created', 'errors')}">
                                    <g:datePicker name="created" precision="day" value="${alertsInstance?.created}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
