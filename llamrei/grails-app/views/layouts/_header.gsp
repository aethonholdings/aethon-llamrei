<div>
<div class="header">
    <div class="logo" ></div>

<div class="spanClass"> Welcome ADMIN |<g:link controller="user" action="create">Manage Users</g:link>| <g:link controller="logout" action="index">Logout</g:link>
    </div>



</div>

    <div>
        <header>
            %{--<div id="logo">--}%
            %{--<div id="logo_text">--}%
            %{--<!-- class="logo_colour", allows you to change the colour of the text -->--}%
            %{--<h1><a href="index.html">CSS3<span class="logo_colour">_seascape_two</span></a></h1>--}%
            %{--<h2>Simple. Contemporary. Website Template.</h2>--}%
            %{--</div>--}%
            %{--</div>--}%
            <nav>
                <ul class="sf-menu" id="nav">

                    <li style="width: 20px">&nbsp;</li>
                    <li><a href="#">DashBoard</a>
                        <ul>
                            <li><a href="#" id="summary">Summary</a></li>
                            <li><a href="#">Fuel</a></li>
                            <li><a href="#">Power</a></li>
                            %{--<li><a href="#">Assets</a></li>--}%
                            <li><g:link controller="assets" action="assetIndex"> Assets</g:link></li>
                        </ul>
                    </li>
                    %{--<li><a href="#">Assets</a>--}%
                    %{--<ul>--}%
                    %{--<li><a href="#">Add</a></li>--}%
                    %{--<li><a href="#">Remove</a></li>--}%
                    %{--<li><a href="#">Copy</a></li>--}%
                    %{--</ul>--}%
                    %{--</li>--}%
                    <li><a href="#">Finance</a>
                        <ul>
                            <li><a href="#">Cash</a></li>
                            <li><a href="#">Credit</a></li>
                            %{--<li><a href="#">Copy</a></li>--}%
                        </ul>
                    </li>
                    <li><a href="#">Admin</a>
                        <ul>
                            <li><a href="#">Users</a></li>
                            <li><a href="#">Assets</a></li>
                            <li><a href="#">Services</a></li>
                        </ul>
                    </li>
                    %{--<li><a href="#">Series</a></li>--}%
                    %{--<li><a href="#">Contact Us</a></li>--}%

                </ul>
            </nav>
        </header>
    </div>
</div>