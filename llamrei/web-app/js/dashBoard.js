/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 11/12/13
 * Time: 12:11 PM
 * To change this template use File | Settings | File Templates.
 */

var dataLen= 0,counter= 0,value=0;
var assetID,timeSeriesID,pointValue,prevPointID=0;
var statusFlag=false,checkFlag=false;

$(document).ready(function(){
    var now=new Date(2013, 12, 13, 13, 48, 0, 0);
    document.getElementById('clock').innerHTML="System time: " + now;       // refresh the clock
    update(now);
})

function startDashboard(now) {
    
    
    now = new Date(now.getTime() + 1000);
    t=setTimeout(function(){startDashboard(now)},1000);
}

function update(now) {
    
    getDataPoints();

}

function getDataPoints() {
    
    jQuery.ajax({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'update'}),
        // dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });
        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Error in fetching Data")
        }
    });
    
}
