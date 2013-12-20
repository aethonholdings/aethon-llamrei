/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 11/12/13
 * Time: 12:11 PM
 * To change this template use File | Settings | File Templates.
 */

var browserReferenceTime;
var startServerTime;
var clockTick = 5000;
var serverTime=4;

$(document).ready(function(){
    update();
    setInterval(function() {update()}, clockTick);
})

function update() {
//          console.log('hi')
//    document.getElementById('msgDiv').display='visible';
    jQuery.ajax({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'update'}),
        dataType: "json", 
        success: function(responseData) {

            for(var key in responseData) {

                if(document.getElementById(key)!=null)
                 document.getElementById(key).innerHTML=responseData[key];
               }
            for(var nodeTimestamp in responseData){

                if(document.getElementById(nodeTimestamp)!=null)
                    document.getElementById(nodeTimestamp).innerHTML=responseData[nodeTimestamp];
            }
//            console.log("server time is"+responseData['timeStamp'])
            timeStamp = new Date(responseData["timeStamp"])
//            console.log(timeStamp)
            document.getElementById('serverTimestamp').innerHTML="Data as of system time: " + timeStamp;
            var currentTime = document.getElementById("date_time")
//            console.log("hitting again"+ responseData['timeStamp'].dataType) ;
            serverTime=  responseData['timeStamp']



            return(timeStamp);
        }, 
        error: function() {
//            alert("Error fetching data from server");
        }
    });
//    document.getElementById('msgDiv').display='hidden';
}

