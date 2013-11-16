%{--<div class="subMenuDiv" id="dash">--}%
    %{--<div style="margin-left: 29px;"><g:link controller="dashboard" action="dashboardIndex"> Dashboard</g:link></div>--}%
    %{--<div><g:link controller="assets" action="assetIndex" class="linkClass">Asset Monitor</g:link></div>--}%
    %{--<div><g:link controller="#" action="#">Fuel Monitor</g:link></div> </div>--}%


<nav>
    <ul class='sf-menu' id='nav'>
        <li>
            <g:link controller="dashboard" action="dashboardIndex" style="color:white;text-shadow:none"> Dashboard</g:link>

        </li>
        %{--<div style="margin-left: 10px;width:150px"><g:link controller="userProfile" action="data">Dataaa service management</g:link>--}%
        %{--</div>--}%
        <li>
        <g:link controller="dashboard" action="dashboardIndex" class="linkClass" style="color:white;text-shadow:none">Asset Monitor</g:link>

        </li>
        <li>
            <g:link controller="#" action="#" style="color:white;text-shadow:none">Fuel Monitor</g:link>

        </li>
    </ul>
</nav>