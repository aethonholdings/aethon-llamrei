

<%@ page import="com.llamrei.domain.State" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>>
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
            <g:hasErrors bean="${stateInstance}">
            <div class="errors">
                <g:renderErrors bean="${stateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${stateInstance?.id}" />
                <g:hiddenField name="version" value="${stateInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="state.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${stateInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="state.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${stateInstance?.name}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stateId"><g:message code="state.stateId.label" default="State Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'stateId', 'errors')}">
                                    <g:textField name="stateId" value="${stateInstance?.stateId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stateModel"><g:message code="state.stateModel.label" default="State Model" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'stateModel', 'errors')}">
                                    <g:select name="stateModel.id" from="${com.llamrei.domain.StateModel.list()}" optionKey="id" value="${stateInstance?.stateModel?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="stateRules"><g:message code="state.stateRules.label" default="State Rules" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'stateRules', 'errors')}">
                                    
<ul>
<g:each in="${stateInstance?.stateRules?}" var="s">
    <li><g:link controller="stateRule" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="stateRule" action="create" params="['state.id': stateInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'stateRule.label', default: 'StateRule')])}</g:link>

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
