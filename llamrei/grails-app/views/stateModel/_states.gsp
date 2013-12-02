<%@ page import="com.llamrei.domain.StateModel" %>

<div id="table-box1" class="table-box">
    <table cellspacing="0" cellpadding="0">
        <thead>
        <tr class="ui-widget-header">
        <th width="250px"><g:message code="title.state.name"/></th>
        <th width="300px"><g:message code="title.state.description"/></th>
        <th width="150px"><g:message code="title.state.stateRules"/></th>
        <th></th>


        </thead>
        <tbody>
        <th>
            <g:each in="${states?.sort{it?.id}}" var="state">
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
                        <div class="box-cards">
                            <div class="box-cards-title">
                                <a class="btn-open" href="#"><span><g:message code="title.state.stateRules"/></span></a>
                            </div>

                            <div class="box-card-hold">
                                <div style="position:relative">
                                    <div id="stateRulesTop">
                        <table id="state-${state.id}.stateRule-table">
                            <thead>
                            <tr>
                                <th >Time Series</th>
                                <th >Rule Type</th>
                                <th >Rule Value</th>
                                <th ></th>


                            </tr>
                            </thead>
                            <tbody>
                            <g:each in="${state?.stateRules?.sort{it?.id}}" status="i" var="stateRule">
                                <g:render template="ruleToggleAtTop"

                                          model="[stateRule: stateRule, stateId: state?.id, stateModelId: stateModelId,i:i]"/>
                            </g:each>
                            </tbody>
                        </table>

                        <div>
                            <a onclick="addStateRuleRow('${state.id}')" class="actionButton">
                                <span><g:message code="button.add.state"/></span>
                            </a>
                        </div>
                         </div>
                          </div>
                           </div>
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
        <a onclick="addStateRow()" class="actionButton" style="display:inline">
            <span><g:message code="button.add.state"/></span>
        </a>
    </div>
</div>