

<%@ page import="llamreiAssets.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>
%{--<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>--}%
<g:render template="/layouts/adminSubMenu" />
<div>
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Associate TimeSeries With Assets</h2>
    </div>
    <div style="margin-left: 20px;font-size: 20px;">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${timeSeries}">
                <div class="errors">
                    <g:renderErrors bean="${timeSeries}" as="list" />

                </div>
            </g:hasErrors>
            <g:hasErrors bean="${associatedTimeSeries}">
                <div class="errors">
                    <g:renderErrors bean="${associatedTimeSeries}" as="list" />

                </div>
            </g:hasErrors>
            <g:hasErrors bean="${assetInstance}">
                <div class="errors">
                    <g:renderErrors bean="${assetInstance}" as="list" />

                </div>
            </g:hasErrors>

            %{--<g:form action="associateTimeSeries" params="[id:assetInstance.id,timeSeries:timeSeries]" >--}%
            <g:form action="associateTimeSeries" params="[id:assetInstance.id]" >
                <div class="dialog" style="overflow-x:auto; height:200px; border:1px solid #ccc" >

                    <table style='border: 0px' >
                        <tbody>



                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="assetName"><g:message code="asset.assetName.label" default="Asset Name" /></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'assetName', 'errors')}">
                                <g:textField name="assetName" value="${assetInstance?.assetName}" readonly='true' />
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="timeSeries"><g:message code="asset.clientName.label" default="Time Series" /></label>
                            </td>

                            <td>
                            <div id='timeSeries' style="width: 25% ; border: 0px solid gainsboro; ">

                                <g:each var="series"   in="${timeSeries}">
                                <div  style="width: 50%; float:left; margin-top:7px" >
                                   <label for="timeSeries" ><g:message code="${series?.name}"  value="${series?.name}" /></label>
                                 </div>
                                  <div style="width: 50%; float: right;margin-top:3px">
                                  %{-- <g:checkBox  chkId="${timeSeries?.id}" name="box" value="${timeSeries?.name}" checked="unchecked" style="margin-left: 25px" >${timeSeries?.name}</g:checkBox>--}%
                                  <g:checkBox id="series${series?.id}" name="series" value="${series?.id}" style="margin-left: 5px ;float:right" checked="unchecked"></g:checkBox>
                                  </div>

                                 </g:each>
                                  <g:hiddenField name="hiddenField"  id="hiddenField" />
                             </div>
                        </td>
                        </tr>



                        </tbody>
                    </table>
                </div>
                <div >
                    <span>
                        %{--        <g:submitButton name="Create" class="save"
                     value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
                        <input type="SUBMIT" class="buttonClass" value="Associate" id="createAsset" onclick="getCheckedTimeSeries()" />
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