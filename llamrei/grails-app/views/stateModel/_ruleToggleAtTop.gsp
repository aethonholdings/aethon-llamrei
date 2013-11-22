<%@ page import="com.llamrei.domain.StateModel" %>
<div class="RuleTopTable-box">
    <table>
        <th>State Rule Id</th>
        <th>Rule Type</th>
        <th>Rule Value</th>
        <th>Time Series Id</th>
        <th></th>
        <th></th>
            <tr>
                <td></td>
                <td>
                    <g:select id="state.stateRule.ruleType"
                              name="state.stateRule.ruleType"
                              from="${['>', '<', '=' ,'&le']}"
                              value=""
                              style="margin-left: 5%;"/>
                </td>
                <td>
                    <input type="text"
                           id="state.stateRule.ruleValue1"
                           name="state.stateRule.ruleValue1"
                           value=""
                    />
                </td>
                <td>
                    <g:set var="stateModelInstance" value="${StateModel.findById(stateModelId)}"/>
                    <g:set var="timeSeriesList" value="${stateModelInstance.asset.timeSeries}" />
                    <g:select id="state.stateRule.timeSeries"
                              name="state.stateRule.timeSeries"
                              from="${timeSeriesList}"
                              optionKey="id"
                              optionValue="name"
                              style="margin-left: 5%;"/>
                </td>
                <td>
                    <a onclick="addStateRule1()" class="actionButton" style="display:inline">
                        <span><g:message code="button.add.state"/>
                        </span>
                    </a>
                </td>

            </tr>

    </table>

</div>
