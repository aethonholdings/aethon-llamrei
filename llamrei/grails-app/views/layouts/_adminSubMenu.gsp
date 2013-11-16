%{--<div class="subMenuDiv" id="adminSubMenu" style='text-align: left'>--}%
<div style="background: gray">
 <nav >
 <ul class='sf-menu' id='nav'>
     <li>
    <g:link controller="userProfile" action="list" style="color:white;text-shadow:none">Manage Users</g:link>

         </li>
    %{--<div style="margin-left: 10px;width:150px"><g:link controller="userProfile" action="data">Dataaa service management</g:link>--}%
    %{--</div>--}%
     <li>
    <g:link controller="asset" action="list" style="color:white;text-shadow:none">Asset manager</g:link>

     </li>
       <li>
    <g:link controller="timeSeries" style="color:white;text-shadow:none">Time Series Management</g:link>

           </li>
     </ul>
     </nav>
</div>
%{--</div>--}%
