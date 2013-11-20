<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>

<body>
<div class='menuItem'>
    <h2>Edit Asset</h2>
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
            <g:form method="post">
                <g:hiddenField name="id" value="${assetInstance?.id}"/>
                <g:hiddenField name="version" value="${assetInstance?.version}"/>
                <div class="dialog">
                    <table>
                        <tbody>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="assetName"><g:message code="asset.assetName.label"
                                                                  default="asset Name"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'assetName', 'errors')}">
                                <g:textField class='textInput' name="assetName" value="${assetInstance?.assetName}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="clientName"><g:message code="asset.clientName.label"
                                                                   default="client Name"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'clientName', 'errors')}">
                                <g:textField class='textInput' name="clientName" value="${assetInstance?.clientName}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="location"><g:message code="asset.location.label"
                                                                 default="Location"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'location', 'errors')}">
                                <g:textField class='textInput' name="location" value="${assetInstance?.location}"/>
                            </td>
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="assetUniqueID"><g:message code="asset.assetUniqueID.label"
                                                                      default="Asset Unique ID" /></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'assetUniqueID', 'errors')}">
                                <g:textField name="assetUniqueID" value="${assetInstance?.assetUniqueID}" disabled="true"/>
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
                            <td valign="top" class="name">
                                <label for="imageurl"><g:message code="asset.imageurl.label"
                                                                 default="Imageurl"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: assetInstance, field: 'imageurl', 'errors')}">
                                <g:textField name="imageurl" value="${assetInstance?.imageurl}"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div style='display: inline; width:auto'>
                <g:actionSubmit  action="updateAsset" class='actionButton' value="Update">Update</g:actionSubmit>

            </g:form>

            <g:form controller="assetManagement" style= 'display: inline' action="deleteAsset" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure you would like to delete this asset?')}');" params="[id:assetInstance.id]"><button value='Delete Asset' class="actionButton">Delete</button></g:form>
            <g:link controller="assetManagement" action="listAssets">
                <input type="button" class='actionButton' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
            </g:link>
            <g:form controller="stateModel" params="[id: assetInstance.id]" style= 'display: inline'  action="edit" ><button value='editstatemodel' class="actionButton">Edit State Model</button></g:form>
            <g:form controller="assetManagement" style= 'display: inline' action=" goToAssociateTimeSeries" params="[id:assetInstance.id]"><button value='editstatemodel' class="actionButton" style="width:auto">Associate Time Series</button></g:form>

        </div>
        </div>
    </div>
</div>
</body>
</html>
