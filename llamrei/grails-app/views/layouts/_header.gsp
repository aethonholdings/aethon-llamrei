<div>

    <div class="header">
        <div class="logo" ></div>

        <div class="spanClass"> Welcome ADMIN |<g:link controller="user" action="create">Manage Users</g:link>| <g:link controller="logout" action="index">Logout</g:link>
        </div>



    </div>

    <div>
        <header>

            <nav>
                <sec:ifAnyGranted roles="ROLE_OPERATOR">
                    <ul class="sf-menu" id="nav">
                        <li style="width: 20px">&nbsp;</li>
                        <li><g:link controller="dashboard" action="dashboardIndex">Operations</g:link>
                        </li>

                    </ul>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_FINANCE">
                    <ul class="sf-menu" id="nav">
                        <li style="width: 20px">&nbsp;</li>
                        <li><a href="#">Finance</a> </li>
                    </ul>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ENGINEER">
                    <ul class="sf-menu" id="nav">
                        <li style="width: 20px">&nbsp;</li>
                        <li><a href="#">Engineering</a> </li>
                    </ul>
                </sec:ifAnyGranted>
                <sec:ifAnyGranted roles="ROLE_ADMIN">
                    <ul class="sf-menu" id="nav">
                        <li style="width: 20px">&nbsp;</li>
                        <li><g:link controller="admin" action="index">Admin</g:link> </li>
                    </ul>
                </sec:ifAnyGranted>
            </nav>
            %{--<sec:ifAnyGranted roles="ROLE_OPERATOR" >--}%
                %{--<div class="subMenuDiv" id="dash"><div style="margin-left: 60px"><g:link controller="dashboard" action="dashboardIndex"> DashBoard</g:link></div> <div><g:link controller="assets" action="assetIndex" class="linkClass">Asset Monitor</g:link></div><div><g:link controller="fuelMonitor" action="fuelMonitorIndex">Fuel Monitor</g:link></div> </div>--}%
            %{--</sec:ifAnyGranted>--}%
            %{--<sec:ifAnyGranted roles="ROLE_FINANCE">--}%
                %{--<div class="subMenuDiv"><div style="margin-left: 60px">Credit</div> <div>Debit</div> </div>--}%
            %{--</sec:ifAnyGranted>--}%
            %{--<sec:ifAllGranted roles="ROLE_ENGINEER">--}%
                %{--<div class="subMenuDiv"><div style="margin-left: 60px">Credit</div> <div>Debit</div> </div>--}%
            %{--</sec:ifAllGranted>--}%
        %{--<sec:ifAllGranted roles="ROLE_ADMIN">--}%
            %{--<sec:ifAnyGranted roles="ROLE_ADMIN">--}%
                %{--<div class="subMenuDiv" id="admin"><div style="margin-left: 60px">Credit</div> <div>Debit</div> </div>--}%
            %{--</sec:ifAnyGranted>--}%
        </header>
    </div>
</div>