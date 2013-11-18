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




<div>

    <h2>Copy state model</h2>


<div class="dialog">
    <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
    </g:if>

    <g:form id="copy-form" method="get">
        <label for="assetSelection" style="margin-left:05px; font-size: 18px;">
            <g:message code="asset selection" default=" Select Assets"/>
        </label>
        <g:select id="assetSelection" style="margin-left: 20px; width: 150px; " name="assetId" from="${Asset.list()}"
                  noSelection="['': 'Please Select']" optionKey="id" optionValue="assetName"/>

        <g:hiddenField name="stateModelId" value="${stateModelId}" />

        <g:actionSubmit value="Continue" style="display: inline" action="copyStateModel" class='actionButton' />


    </g:form>



<g:form controller="stateModel" style='display: inline' action="edit" params="[id: stateModelId]" value="Cancel">
        <button value='Cancel' class="actionButton">Cancel</button>
    </g:form>

</div>



</body>
</html>



