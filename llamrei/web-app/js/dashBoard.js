/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 11/12/13
 * Time: 12:11 PM
 * To change this template use File | Settings | File Templates.
 */

var dataLen=0;

var singlePointVal=true;

var assetID,timeSeriesID,pointValue;
var statusFlag=false;

$(document).ready(function(){

    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });

})


function showContents(){

    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'showContents1'}),

        data: "loginName=" + "aaa",
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;
            var  ins=data[1].value;


            $.each(data, function() {
                jsonLengthCount++

            });

//            alert("jjj=="+data[])
            $("#main1").find("tr:gt(0)").remove();
            for(var i=1;i<=jsonLengthCount;i++)  {
                assetID=data[i].assetId
                if (i % 2) {

                    $("#main1").append('<tr class="odd"><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+"--"+'</td><td>'+"Running"+'</td><td onclick=openChart("'+data[i].assetId+'",1)>'+data[i].value1+'</td><td onclick=openChart("'+data[i].assetId+'",2)>'+data[i].value+'</td><td><input type="button" class="actionButton" value="Lock"></td><td><input type="button" class="actionButton" value="Start"></td><td><input type="button" class="actionButton" value="Stop"></td></tr>')
                }
                else{
                    $("#main1").append('<tr class="even"><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+"--"+'</td><td>'+"Running"+'</td><td onclick=openChart("'+data[i].assetId+'",1)>'+data[i].value1+'</td><td onclick=openChart("'+data[i].assetId+'",2)>'+data[i].value+'</td><td><input type="button" class="actionButton" value="Lock"></td><td><input type="button" class="actionButton" value="Start"></td><td><input type="button" class="actionButton" value="Stop"></td></tr>')
                }
            }

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });


}

function openChart(data,timeSeriesId,assetName){

    $('#main1').hide();
    $('#main2').hide();
     $('h2').text('');
    $('#chartDiv').show();
//    $("#headingTab").append('<tr><td><b>'+"Asset Name :"+'</b></td><td>'+"ll"+'</td></tr>');

    timeSeriesID=timeSeriesId;
    getDataForChart(data,timeSeriesId);

}

function showChart(data11,jsonLengthCount,timeSeriesId){


    dataLen=jsonLengthCount;

    var label;
    if(timeSeriesId==1){
        label="Humidity"
    }
    else{
        label="Temperature"
    }

    $('#chartDiv1').highcharts({
        chart: {
            type: 'line',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
                load: function() {

                    // set up the updating of the chart each second
                    var series = this.series[0];
                    setInterval(function() {



                        var x = (new Date()).getTime() // current time
//                        alert("in id=="+timeSeriesID)
                        var result=       getNextPoint(assetID,timeSeriesID);

                        if(statusFlag==true){

                        series.addPoint([x, parseFloat(pointValue)], true, true);
                        }

                    }, 5000);

                }
            }
        },
        rangeSelector: {
            buttons: [{
                count: 1,
                type: 'minute',
                text: '1M'
            }, {
                count: 5,
                type: 'minute',
                text: '5M'
            }, {
                type: 'all',
                text: 'All'
            }],
            inputEnabled: false,
            selected: 0
        },
        title: {
            text: ''
        },
        xAxis: {
            type: 'datetime',
            tickPixelInterval: 100
        },
        yAxis: {
            title: {
                text: label
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            formatter: function() {
                return '<b>'+ this.series.name +'</b><br/>'+this.y;
//                            + Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
//                            Highcharts.numberFormat(this.y, 2);
            }
        },
        legend: {
            enabled: false
        },
        exporting: {
            enabled: false
        },
        series: [{
            name: label,
            data: (function() {

                // generate an array of random data
                var data = [],
                    time = (new Date()).getTime(),

                    i,j;

                var test=[10,20,30,40,50,20,70,80];


                for (j=0,i = -19; j < dataLen; i++,j++) {

                    data.push({
                        x: time + i * 1000,
                        y:parseFloat(data11[j])
                    });
                }

                return data;
            })()
        }]
    });
}



function getDataForChart(data,timeSeriesId){


    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'chartContents'}),

        data: "assetId=" + data+"&timeSeriesId="+ timeSeriesId+"&singlePointVal="+singlePointVal,
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });
            showChart(data,jsonLengthCount,timeSeriesId)

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });


}

function getNextPoint(assetID,timeSeriesID){


    var newData;
    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'nextContent'}),

        data: "assetId="+assetID+"&timeSeriesId="+ timeSeriesID,
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });

                  newData=data;

            statusFlag=true;
            pointValue=data
//            showChart(data,jsonLengthCount,timeSeriesId)

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });

    return newData;
}




function getCheckedTimeSeries(){

    var arrayOfId = getSelectedCheckBoxes('series');
    var dataToSend = JSON.stringify(arrayOfId);
    if(arrayOfId.length!=0){
        $("#hiddenField").val(dataToSend);
    }else{

    }
}

//    var arrayOfId = getSelectedCheckBoxes('series');
//
//    var dataToSend = JSON.stringify(arrayOfId);
//   // alert(arrayOfId.length)
//    if(arrayOfId.length!=0){
//        $("#hiddenField").val(dataToSend);
//    }else{
//
//    }
//}

function getSelectedCheckBoxes(s){
    var ids=[];
    $.each($('input[name='+s+']'),
        function () {
            if($(this).is(':checked')){
                ids.push($(this).val()); } });
    return ids;
}
