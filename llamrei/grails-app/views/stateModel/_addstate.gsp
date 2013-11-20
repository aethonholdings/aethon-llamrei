<div id="addstate_clone" class="state-div" <g:if test="${hidden}">style="display:none;"</g:if>>


    <g:hiddenField name='statesList[${i}].id' value='${addstate?.id}'/>
    <g:hiddenField name='statesList[${i}].deleted' value='false'/>
    <g:hiddenField name='statesList[${i}].new' value="${addstate?.id == null?'true':'false'}"/>



    <span class="del-state">
        <img src="${resource(dir:'images/skin', file:'icon_delete.png')}"
             style="vertical-align:middle;"/>
    </span>
    <table>
    <tbody>
    <tr class="prop">
        <td valign="top" class="name">
            <label for="name"><g:message code="stateModel.name.label" default="Name"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: addstate, field: 'name', 'errors')}">
            <g:textField name="name" value="${addstate?.name}"/>
        </td>
    </tr>
    <tr class="prop">
        <td valign="top" class="name">
            <label for="description"><g:message code="stateModel.name.label" default="description"/></label>
        </td>
        <td valign="top" class="value ${hasErrors(bean: addstate, field: 'name', 'errors')}">
            <g:textField name="name" value="${addstate?.description}"/>
        </td>
    </tr>
    </tbody>
</table>



</div>
