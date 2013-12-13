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
    
    update()
    setInterval(function(){update()}, 5000);

})

function update() {
    
    jQuery.ajax({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'update'}),
        dataType: "json", 
        success: function(responseData) {
            for(var key in responseData) {
                if(document.getElementById(key)!=null) document.getElementById(key).innerHTML=responseData[key];
            }
            timeStamp = new Date(responseData["timeStamp"])
            document.getElementById('clock').innerHTML="Data as of system time: " + timeStamp;
        }, 
        error: function() {
            alert("Error fetching data from server");
        }
    });
}