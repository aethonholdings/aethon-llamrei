<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/20/13
  Time: 5:21 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />
  <title>AssetDetail</title>
    <script type="text/javascript">

        $(document).ready(function(){

            setInterval(function () {

               assetDetail(${assetId});

            }, 20000);
        });


        $(function() {
            $( "#tabs" ).tabs();
        });

        $(function() {
            $( "#tabs1" ).tabs();
        });



    </script>
</head>
<body>

<div class='menuItem' style="float: left; width:100%;" id="assetDetailDiv">

    %{--<h2> Assets home page</h2>--}%
    <div class="rightDiv" style="width: 20%">

        <div>

            <table style="margin-top: 5px;border: none" id="assetName">
                <tr>
                    <td><b>Asset Name</b></td><td>:</td><td>${name}</td>    </tr>
                <tr>  <td><b>Client Name</b></td><td>:</td><td>${clientName}</td>  </tr>
                <tr> <td><b>Location</b></td><td>:</td><td>${location}</td>
                </tr>
            </table>
        </div>
        <div class="imgDiv" style="width: 40%">
            <img class=imageThumbnail src=${imageUrl}>
        </div>
        <div style="margin-top: 80px">

            <div style="margin-top: 10px;margin-left: 10px">
                <input type="button" value="Lock" class="actionButton">
            </div>
            <div style="margin-top: 10px;margin-left: 10px">
                <input type="button" value="Start" class="actionButton">
            </div>
            <div style="margin-top: 10px;margin-left: 10px">
                <input type="button" value="Stop" class="actionButton">
            </div>

        </div>
    </div>



    <div class="leftDiv" style='width:70%' >
        <div id="tabs">
            <ul>
                <li><a href="#tabs-1">Operating Data</a></li>
                <li><a href="#tabs-2">Maintenance</a></li>
                <li><a href="#tabs-3">Alerts</a></li>
            </ul>
            <div id="tabs-1">
                %{--<input type="button" value="Add" class="buttonClass">  <input type="button" value="Remove" class="buttonClass">--}%
                <div style="margin-top: 10px">
                    <table id="detailTable">
                        <thead class='thclass'>

                        <tr>
                            <th>&nbsp;</th>
                            <th>Value</th>
                            <th >Unit</th>
                            %{--<th class="thclass">Max</th>--}%
                            %{--<th class="thclass">Min</th>--}%
                        </tr>
                        </thead>
                        <tbody class='tdclass'>
                        <g:each in="${contentMap}" status="i" var="content">
                        <tr>
                        <td>${content.value.timeSeriesName}</td>
                        <td>${content.value.value}</td>
                        <td>${content.value.unit}</td>

                        </tr>
                        </g:each>
                        <tbody class='tdclass'>
                    </table>
                </div>
            </div>
            <div id="tabs-2">
                %{--<input type="SUBMIT" value="Add" class="buttonClass">  <input type="button" value="Remove" class="buttonClass" >--}%
                <div style="margin-top: 10px">
                    <table>

                        <tr>
                            <th class="thclass">&nbsp;</th>
                            <th class="thclass">Start</th>
                            <th class="thclass">End</th>
                            <th class="thclass">Description</th></tr>

                        <tr>
                            <td class="tdclass"> <input type="checkbox" /></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div id="tabs-3">
                <div style="margin-top: 10px">
                    <table>

                        <tr>
                            <th class="thclass">Date Time</th>
                            <th class="thclass">Event</th>
                            <th class="thclass">Details</th>


                        <tr>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                         </tr>
                        <tr>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                        </tr>
                        <tr>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                            <td class="tdclass"></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>


        %{--<ul class="tabs">--}%
        %{--<li>--}%
        %{--<input type="radio" checked name="tabs" id="tab1" style="display: none">--}%
        %{--<label for="tab1">Operating Data</label>--}%
        %{--<div id="tab-content1" class="tab-content animated fadeIn1">--}%
        %{--<input type="button" value="Add">  <input type="button" value="Remove">--}%
        %{--</div>--}%
        %{--</li>--}%
        %{--<li>--}%
        %{--<input type="radio" name="tabs" id="tab2" style="display: none">--}%
        %{--<label for="tab2">Maintenance</label>--}%
        %{--<div id="tab-content2" class="tab-content animated fadeIn">--}%
        %{--"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?--}%
        %{--</div>--}%
        %{--</li>--}%
        %{--<li>--}%
        %{--<input type="radio" name="tabs" id="tab3" style="display: none">--}%
        %{--<label for="tab3">P+L</label>--}%
        %{--<div id="tab-content3" class="tab-content animated fadeIn">--}%
        %{--"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical exercise, except to obtain some advantage from it? But who has any right to find fault with a man who chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no resultant pleasure?"--}%
        %{--</div>--}%
        %{--</li>--}%
        %{--</ul>--}%
    </div>
</div>

</body>
</html>