

<%@ page import="com.llamrei.domain.Asset" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>
<div>
    <h2>Associate asset with time series</h2>
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
            <g:hasErrors bean="${assetInstance}">
                <div class="errors">
                    <g:renderErrors bean="${assetInstance}" as="list" />

                </div>
            </g:hasErrors>

          <g:form action="associateTimeSeries" params="[id:assetInstance.id,timeSeries:timeSeries]" >

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
                                <div  style="width: 50%; margin-top:7px" >
                                   <label for="timeSeries" ><g:message code="${series?.name}"  value="${series?.name}" /></label>
                                 </div>
                                  <div style="width: 50%; float: right;margin-top:0px">
                                  <g:set var="a_series" value="${assetInstance.timeSeries}"/>
                                 <g:if test="${a_series.contains(series)}">
                                  <g:checkBox id="series${series?.id}" name="series" value="${series?.id}" style="margin-left: 3px ;float:right" checked="true" ></g:checkBox>
                                 </g:if>
                                  <g:else>
                                  <g:checkBox id="series${series?.id}" name="series" value="${series?.id}" style="margin-left: 3px ;float:right" checked="false"></g:checkBox>
                              </g:else>
                                  </div>

                                 </g:each>
                             </div>
                        </td>
                            <g:hiddenField name="hiddenField"  id="hiddenField" />
                        </tr>
                        </tbody>
                    </table>
                </div>
                <div >
                    <span>
                        <input type="SUBMIT" class="actionButton" value="Associate" id="createAsset" onclick="getCheckedTimeSeries()" />
                    </span>
                    <span class="button">
                        <g:link action="listAssets">
                            <input type="button" class='actionButton' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
                        </g:link>
                    </span>
                </div>
            </g:form>
        </div>

    </div>

</div>

</body>

</html>