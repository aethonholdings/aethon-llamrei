<div id="state-form">
    <g:hiddenField name="stateModelId" value="${stateModelId}" />
    <div>
        <label class="lb"><g:message code="title.state.name"/></label>
        <g:textField class="field" name="state.name" value="" style="margin-left: 8%;" />
    </div>
    <div style="display: inline;">
        <label class="lb"><g:message code="title.state.description"/></label>
        <g:textField class="field" name="state.description" value="" style="margin-left: 5%;"/>
    </div>
    <div style="display: inline;">
        <div class="box-cards">
            <div class="box-cards-title">
                <a class="btn-open" href="#"><span><g:message code="title.state.stateRules"/></span></a>
            </div>

            <div class="box-card-hold">
                <div style="position:relative">
                    <div id="stateRules">
                        <g:render template="statesRules" model="[stateModelId:stateModelId]" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div>
    <a onclick="addState()" class="actionButton">
        <span><g:message code="button.add"/></span>
    </a>

</div>