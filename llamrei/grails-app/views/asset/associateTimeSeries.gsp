

<%@ page import="llamreiAssets.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>
</head>
<body>
<div class='menuItem'>
    <h2>Associate TimeSeries With Assets</h2>
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
            <g:form action="save" >
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
                                <label for="clientName"><g:message code="asset.clientName.label" default="Time Series" /></label>
                            </td>
                            %{--<td valign="top" class="value ${hasErrors(bean: assetInstance, field: 'clientName', 'errors')}">--}%
                                %{--<g:textField name="clientName" value="${assetInstance?.clientName}" />--}%
                            %{--</td>--}%
                            <td>
                            <div id='timeSeries' style="width: 20% ;height: 100px; border: 0px solid gainsboro; ">
                               <div>

                                   <label for="Humidity" style="width: 50%"><g:message code="asset.assetName.label" default="Humidity"  /></label>
                                   <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />

                                   %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%
                                %{--<g:checkBox name='Temperature' value="Temperature" checked="unchecked"></g:checkBox>--}%

                            </div>
                            <div>
                                <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                %{--<g:checkBox name='snow' value="snow" checked="unchecked" />--}%
                            </div>
                            <div>
                                <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                            </div>
                            <div>
                                <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                            </div>
                            <div>
                                <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                            </div>
                                <div>
                                    <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                    <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                    %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                    %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                                </div>
                                <div>
                                    <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                    <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                    %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                    %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                                </div>
                                <div>
                                    <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                    <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                    %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                    %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                                </div>
                                <div>
                                    <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                    <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                    %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                    %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                                </div>
                                <div>
                                    <label for="Temperature"><g:message code="asset.assetName.label" default="Humidity" /></label>

                                    <g:checkBox name='precipitation' value="precipitation" checked="unchecked" style="margin-left: 5px" />
                                    %{--<label for="Temperature"><g:message code="asset.assetName.label" default="Temperature" /></label>--}%

                                    %{--<g:checkBox name='wind' value="wind" checked="unchecked" />--}%
                                </div>
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
                        <input type="SUBMIT" class="buttonClass" value="Associate" id="createAsset"/>
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