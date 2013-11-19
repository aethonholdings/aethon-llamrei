

<%@ page import="com.llamrei.domain.State" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
    <body>
         <div>
             <h2>Add State</h2>
        <div class="body">

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stateInstance}">
            <div class="errors">
                <g:renderErrors bean="${stateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
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
                                    <label for="description"><g:message code="state.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${stateInstance?.description}" />
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
                %{--<div style='display: inline; width: 500px'>--}%
                %{--<g:actionSubmit action="save" class='actionButton' value="Add">Update</g:actionSubmit>--}%
            </g:form>
            </div>
        </div>
             </div>
    </body>
</html>
