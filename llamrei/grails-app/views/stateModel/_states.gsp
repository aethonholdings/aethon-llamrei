<%@ page import="com.llamrei.domain.StateModel" %>

<div id="table-box1" class="table-box">
    <table cellspacing="0" cellpadding="0">
        <thead>
        <tr class="ui-widget-header">
        <th width="150px"><g:message code="title.state.name"/></th>
        <th width="150px"><g:message code="title.state.description"/></th>
        <th><g:message code="title.state.stateRules"/></th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <th>
            <g:each in="${states}" var="state">
                <tr id="state-${state.id}">
                    <td>
                        <input type="text"
                               id="states.${state.id}.name"
                               name="states.${state.id}.name"
                               value="${state.name}"/>
                    </td>
                    <td>
                        <input type="text"
                               id="states.${state.id}.description"
                               name="states.${state.id}.description"
                               value="${state.description}"/>
                    </td>
                    <td>
                        <table id="state-${state.id}.stateRule-table">
                            <thead>
                            <tr>
                                <th>Time Series</th>
                                <th>Rule Type</th>
                                <th>Rule Value</th>
                                <th></th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${state.stateRules.sort{it.id}}" var="stateRule">
                                <g:render template="ruleToggleAtTop"
                                          model="[stateRule: stateRule, stateId: state?.id, stateModelId: stateModelId]"/>
                            </g:each>
                            </tbody>
                        </table>

                        <div>
                            <a onclick="addStateRuleRow('${state.id}')" class="actionButton">
                                <span><g:message code="button.add.state.rule"/></span>
                            </a>
                        </div>
                    </td>
                    <td>
                        <a onclick="deleteState('${state.id}')" class="actionButton" style="display:inline">
                            <span><g:message code="button.add.state.delete"/>
                            </span>
                        </a>
                    </td>

                </tr>
            </g:each>

        </th>
        </tbody>

    </table>

    <div>
        <a onclick="showStateForm()" class="actionButton" style="display:inline">
            <span><g:message code="button.add.state"/></span>
        </a>
    </div>
</div>

<div id="stateForm" style="display: none">
    <g:render template="statesForm" model="[stateModelId: stateModelId]"/>
</div>