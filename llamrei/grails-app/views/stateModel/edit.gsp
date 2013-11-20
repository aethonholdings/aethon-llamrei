<%@ page import="com.llamrei.domain.StateModel" %>
<html>
<head>
    <meta name="layout" content="main"/>

</head>

<body>



</div>

<div>

    <h2>Edit state model</h2>


    <div class="body">

        <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
        </g:if>
        <g:hasErrors bean="${stateModelInstance}">
            <div class="errors">
                <g:renderErrors bean="${stateModelInstance}" as="list"/>
            </div>
        </g:hasErrors>
        <g:form method="post">
            <g:hiddenField name="id" value="${stateModelInstance?.id}"/>
            <g:hiddenField name="version" value="${stateModelInstance?.version}"/>
            <div class="dialog">
                <table>
                    <tbody>

                    %{--<tr class="prop">--}%
                        %{--<td valign="top" class="name">--}%
                            %{--<label for="stateModelId"><g:message code="stateModel.stateModelId.label"--}%
                                                                 %{--default="State Model Id"/></label>--}%
                        %{--</td>--}%
                        %{--<td valign="top"--}%
                            %{--class="value ${hasErrors(bean: stateModelInstance, field: 'stateModelId', 'errors')}">--}%
                            %{--<g:textField name="stateModelId" value="${stateModelInstance?.stateModelId}"/>--}%
                        %{--</td>--}%
                    %{--</tr>--}%

                    %{--<tr class="prop">--}%
                        %{--<td valign="top" class="name">--}%
                            %{--<label for="asset"><g:message code="stateModel.asset.label"--}%
                                                          %{--default="Asset Unique Id"/></label>--}%
                        %{--</td>--}%
                        %{--<td valign="top" class="value ${hasErrors(bean: stateModelInstance, field: 'asset', 'errors')}">--}%

                            %{--<g:textField name="assetUniqueId" value="${stateModelInstance?.asset?.assetUniqueID}" disabled="true"/>--}%

                        %{--</td>--}%
                    %{--</tr>--}%

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="description"><g:message code="stateModel.description.label"
                                                                default="Description"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: stateModelInstance, field: 'description', 'errors')}">
                            <g:textField name="description" value="${stateModelInstance?.description}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="name"><g:message code="stateModel.name.label" default="Name"/></label>
                        </td>
                        <td valign="top" class="value ${hasErrors(bean: stateModelInstance, field: 'name', 'errors')}">
                            <g:textField name="name" value="${stateModelInstance?.name}"/>
                        </td>
                    </tr>

                    <tr class="prop">
                        <td valign="top" class="name">
                            <label for="states"><g:message code="stateModel.states.label" default="States"/></label>
                        </td>
                        <td valign="top"
                            class="value ${hasErrors(bean: stateModelInstance, field: 'states', 'errors')}">

                            <ul>
                                <g:each in="${stateModelInstance?.states ?}" var="s">
                                    <li><g:link controller="state" action="show"
                                                id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
                                </g:each>
                            </ul>
                            <g:link controller="state" action="create"
                                    params="['stateModel.id': stateModelInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'state.label', default: 'State')])}</g:link>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>
            <div style='display: inline; width: 500px'>
            <g:actionSubmit action="update" class='actionButton' value="Update">Update</g:actionSubmit>
        </g:form>
        <g:form controller="stateModel" style='display: inline' action='edit' params="[delete: true, id: stateModelInstance?.id]">
            <button value='Delete state model' onclick="  confirm('Are you sure you want to delete this State Model?');
            alert('you must define a new stateModel');" id='deleteButton' class="actionButton">
                Delete
            </button>
        </g:form>
        <g:form controller="assetManagement" style='display: inline' action="editAsset" params="[id: stateModelInstance?.asset?.id]"
                value="Cancel"><button value='Cancel' class="actionButton">Cancel</button></g:form>
        <g:form controller="stateModel" style='display: inline' action="copy" value="copy" params="[stateModelId : stateModelInstance?.id]"><button value='Copy'
                                                                                                   class="actionButton">Copy</button></g:form>
    </div>
    </div>
</div>
</body>
</html>
