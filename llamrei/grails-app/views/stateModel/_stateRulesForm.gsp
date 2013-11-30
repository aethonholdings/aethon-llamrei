<%@ page import="com.llamrei.utils.Operators; com.llamrei.domain.StateModel; com.llamrei.domain.Asset; com.llamrei.domain.TimeSeries" %>
<%@page defaultCodec="html" %>
<div id="state-form">

    <table>
      <tr>
      <td>

        <label class="lb"><g:message code="title.stateRule.timeSeries"/></label>

        <g:set var="stateModelInstance" value="${StateModel.findById(stateModelId)}"/>

        <g:set var="timeSeriesList" value="${stateModelInstance.asset.timeSeries}" />
        <g:select id="state.stateRule.timeSeries" name="state.stateRule.timeSeries"
                  from="${timeSeriesList}"
                  optionKey="id"
                  optionValue="name"
                  style="margin-left: 5%;"/>
   </td>
        </tr>
    <tr>
        <td>
        <label class="lb"><g:message code="title.stateRule.ruleType"/></label>

        %{--<g:select id="state.stateRule.ruleType"--}% %{--name="state.stateRule.ruleType"--}% %{--from="${['&le.encodeAsHTML()']}" />--}%
        <select id="state.stateRule.ruleType" name="state.stateRule.ruleType" style="margin-left: 5.5%" >
            <option value="${Operators.LESS_THAN_EQUALS.getShortName()}">&le;</option>
            <option value="${Operators.GREATER_THAN_EQUALS.getShortName()}">&ge;</option>
            <option value="${Operators.LESS_THAN.getShortName()}"><</option>
            <option value="${Operators.GREATER_THAN.getShortName()}">></option>
            <option value="${Operators.EQUALS.getShortName()}">=</option>
            <option value="${Operators.NOT_EQUALS.getShortName()}">&ne;</option>
        </select>
    </td>
        </tr>
    <tr>
        <td>
        <label class="lb"><g:message code="title.stateRule.ruleValue"/></label>
        <g:textField class="field" id="state.stateRule.ruleValue" name="state.stateRule.ruleValue" value="" style="margin-left: 5%;"/>
        </td>
        </tr>
     </table>

<div>
    <a onclick="addStateRule()" class="actionButton">
    <span>Add Rule</span>
</a>
</div>

  </div>