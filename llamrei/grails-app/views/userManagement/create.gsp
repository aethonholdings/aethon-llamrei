

<html>
<head>
    <meta name="layout" content="main"/>


</head>
<body>
<div class='menuItem'>
    <h2>Create User</h2>
    <div style="margin-left: 20px;font-size: 20px;">
        <div class="body">
            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${userInstance}">
                <div class="errors">
                    <g:renderErrors bean="${userInstance}" as="list"/>
                </div>
            </g:hasErrors>
            <g:form name="save" action="save">
                <div  style="border:1px solid #cccccc">

                    %{--<fieldset style="border: 1px solid gold">--}%
                        %{--<legend>--}%
                            %{--test--}%
                            %{--<table>--}%
                            %{--<tr>--}%
                                %{--<td>aaa</td>--}%
                            %{--</tr>--}%
                            %{--</table>--}%
                        %{--</legend>--}%

                    %{--<table>--}%
                        %{--<tr>--}%
                            %{--<td>aaa</td>--}%
                        %{--</tr>--}%
                    %{--</table>--}%
                    %{--</fieldset>--}%
                    <table  style="border:0px solid gray">
                        <tbody>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="username"><g:message code="user.username.label"
                                                                 default="Username "/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                <g:textField name="username" id="userName" value="${userInstance?.username}" style="width: 300px;height: 30px"/>
                            </td>
                            <td style="width: 300px"><div id="userMsg" style="display: none; color: red"></div></td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="password"><g:message code="user.password.label"
                                                                 default="Password"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                %{--  <g:textField name="password" id="password" value="${userInstance?.password}" style="width: 300px;height: 30px"/>--}%
                                <g:passwordField name="password" id="password" value="${userInstance?.password}" style="width: 300px;height: 30px"/>
                            <td style="width: 300px"><div id="pwdMsg" style="display: none; color: red">Please Enter Password</div></td>
                        </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="email"><g:message code="user.email.label" default="Email"/></label>
                            </td>
                            <td valign="middle" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                <g:textField name="email" id="email" value="${userInstance?.email}" style="width: 300px;height: 30px"/>
                            </td>   <td style="width: 300px"><div id="userEmail" style="display: none; color: red">Please Enter Email</div></td>
                        </tr>

                        %{--<tr class="prop">--}%
                            %{--<td valign="middle" class="name">--}%
                                %{--<label for="email"><g:message code="role.label" default="Role"/></label>--}%
                            %{--</td>--}%
                        %{--</tr>--}%
                          %{--<g:each in="${roles}" status="i" var="roleInstance">--}%
                              %{--<tr>--}%
                            %{--<td><td valign="top" class="name">--}%
                        %{--<label for="r"><g:message code="user.Role.label"--}%
                                                         %{--default="Role"/></label>--}%
                    %{--</td> ${fieldValue(bean: roleInstance, field: "authority")}--}%
                              %{--</td>--}%
                              %{--<td>--}%
                            %{--<g:checkBox name="roleInstance.authority" value="${roleInstance?.authority}"/>--}%
                            %{--</td>--}%
                              %{--</tr>--}%
                          %{--</g:each>--}%
                         %{--<td valign="middle" >--}%
                                %{--<g:select  from="${roles}" name="userRole" optionKey="authority" optionValue="authority" style="width: 300px;height: 30px"  />--}%
                            %{--</td>  </tr>--}%
                        %{--<fieldset>--}%
                            %{--<legend>aaa</legend>--}%
                        %{--<g:each in="${roles}" status="i" var='roleInstance'>--}%

                            %{--<tr >--}%

                   %{--<td>--}%
                      %{--<label> ${fieldValue(bean: roleInstance, field: "authority")} </label>--}%
                            %{--</td>--}%
                                %{--<td>--}%
                                    %{--<g:checkBox name="myCheckbox" value="${roleInstance.id}" checked=""/>--}%
                                 %{--</td>--}%

                            %{--</tr>--}%

                        %{--</g:each>--}%

                        %{--</fieldset>--}%
                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="accountExpired"><g:message code="user.accountExpired.label"
                                                                       default="Account Expired"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: userInstance, field: 'accountExpired', 'errors')}">
                                <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="accountLocked"><g:message code="user.accountLocked.label"
                                                                      default="Account Locked"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: userInstance, field: 'accountLocked', 'errors')}">
                                <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="enabled"><g:message code="user.enabled.label" default="Enabled"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
                                <g:checkBox name="enabled" value="${userInstance?.enabled}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="middle" class="name">
                                <label for="passwordExpired"><g:message code="user.passwordExpired.label"
                                                                        default="Password Expired"/></label>
                            </td>
                            <td valign="middle"
                                class="value ${hasErrors(bean: userInstance, field: 'passwordExpired', 'errors')}">
                                <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                    <fieldset class='roleFieldSet'>
                        <legend>
                         Please Select Roles
                        </legend>
                            <table class='rolesTable'>
                                <tbody>
                            <g:each in="${roles}" status="i" var='roleInstance'>

                                <tr class="prop">

                                    <td valign="middle" class="name">
                                        <label> ${fieldValue(bean: roleInstance, field: "authority")} </label>
                                    </td>
                                    <td valign="middle">
                                        <g:checkBox name="myCheckbox" value="${roleInstance.id}" checked=""/>
                                    </td>

                                </tr>
                            </g:each>
                                </tbody>
                               </table>


                    </fieldset>
                </div>

                <div >
                    <span>
                        %{--        <g:submitButton name="Create" class="save"
                                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
                        <input type="SUBMIT" class="actionButton" value="Create" id="createUser"/>
                    </span>
                    <span class="button">
                        <g:link action="list">
                            <input type="button" class='actionButton' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
                        </g:link>
                    </span>
                </div>
            </g:form>
        </div>

    </div>

</div>

</body>

</html>