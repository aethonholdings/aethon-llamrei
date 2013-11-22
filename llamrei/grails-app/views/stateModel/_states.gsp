<%@ page import="com.llamrei.domain.StateModel" %>

%{--<script type="text/javascript">--}%

  %{--function addStateRuleRow(table1){--}%
      %{--var table = document.getElementById(table1);--}%

      %{--var rowCount = table.rows.length;--}%
      %{--var row = table.insertRow(rowCount);--}%

      %{--var cell1 = row.insertCell(0);--}%
      %{--var element1 = document.createElement("select");--}%
       %{--element1.name="state.stateRule-${stateRule.id}.timeSeries"--}%
      %{--cell1.appendChild(element1);--}%



      %{--var cell2 = row.insertCell(1);--}%
      %{--var element2 = document.createElement("select");--}%
      %{--element2.name="state.stateRule-${stateRule.id}.ruleType"--}%
      %{--cell2.appendChild(element2);--}%

      %{--var cell3=row.insertCell(2);--}%
      %{--var element3=document.createElement("Text");--}%
      %{--element3.name="state.stateRule-${stateRule.id}.ruleValue1--}%
      %{--element3.type="text"--}%

  %{--}--}%



%{--</script>--}%

<div id="table-box1" class="table-box">
   <table cellspacing="0" cellpadding="0">
       <thead>
       <tr class="ui-widget-header">
       <th width="150px"><g:message code="title.state.name"/></th>
        <th width="150px"><g:message code="title.state.description"/></th>
        <th ><g:message code="title.state.stateRules"/></th>
        <th></th>
        <th></th>
        </thead>
        <tbody>
        <th>
        <g:each in="${states}" var="state">
                <tr id="state-${state.id}">
                    <td>
                        %{--${state.name}--}%
                        <input type="text"
                               id="state-${state.id}.name"
                               name="state-${state.id}.name"
                               value="${state.name}"
                        />
                    </td>
                %{--<td>${state.description}</td>--}%
                    <td>
                    <input type="text"
                               id="state-${state.id}.description"
                               name="state-${state.id}.description"
                               value="${state.description}"
                        />
                    </td>
                <td>
                    <table id="table1">
                        <th>State Rule Id</th>
                        <th>Time Series Id</th>
                        <th>Rule Type</th>
                        <th>Rule Value</th>
                        <th></th>
                        <th></th>
                        <g:set var="stateModelInstance" value="${StateModel.findById(stateModelId)}"/>
                        <g:set var="timeSeriesList" value="${stateModelInstance.asset.timeSeries}" />
                        <g:each in="${state.stateRules}" var="stateRule">
                            <tr id="stateRule-${stateRule.id}">
                                <td> ${stateRule.id}</td>
                                <td>
                                    %{--${stateRule.timeSeries.id}--}%
                                    <g:select id="state.stateRule-${stateRule.id}.timeSeries"
                                              name="state.stateRule-${stateRule.id}.timeSeries"
                                              from="${timeSeriesList}"
                                              optionKey="id"
                                              optionValue="name"
                                              value="${stateRule.timeSeries.id}"
                                              style="margin-left: 5%;"/>
                                </td>
                                <td>
                                    %{--${stateRule.ruleType}--}%
                                    <g:select id="state.stateRule-${stateRule.id}.ruleType"
                                              name="state.stateRule-${stateRule.id}.ruleType"
                                              from="${['>', '<', '=' ,'&le']}"
                                              value="${stateRule.ruleType}"
                                              style="margin-left: 5%;"/>
                                </td>
                                <td>
                                    %{--${stateRule.ruleValue1}--}%
                                    <input type="text"
                                           id="state.stateRule-${stateRule.id}.ruleValue1"
                                           name="state.stateRule-${stateRule.id}.ruleValue1"
                                           value="${stateRule.ruleValue1}"
                                    />
                                </td>


                                <td>
                                    <a onclick="deleteStateRule('${stateRule.id}')"class="actionButton" style="display:inline">
                                        <span><g:message code="button.add.stateRule.delete"/>
                                        </span>
                                    </a>

                                </td>
                                <td>
                                    <a onclick="updateStateRule('${stateRule.id}')"class="actionButton" style="display:inline">
                                        <span><g:message code="button.add.stateRule.update"/>
                                        </span>
                                    </a>
                                </td>
                            </tr>

                        </g:each>

                    </table>
                    <div>
                        <a onclick="addStateRuleRow('table1')" class="actionButton">
                            <span><g:message code="button.add.state.rule"/></span>
                        </a>
                    </div>
                    %{--<div id="ruleToggleAtTop" style="display: none">--}%
                        %{--<g:render template="ruleToggleAtTop" model="[stateModelId:stateModelId]" />--}%
                    %{--</div>--}%
                </td>
                             <td>
                                  <a onclick="deleteState('${state.id}')"class="actionButton" style="display:inline">
                                      <span><g:message code="button.add.state.delete"/>
                                        </span>
                                      </a>
                                </td>

                    <td>
                        <a onclick="updateState('${state.id}')"class="actionButton" style="display:inline">
                            <span><g:message code="button.add.state.update"/>
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
     <g:render template="statesForm" model="[stateModelId:stateModelId]" />
</div>