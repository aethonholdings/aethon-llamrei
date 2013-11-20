<div class="table-box">
    <table id="states" cellspacing="0" cellpadding="0">
        <thead>
        <tr class="ui-widget-header">
        <th width="150px"><g:message code="title.state.name"/></th>
        <th width="150px"><g:message code="title.state.description"/></th>
        <th width="150px"><g:message code="title.state.stateRules"/></th>
        </thead>
        <tbody>
        <g:each in="${states}" var="state">
            <tr>
                <g:hiddenField name="states.id" value="${state.id}"/>
                <td>${state.name}</td>
                <td>${state.description}</td>
                <td>${state.stateRules}</td>
            </tr>
        </g:each>
        <tr>
            <td colspan="3">
                <a onclick="openDialog()" class="actionButton">
                    <span><g:message code="button.add.state"/></span>
                </a>
            </td>
        </tr>
        </tbody>
    </table>
</div>

<div id="customer-add-state-dialog" title="${g.message(code: 'button.add.state')}">
    <g:form id="states-form" name="states-form" url="[action: 'saveStates']">
        <g:render template="statesForm"/>
    </g:form>
</div>
<script type="text/javascript">
    i = 0;
    $("#customer-add-state-dialog").dialog({ autoOpen: false,
        height: 380,
        width: 550,
        modal: true, buttons: {
            "${g.message(code:'button.add.state')}": function () {
                alert('here');

//                $('#states-form').submit();
                $.ajax({
                 type: 'POST',
                 url: '${createLink(action: 'saveStates')}',
                 data: $('#customer-add-state-dialog').children('form').serialize(),
                 success: function(data) {
                     alert("data"+data);
                     $('#ageing').replaceWith(data);
                 }
                 });
                alert('here2');

                /*$("#states tbody").
                        prepend("<tr>" +
                                "<input type='hidden' name ='states." + i + ".stateId' value='0'>" +
                                "<td style='background-position: 0 -71px;padding: 3px 0 3px 15px;'>" + userId + "<input type='hidden' name ='states." + i + ".userId' value='"+${session['user_id']}+
                "'></td>" +
                        "<td>" + $.datepicker.formatDate('d-M-yy', new Date()) + "</td>" +
                        "<td>" + stateTitle.val() + "<input type='hidden' name ='states." + i + ".stateTitle' value='" + stateTitle.val() + "'></td>" +
                        "<td>" + stateContent.val() + "<input type='hidden' name ='states." + i + ".stateContent' value='" + stateContent.val() + "'></td>" +
                "</tr>"
                );*/
                i++;
                $(this).dialog("close");
            },
            "${g.message(code:'button.cancel')}": function () {
                $(this).dialog("close");
            }
        }
    });

    function openDialog() {
        $("#stateTitle").val("");
        $("#stateContent").val("");
        $("#customer-add-state-dialog").dialog("open");
    }
</script>
