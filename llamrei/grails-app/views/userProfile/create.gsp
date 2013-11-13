<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/21/12
  Time: 5:05 PM
  To change this template use File | Settings | File Templates.
--%>

<html>
<head>
    <meta name="layout" content="main"/>


</head>
<body>

<div>
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">Create User</h2>
    </div>
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
                <div class="dialog">
                    <table>
                        <tbody>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="username"><g:message code="user.username.label"
                                                                 default="Username "/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userInstance, field: 'username', 'errors')}">
                                <g:textField name="username" id="userName" value="${userInstance?.username}" style="width: 300px;height: 30px"/>
                            </td>
                            <td style="width: 300px"><div id="userMsg" style="display: none; color: red"></div></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="password"><g:message code="user.password.label"
                                                                 default="Password"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
                                %{--  <g:textField name="password" id="password" value="${userInstance?.password}" style="width: 300px;height: 30px"/>--}%
                                <g:passwordField name="password" id="password" value="${userInstance?.password}" style="width: 300px;height: 30px"/>
                            <td style="width: 300px"><div id="pwdMsg" style="display: none; color: red">Please Enter Password</div></td>
                        </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="email"><g:message code="user.email.label" default="Email"/></label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean: userInstance, field: 'email', 'errors')}">
                                <g:textField name="email" id="email" value="${userInstance?.email}" style="width: 300px;height: 30px"/>
                            </td>   <td style="width: 300px"><div id="userEmail" style="display: none; color: red">Please Enter Email</div></td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="email"><g:message code="role.label" default="Role"/></label>
                            </td>
                            <td valign="top" >
                                <g:select from="${roles}" name="userRole" optionKey="authority" optionValue="authority" style="width: 300px;height: 30px"/>
                            </td>
                        </tr>


                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="accountExpired"><g:message code="user.accountExpired.label"
                                                                       default="Account Expired"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userInstance, field: 'accountExpired', 'errors')}">
                                <g:checkBox name="accountExpired" value="${userInstance?.accountExpired}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="accountLocked"><g:message code="user.accountLocked.label"
                                                                      default="Account Locked"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userInstance, field: 'accountLocked', 'errors')}">
                                <g:checkBox name="accountLocked" value="${userInstance?.accountLocked}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="enabled"><g:message code="user.enabled.label" default="Enabled"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userInstance, field: 'enabled', 'errors')}">
                                <g:checkBox name="enabled" value="${userInstance?.enabled}"/>
                            </td>
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name">
                                <label for="passwordExpired"><g:message code="user.passwordExpired.label"
                                                                        default="Password Expired"/></label>
                            </td>
                            <td valign="top"
                                class="value ${hasErrors(bean: userInstance, field: 'passwordExpired', 'errors')}">
                                <g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}"/>
                            </td>
                        </tr>

                        </tbody>
                    </table>
                </div>

                <div >
                    <span>
                        %{--        <g:submitButton name="Create" class="save"
                                                                 value="${message(code: 'default.button.create.label', default: 'Create')}"/>--}%
                        <input type="SUBMIT" class="buttonClass" value="Create" id="createUser"/>
                    </span>
                    <span class="button">
                        <g:link action="list">
                            <input type="button" class='buttonClass' value="${message(code: 'default.button.Cancel.label', default: 'Cancel')}">
                        </g:link>
                    </span>
                </div>
            </g:form>
        </div>

    </div>

</div>

</body>

</html>