<div style="display: none" id="chartDiv">

    %{--<table>--}%
    %{--<tr>--}%
    %{--<td>Hiiiiiiiiiiiiiiiiii</td>--}%
    %{--</tr>--}%
    %{--</table>--}%
    <div id="chartDiv1" style="width: 100%;float: left;"> </div>


    <table id="headingTab" style="border: none;margin-left: 30px;margin-top: 10px;width:11%"></table>
    %{--<div id="chartDiv1" style="width: 100%;height:50%;float: left;margin-left: 110px;margin-top: 20px;">--}%
    <label>From : </label> <input id="datePickerFrom" type="text" readonly="true">
    <label> To : </label><input id="datePickerTo" type="text" readonly="true"> <input type="button" id="showPrev" value="Show"> <input type="button" id="showPrev" value="ShowCurrent" onclick=openChart(assetID,timeSeriesID)>

    %{--</div>--}%
</div>