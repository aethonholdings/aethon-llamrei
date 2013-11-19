<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 11/7/13
  Time: 1:14 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main" />

    <title>DashBoard</title>



    <script type="text/javascript">
        $(document).ready(function(){
            showContents();
            setInterval(function () {
                showContents();
            }, 20000);
        });




    </script>
</head>
<body>
<div class="dboardDiv">
    <g:render template="chartPage" />
</div>
<h2>Dashboard</h2>
    <table id="main1" >
        <thead class='thclass'>
        <tr>
            <th>Asset Name</th>
            <th>Connection</th>
            <th>State</th>
            <th>Humidity</th>
            <th>Temperature</th>
            <th></th>
            <th></th>
            <th></th>
        </tr>
        </thead>

        <tbody class='tdclass'>

        </tbody>
    </table>
%{--</div>--}%

</body>
</html>