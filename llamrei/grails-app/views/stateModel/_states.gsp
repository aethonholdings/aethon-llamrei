<div id="table-box1" class="table-box">
    <table cellspacing="0" cellpadding="0">
        <thead>
        <tr class="ui-widget-header">
        <th width="150px"><g:message code="title.state.name"/></th>
        <th width="150px"><g:message code="title.state.description"/></th>
        <th ><g:message code="title.state.stateRules"/></th>
        <th></th>
        </thead>
        <tbody>
        <th>
        <g:each in="${states}" var="state">
                <tr id="state-${state.id}">
                <td>${state.name}</td>
                <td>${state.description}</td>

                <td>
                    <table>
                        <th>State Rile Id</th>
                        <th>Rule Type</th>
                        <th>Rule Value</th>
                        <th>Time Series</th>
                        <th></th>
                        <g:each in="${state.stateRules}" var="stateRule">
                            <tr id="stateRule-${stateRule.id}">
                                <td> ${stateRule.id}</td>
                                <td> ${stateRule.ruleType}</td>
                                <td>${stateRule.ruleValue1}</td>
                                <td>${stateRule.timeSeriesId}</td>
                                <td>
                                    <a onclick="deleteStateRule('${stateRule.id}')"class="actionButton" style="display:inline">
                                        <span><g:message code="button.add.stateRule.delete"/>
                                        </span>
                                    </a>
                                </td>
                            </tr>
                        </g:each>

                    </table>
                </td>
                             <td>
                                  <a onclick="deleteState('${state.id}')"class="actionButton" style="display:inline">
                                      <span><g:message code="button.add.state.delete"/>
                                        </span>
                                      </a>
                                </td>

            </tr>
        </g:each>
       <div>
                <a onclick="showStateForm()" class="actionButton" style="display:inline">
                    <span><g:message code="button.add.state"/></span>
                </a>
          </div>
        </th>
        </tbody>

    </table>
</div>

<div id="stateForm" style="display: none">
     <g:render template="statesForm" model="[stateModelId:stateModelId]" />
</div>