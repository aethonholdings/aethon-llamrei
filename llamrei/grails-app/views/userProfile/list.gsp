<%--
  Created by IntelliJ IDEA.
  User: aman
  Date: 9/21/12
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page import="llamreiproject.*; llamreiproject.SecRole" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    %{--<style type="text/css">--}%
    %{--table {--}%
        %{--border-collapse: collapse;--}%
        %{--width:100%;--}%
    %{--}--}%

    %{--table, td, th,tr {--}%
        %{--border: 1px solid black;--}%
        %{--min-width: 100px;--}%
    %{--}--}%

    %{--th {--}%
        %{--border: 2px solid black;--}%
        %{--background-color: #ccccff;--}%
        %{--height: 50px;--}%
        %{--width: 40px;--}%
    %{--}--}%
    %{--/*</style>*/--}%
    %{--<link rel='stylesheet' href="${resource(dir:"css",file:"style1.css") }">--}%
</head>
<body>
<div class="subMenuDiv" id="admin"><div id='subMenuDivItem'><g:link controller="userProfile" action="list">Manage Users</g:link></div><div style="margin-left: 10px;width:150px"><g:link>Data service management</g:link></div> <div><g:link controller="asset" action="list" style="margin-left: 10px;width: 200px">Asset manager</g:link></div>  <div style="margin-left: 10px;width: 200px"><g:link controller="timeSeries">TimeSeries Management</g:link></div> </div>


%{-- <div align="center">
    <h2 style="text-transform: uppercase;">Administration</h2>
</div>--}%
<div >
    <div style="width: 100%;background-color: #666666;">
        <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">User's List</h2>
    </div>
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


                            <td>${fieldValue(bean: userInstance, field: "username")}</td>

                            <td>${fieldValue(bean: userInstance, field: "email")}</td>
                            <g:if test="${SecUserSecRole.findBySecUser(userInstance)!=null}" >
                                <td>${SecRole.findById(SecUserSecRole.findBySecUser(userInstance)?.secRole?.id)?.authority}</td>
                            </g:if>
                            <g:else><td>Null</td></g:else>

                            <td><g:formatBoolean boolean="${userInstance.accountExpired}"/></td>

                            <td><g:formatBoolean boolean="${userInstance.accountLocked}"/></td>

                            <td>
                                <g:link action="editUser" params="[id:userInstance.id]"><button value='Edit' class="buttonClass1">Edit</button></g:link>
                            </td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:link controller="userProfile" action="create"><button value='Create New' class="buttonClass1" style='float:left; margin-top:5px'>Add +</button></g:link>


            <div class="paginateButtons">
                <g:paginate total="${UserInstanceTotal}"/>
            </div>

    </div>

    </div>
</div>

</body>
</html>