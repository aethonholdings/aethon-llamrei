<%@ page import="com.llamrei.domain.StateModel; com.llamrei.domain.Asset; com.llamrei.domain.TimeSeries" %>
<div id="state-form">
    <div>
        <label class="lb"><g:message code="title.stateRule.timeSeries"/></label>

        <g:set var="stateModelInstance" value="${StateModel.findById(stateModelId)}"/>
        <g:set var="timeSeriesList" value="${stateModelInstance.asset.timeSeries}" />
        <g:select id="state.stateRule.timeSeries" name="state.stateRule.timeSeries"
                  from="${timeSeriesList}"
                  optionKey="id"
                  optionValue="name"
                  style="margin-left: 5%;"/>
    </div>
    <div>
        <label class="lb"><g:message code="title.stateRule.ruleType"/></label>
        <g:select id="state.stateRule.ruleType" name="state.stateRule.ruleType" from="${['>', '<', '=' ,'&le']}" />
    </div>
    <div>
        <label class="lb"><g:message code="title.stateRule.ruleValue"/></label>
        <g:textField class="field" id="state.stateRule.ruleValue" name="state.stateRule.ruleValue" value="" style="margin-left: 5%;"/>
    </div>
</div>

<div>
    <a onclick="addStateRule()" class="actionButton">
    <span><g:message code="button.add"/></span>
</a>
</div>

