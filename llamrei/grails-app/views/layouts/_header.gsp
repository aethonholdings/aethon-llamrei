

<div class="header">
    <div class="headerBlock">
        <div class="logo"></div>
        <div class="sessionManagement">
            Welcome 
            <sec:loggedInUserInfo field="username"/> |
            <g:link controller="logout" action="index">Logout</g:link>
        </div>
    </div>

    <div class="headerMenu">
        <ul class="roleMenu">
            <sec:ifAnyGranted roles="ROLE_OPERATOR">
                <li class="roleMenu"><a href='#' class='roleMenu' onmouseover='activate("operatorServiceMenu")'>Operations</a>
                    <ul class="serviceMenu" id="operatorServiceMenu">
                        <li class="serviceMenu"><g:link controller="dashboard" action="dashboardIndex" class="serviceMenu">Dashboard</g:link></li>
                        <li class="serviceMenu"><g:link controller="assetMonitor" action="assetMonitorList" class="serviceMenu">Asset monitor</g:link></li>
                    </ul>            
                </li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_ENGINEER">
                <li class="roleMenu"><a href='#' class='roleMenu' onmouseover='activate("")'>Engineering</a></li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_FINANCE">
                <li class="roleMenu"><a href='#' class='roleMenu' onmouseover='activate("")'>Finance</a></li>
            </sec:ifAnyGranted>
            <sec:ifAnyGranted roles="ROLE_ADMIN">
                <li class="roleMenu"><a href='#' class='roleMenu' onmouseover='activate("adminServiceMenu")'>Admin</a>
                    <ul class="serviceMenu" id="adminServiceMenu">
                        <li class="serviceMenu"><g:link controller="userManagement" action="list" class="serviceMenu">Manage users</g:link></li>
                        <li class="serviceMenu"><g:link controller="assetManagement" action="listAssets" class="serviceMenu">Manage assets</g:link></li>
                        <li class="serviceMenu"><g:link controller="timeSeriesManagement" class="serviceMenu">Manage time series</g:link></li>
                    </ul>
                </li>
            </sec:ifAnyGranted>
        </ul> 
    </div>
 
    <div class="headerMenu">
        <div class="serviceMenu">
        </div>
    </div>
 
    <div class="headerMenu"></div>
</div>
    