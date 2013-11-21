<html>
<head>
    <meta name="layout" content="main"/>

</head>
<body>

<div class='menuItem'>
    <h2>Time series management</h2>
    <div style="font-size: 15px;">
        <div class="body">

            <g:if test="${flash.message}">
                <div class="message">${flash.message}</div>
            </g:if>
            <div class="list" style='text-align: center'>
                <table >
                    <thead class='thclass'>
                    <tr>

                        <th>ID</th>
                        <th>Name</th>
                        <th>Units</th>
                        <th>Data Type</th>
                        <th>Description</th>
                        <th></th>



                    </tr>
                    </thead>
                    <tbody class='tdclass'>

                    <g:each in="${timeSeriesInstanceList}" status="i" var="timeSeriesInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}" onclick='window.location = "${createLink(action: "edit", id: timeSeriesInstance.id)}"'   style ="cursor: pointer;">
                            <g:link action="edit" params="[id:timeSeriesInstance.id]">


                                <td>${fieldValue(bean: timeSeriesInstance, field: "timeSeriesUniqueID")}</td>

                                <td>${fieldValue(bean: timeSeriesInstance, field: "name")}</td>

                                <td>${fieldValue(bean: timeSeriesInstance, field: "units")}</td>

                                <td>${fieldValue(bean: timeSeriesInstance, field: "dataType")}</td>

                                <td>${fieldValue(bean: timeSeriesInstance, field: "description")}</td>
                                <td class='buttonCenter'>
                                    <g:link action="edit" params="[id:timeSeriesInstance.id]"><button value='Edit' class="actionButton">Edit</button></g:link>
                                </td>
                            </g:link>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <g:link controller="timeSeriesManagement" action="create"><button value='Create New' class="actionButton" style='float:left; margin-top:5px'>Add +</button></g:link>


        </div>

    </div>
</div>

</body>
</html>