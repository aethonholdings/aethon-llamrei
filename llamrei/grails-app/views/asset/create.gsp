<%@ page import="com.llamrei.domain.Asset" %><html>

<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
%{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
<g:render template="/layouts/adminSubMenu"/>
<div class='menuItem'>
    <div style="width: 100%;background-color: #666666;">
        <h2>Create Asset</h2>
    </div>

    <div style="margin-left: 20px;font-size: 20px;border:1px solid">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assetInstance}">
                <div class="errors">
                    <g:renderErrors bean="${assetInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form action="save">
                <div class="dialog">
                    <table>
                        <tbody>



                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="assetName"><g:message code="asset.assetName.label"
                                                                  default="Asset Name"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'assetName', 'errors')}">
                                <g:textField name="assetName" value="${assetInstance?.assetName}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="description"><g:message code="asset.description.label"
                                                                    default="Description"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'description', 'errors')}">
                                <g:textField name="description" value="${assetInstance?.description}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="clientName"><g:message code="asset.clientName.label"
                                                                   default="Client Name"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: assetInstance, field: 'clientName', 'errors')}">
                                <g:textField class='textInput' name="clientName" value="${assetInstance?.clientName}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="location"><g:message code="asset.location.label"
                                                                 default="Location"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: assetInstance, field: 'location', 'errors')}">
                                <g:textField class='textInput' name="location" value="${assetInstance?.location}"/>
                            </td>
                        </tr>



                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="imageurl"><g:message code="asset.imageurl.label"
                                                                 default="Imageurl"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: assetInstance, field: 'imageurl', 'errors')}">
                                <g:textField class='textInput' name="imageurl" value="${assetInstance?.imageurl}"/>
                            </td>
                        </tr>


                        </tbody>
                    </table>
                </div>

                <div>
                    <span>
                        %{--        <g:submitButton name="Create" class="save"
                     value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
                        <input type="SUBMIT" class="buttonClass" value="Create" id="createStateModel"/>
                    </span>
                    <span class="button">
                        <g:link action="list">
                            <input type="button" class='buttonClass'
                                   value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
                        </g:link>
                    </span>
                </div>
            </g:form>
        </div>
    </div>
</div>
</body>
</html>
