<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/21/12
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="com.llamrei.domain.*" contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>

%{-- <div align="center">
    <h2 style="text-transform: uppercase;">Administration</h2>
</div>--}%
<div class='menuItem'>
    <h2>User List</h2>
    <div style="font-size: 15px;">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list" style='text-align: center'>
                <table >
                    <thead class='thclass'>
                    <tr>

                        <th>Username</th>
                        <th>email</th>
                        <th>Role</th>
                        <th>Account Expired</th>
                        <th>Account Locked</th>

                        <th></th>
                        %{--<th></th>--}%

                    </tr>
                    </thead>
                    <tbody class='tdclass'>
                    <g:each in="${SecUserInstanceList}" status="i" var="userInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td> ${fieldValue(bean: userInstance, field: "username")}</td>

                            <td>${fieldValue(bean: userInstance, field: "email")}</td>
                            <g:if test="${SecUserSecRole.findBySecUser(userInstance)!=null}" >
                                <td>${SecRole.findById(SecUserSecRole.findBySecUser(userInstance)?.secRole?.id)?.authority}</td>
                            </g:if>
                            <g:else><td>Null</td></g:else>

                            <td><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>

                            <td><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>

                            <td style="text-align:center;">
                                <g:link action="editUser" params="[id:userInstance.id]"><button value='Edit' class="actionButton">Edit</button></g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:link controller="userManagement" action="create"><button value='Create New' class="actionButton" style='float:left; margin-top:5px'>Add +</button></g:link>


            <div class="paginateButtons">
                <g:paginate total="${UserInstanceTotal}"/>
            </div>

        </div>

    </div>
</div>

</body>
</html>