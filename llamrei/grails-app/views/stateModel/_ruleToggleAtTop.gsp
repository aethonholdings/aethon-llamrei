<%@ page import="com.llamrei.utils.Operators; com.llamrei.domain.StateModel" %>
<%@page defaultCodec="html" %>
<tr id="stateRule-${stateRule?.id}">
    <td>
        <g:set var="stateModelInstance" value="${StateModel.findById(stateModelId)}"/>
        <g:set var="timeSeriesList" value="${stateModelInstance.asset.timeSeries}"/>
        <g:select id="states.${stateId}.stateRules.${stateRule?.id}.timeSeries"
                  name="states.${stateId}.stateRules.${stateRule?.id}.timeSeries"
                  from="${timeSeriesList}"
                  optionKey="id"
                  optionValue="name"
                  value="${stateRule?.timeSeries?.id}"
                  style="margin-left: 5%;"/>
    </td>
    <td>  //${stateRule?.ruleType}//
        <select id= "states.${stateId}.stateRules.${stateRule?.id}.ruleType"
                name="states.${stateId}.stateRules.${stateRule?.id}.ruleType"
                style="margin-left: 5%" >
            <option value="${Operators.LESS_THAN_EQUALS.getShortName()}">&le;</option>
            <option value="${Operators.GREATER_THAN_EQUALS.getShortName()}">&ge;</option>
            <option value="${Operators.LESS_THAN.getShortName()}"><</option>
            <option value="${Operators.GREATER_THAN.getShortName()}">></option>
            <option value="${Operators.EQUALS.getShortName()}">=</option>
            <option value="${Operators.NOT_EQUALS.getShortName()}">&ne;</option>
        </select>

    </td>
    <td>
        <input type="text"
               id="states.${stateId}.stateRules.${stateRule?.id}.ruleValue1"
               name="states.${stateId}.stateRules.${stateRule?.id}.ruleValue1"
               value="${stateRule?.ruleValue1}"/>

    </td>
    <td>
        <a onclick="deleteStateRule('${stateRule?.id}')" class="actionButton" style="display:inline">
            <span><g:message code="button.add.stateRule.delete"/>
            </span>
        </a>
    </td>
</tr>