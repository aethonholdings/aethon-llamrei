<div id="state-form">
    <div>
        <label class="lb"><g:message code="title.stateRule.timeSeries"/></label>
        <g:select id="state.stateRule.timeSeries" name="state.stateRule.timeSeries"
                  from="${com.llamrei.domain.TimeSeries.list()}"
                  optionKey="id"
                  optionValue="name"
                  style="margin-left: 5%;"/>
    </div>
    <div>
        <label class="lb"><g:message code="title.stateRule.ruleType"/></label>
        <g:textField class="field" id="state.stateRule.ruleType" name="state.stateRule.ruleType" value="" style="margin-left: 5%;"/>
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