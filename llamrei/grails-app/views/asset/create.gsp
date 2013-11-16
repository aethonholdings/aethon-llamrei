

<%@ page import="com.llamrei.domain.Asset" %><html>

<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class='menuItem'>
    <h2>Create Asset</h2>
    <div style="margin-left: 20px;font-size: 20px;">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assetInstance}">
                <div class="errors">
                    <g:renderErrors bean="${assetInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form action="save">
                <div class="dialog">
                    <table>
                        <tbody>



                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="assetName"><g:message code="asset.assetName.label" default="Asset Name" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: assetInstance, field: 'assetName', 'errors')}">
                                <g:textField  class='textInput' name="assetName" value="${assetInstance?.assetName}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="clientName"><g:message code="asset.clientName.label" default="Client Name" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: assetInstance, field: 'clientName', 'errors')}">
                                <g:textField  class='textInput' name="clientName" value="${assetInstance?.clientName}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="location"><g:message code="asset.location.label" default="Location" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: assetInstance, field: 'location', 'errors')}">
                                <g:textField  class='textInput' name="location" value="${assetInstance?.location}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="stateModelId"><g:message code="asset.stateModelId.label" default="State Model Id" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: assetInstance, field: 'stateModelId', 'errors')}">
                                <g:textField  class='textInput' name="stateModelId" value="${assetInstance?.stateModelId}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="imageurl"><g:message code="asset.imageurl.label" default="Imageurl" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: assetInstance, field: 'imageurl', 'errors')}">
                                <g:textField  class='textInput' name="imageurl" value="${assetInstance?.imageurl}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="imagethumburl"><g:message code="asset.imagethumburl.label" default="Imagethumburl" /></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: assetInstance, field: 'imagethumburl', 'errors')}">
                                <g:textField  class='textInput' name="imagethumburl" value="${assetInstance?.imagethumburl}" />
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

    </div>

</div>

</body>

</html>