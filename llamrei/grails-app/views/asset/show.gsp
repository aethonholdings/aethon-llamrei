
<%@ page import="llamreiAssets.Asset" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'asset.label', default: 'Asset')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.deviceId.label" default="Device Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "deviceId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.creationDate.label" default="Creation Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${assetInstance?.creationDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.modificationDate.label" default="Modification Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${assetInstance?.modificationDate}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.createdBy.label" default="Created By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${assetInstance?.createdBy?.id}">${assetInstance?.createdBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.modifiedBy.label" default="Modified By" /></td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${assetInstance?.modifiedBy?.id}">${assetInstance?.modifiedBy?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.assetId.label" default="Asset Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "assetId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.assetName.label" default="Asset Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "assetName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.clientName.label" default="Client Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "clientName")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.location.label" default="Location" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "location")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.stateModelId.label" default="State Model Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "stateModelId")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.imageurl.label" default="Imageurl" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "imageurl")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.imagethumburl.label" default="Imagethumburl" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "imagethumburl")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: assetInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="asset.seriesdetails.label" default="Seriesdetails" /></td>
                            
                            <td valign="top" style="text-align: left;" class="value">
                                <ul>
                                <g:each in="${assetInstance.seriesdetails}" var="s">
                                    <li><g:link controller="seriesDetails" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                                </ul>
                            </td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${assetInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
