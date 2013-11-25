<%@ page import="com.llamrei.domain.StateModel; com.llamrei.domain.Asset; com.llamrei.domain.TimeSeries" %>
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
            <option value="">&le;</option>
            <option value="">&ge;</option>
            <option value=""><</option>
            <option value="">></option>
            <option value="">=</option>
            <option value="">&ne;</option>
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
    <span><g:message code="button.add"/></span>
</a>
</div>

  </div>