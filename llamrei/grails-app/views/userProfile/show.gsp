
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="layout" content="main"/>
    <g:set var="entityName" value="${message(code: 'userProfile.label', default: 'UserProfile')}"/>
    <style type="text/css">
    .mainContent{
       border:2px solid #000000;height: 450px;
    }

    .message{
        font-size: 15px;
        color: blue;
    }
    .name{
        width: 200px;
    }
    .value{
        width: 400px;
       font-size: 15px;
        font-weight: bolder;
        margin-left: 50px
    }
    .buttonRgt{
      float: right;text-transform:none;width:120px;text-align:center;background-color:#f5f5f5;margin-left: 5px;
        font-size: 15px;
        -moz-border-radius: 50px;
        border-radius: 50px;
    }
    </style>
</head>

<body>

 <div class="mainContent">
      <div style="width: 100%;height:50px;background-color: #666666;">
          <h2 style="padding:10px;margin-left:10px;color: #ffffff;font-weight: bold;text-transform: uppercase;">
              <span style="float: left">
                  Profile
              </span>
              <span class="buttonRgt">
                  <g:link action="edit" controller="userProfile" params="[id:userProfileInstance?.id]">
                      Edit Profile
                  </g:link>
              </span>
              <span class="buttonRgt" style="width: 200px">
                  <g:link action="changePwd" controller="userProfile" params="[id:userProfileInstance?.id]">
                      Change Password
                  </g:link>
              </span>
          </h2>
      </div>

      <div style="margin-left: 20px;font-size: 20px;">
          <div class="body">
              <g:if test="${flash.message}">
                  <div class="message">${flash.message}</div>
              </g:if>
              <div class="dialog">
                  <table>
                      <tbody>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.profileName.label"
                                                                   default="Profile Name"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "profileName")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.firstName.label"
                                                                   default="First Name"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "firstName")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.middleName.label"
                                                                   default="Middle Name"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "middleName")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.lastName.label"
                                                                   default="Last Name"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "lastName")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.address.label"
                                                                   default="Address"/></td>

                          <td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "address")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.street.label"
                                                                   default="Street"/></td>

                          <td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "street")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.city.label" default="City"/></td>

                          <td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "city")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.state.label" default="State"/></td>

                          <td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "state")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.postalCode.label"
                                                                   default="Postal Code"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "postalCode")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.country.label"
                                                                   default="Country"/></td>

                          <td valign="top" class="value">${fieldValue(bean: userProfileInstance, field: "country")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.homePhone.label"
                                                                   default="Home Phone"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "homePhone")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.mobilePhone.label"
                                                                   default="Mobile Phone"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "mobilePhone")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.workPhone.label"
                                                                   default="Work Phone"/></td>

                          <td valign="top"
                              class="value">${fieldValue(bean: userProfileInstance, field: "workPhone")}</td>

                      </tr>

                      <tr class="prop">
                          <td valign="top" class="name"><g:message code="userProfile.lastUpdated.label"
                                                                   default="Last Updated"/></td>

                          <td valign="top" class="value"><g:formatDate date="${userProfileInstance?.lastUpdated}"  /></td>

                      </tr>

                      </tbody>
                  </table>
              </div>

              %{--<div class="buttons">
                  <g:form>
                      <g:hiddenField name="id" value="${userProfileInstance?.id}"/>
                      <span class="button"><g:actionSubmit class="edit" action="edit"
                                                           value="${message(code: 'default.button.edit.label', default: 'Edit')}"/></span>
                      <span class="button"><g:actionSubmit class="edit" action="show"
                                                           value="${message(code: 'default.button.cancel.label', default: 'Cancel')}"/></span>
                      --}%%{--<span class="button"><g:actionSubmit class="delete" action="delete"
                                                           value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                                           onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/></span>--}%%{--
                  </g:form>
              </div>--}%
          </div>
      </div>

  </div>


</body>
</html>
