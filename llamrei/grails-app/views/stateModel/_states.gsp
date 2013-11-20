<div class="table-box">
    <table cellspacing="0" cellpadding="0">
        <thead>
        <tr class="ui-widget-header">
        <th width="150px"><g:message code="title.state.name"/></th>
        <th width="150px"><g:message code="title.state.description"/></th>
        <th width="150px"><g:message code="title.state.stateRules"/></th>
        </thead>
        <tbody>
        <g:each in="${states}" var="state">
            <tr>
                <td>${state.name}</td>
                <td>${state.description}</td>
                <td>${state.stateRules}</td>
            </tr>
        </g:each>
        <tr>
            <td colspan="3">
                <a onclick="showStateForm()" class="actionButton">
                    <span><g:message code="button.add.state"/></span>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<div id="stateForm" style="display: none">
     <g:render template="statesForm" model="[stateModelId:stateModelId]" />
</div>