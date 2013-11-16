

<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>
%{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
<g:render template="/layouts/adminSubMenu" />
<div class='menuItem'>
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Edit Asset</h2>
    </div>
    <div style="margin-left: 20px;font-size: 20px;border:1px solid">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${assetInstance}">
                <div class="errors">
                    <g:renderErrors bean="${assetInstance}" as="list" />
                </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${assetInstance?.id}" />
                <g:hiddenField name="version" value="${assetInstance?.version}" />
                <div class="dialog">
                    <table style='border:0px'>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="assetName"><g:message code="asset.assetName.label" default="asset Name" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'assetName', 'errors')}">
                                <g:textField  class='textInput' name="assetName" value="${assetInstance?.assetName}" />
                            </td>
                        </tr>



                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="clientName"><g:message code="asset.clientName.label" default="client Name" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'clientName', 'errors')}">
                                <g:textField  class='textInput' name="clientName" value="${assetInstance?.clientName}" />
                            </td>
                        </tr>



                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="stateModelId"><g:message code="asset.stateModelId.label" default="stateModel Id" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'stateModelId', 'errors')}">
                                <g:textField  class='textInput' name="stateModelId" value="${assetInstance?.stateModelId}" />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="imageurl"><g:message code="asset.assetName.label" default="imageurl" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'imageurl', 'errors')}">
                                <g:textField  class='textInput' name="imageurl" value="${assetInstance?.assetName}" />
                            </td>
                        </tr>



                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="location"><g:message code="asset.location.label" default="Location" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'location', 'errors')}">
                                <g:textField  class='textInput' name="location" value="${assetInstance?.location}" />
                            </td>
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="imagethumburl"><g:message code="asset.imagethumburl.label" default="Imagethumburl" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'imagethumburl', 'errors')}">
                                <g:textField  class='textInput' name="imagethumburl" value="${assetInstance?.imagethumburl}" />
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>
                <div style='display: inline; width:auto'>
                <g:actionSubmit  action="update" class='buttonClass1' value="Update">Update</g:actionSubmit>

            </g:form>

            <g:form controller="asset" style= 'display: inline' action="delete" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" params="[id:assetInstance.id]"><button value='Delete Asset' class="buttonClass1">Delete</button></g:form>
            <g:link action="list">
                <input type="button" class='buttonClass1' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
            </g:link>
            <g:form controller="statemodel" style= 'display: inline'  action="list" ><button value='editstatemodel' class="buttonClass1">Edit State Model</button></g:form>
            <g:form controller="asset" style= 'display: inline'   action=" associateTimeSeries" params="[id:assetInstance.id]"><button value='editstatemodel' class="buttonClass1" style="width:auto">Associate Time Series</button></g:form>

        </div>
        </div>
    </div>
</div>
</body>
</html>
