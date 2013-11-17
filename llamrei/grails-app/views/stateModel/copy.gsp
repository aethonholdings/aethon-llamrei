<%--
  Created by IntelliJ IDEA.
  User: Dell
  Date: 11/16/13
  Time: 2:06 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.llamrei.domain.Asset" contentType="text/html;charset=UTF-8" %>
<html>

<head>
    <meta name="layout" content="main"/>

</head>

<body>

<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile"
                                                                    action="list">Manage Users</g:link></div>

    <div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div>

    <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>

    <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div>
</div>


<div style="width: 100%;background-color: #666666;">
    <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Copy State Model From Existing Assets</h2>
</div>

<div class="dialog">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:form id="copy-form" method="get">
        <label for="assetSelection" style="margin-left:50px; font-size: 18px;">
            <g:message code="asset selection" default=" Select Assets"/>
        </label>
        <g:select id="assetSelection" style="margin-left: 20px; width: 150px; " name="assetId" from="${Asset.list()}"
                  noSelection="['': 'Please Select']" optionKey="id" optionValue="assetName"/>

        <g:hiddenField name="stateModelId" value="${stateModelId}" />
        <g:actionSubmit value="Continue" action="copyStateModel" class='buttonClass1' />
        <g:form controller="stateModel" style='display: inline' action="edit" value="Cancel"><button value='Cancel'
                                                                                                     class="buttonClass1">Cancel</button></g:form>
    </g:form>

</div>



</body>
</html>



