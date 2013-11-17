

<%@ page import="com.llamrei.domain.StateModel" %>
<html>
<head>
    <meta name="layout" content="main"/>


</head>
    <body>
    <div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>
    <div>
        <div style="width: 100%;background-color: #666666;">
            <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Create State Model</h2>
        </div>
        <div>
        <div style="margin-left: 20px;font-size: 20px;">
        <div class="body">

            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stateModelInstance}">
            <div class="errors">
                <g:renderErrors bean="${stateModelInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="stateModelId"><g:message code="stateModel.stateModelId.label" default="State Model Id" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateModelInstance, field: 'stateModelId', 'errors')}">
                                    <g:textField name="stateModelId" value="${stateModelInstance?.stateModelId}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="asset"><g:message code="stateModel.asset.label" default="Asset" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateModelInstance, field: 'asset', 'errors')}">
                                    <g:select name="asset.id" from="${com.llamrei.domain.Asset.list()}" optionKey="id" value="${stateModelInstance?.asset?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="stateModel.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateModelInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${stateModelInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="name"><g:message code="stateModel.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateModelInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${stateModelInstance?.name}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div >
                    <span>
            %{--        <g:submitButton name="Create" class="save"
         value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
                <input type="SUBMIT" class="buttonClass" value="Create" id="createAsset"/>
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
