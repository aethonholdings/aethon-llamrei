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

    Highcharts.setOptions({
        global: {
            useUTC: false
        }
    });

    $('#showPrev').click(function(){

        jQuery.ajax
        ({
            type:'POST',
            url:g.createLink({controller: 'dashboard', action: 'prevChartContents'}),

            data: "assetId=" + assetID+"&timeSeriesId="+ timeSeriesID+"&selectedFromDate="+$('#datePickerFrom').val()+"&selectedToDate="+$('#datePickerTo').val(),
            dataType: "json",
            success:function(data)
            {
                var jsonLengthCount=0;

                $.each(data, function() {
                    jsonLengthCount++
                });
                showHistoryChart(data,jsonLengthCount,timeSeriesID)

            }
            ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
            }
        });
    })

})


function showContents(){

    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'dashboardIndex'}),
        data: "updateDashBoard=" + true,
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;
            var ins=data[1].value;

            $.each(data, function() {
                jsonLengthCount++
            });

            var length=0;
            $("#main1").find("tr:gt(0)").remove();
            for(var i=1;i<=jsonLengthCount;i++)  {

                if (i % 2) {

                    $("#main1").append('<tr class="odd"><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+data[i].connection+'</td><td id="aa'+data[i].assetId+'">'+data[i].stateName+'</td>' +
                        '<td><input type="button" class="actionButton" value="Lock"></td><td><input type="button" class="actionButton" value="Start"></td><td><input type="button" class="actionButton" value="Stop"></td></tr>')

                    appendTimeSeries(data,i)
                }
                else{
                    $("#main1").append('<tr class="even"><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+data[i].connection+'</td><td id="aa'+data[i].assetId+'">'+data[i].stateName+'</td><td><input type="button" class="actionButton" value="Lock"></td><td><input type="button" class="actionButton" value="Start"></td><td><input type="button" class="actionButton" value="Stop"></td></tr>')
                    appendTimeSeries(data,i)
                }
            }
        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });


}

function appendTimeSeries(data,i)
{

    var length=data[i].value.length;

    for(var j=length- 1,k=0;j>=0;j--,k++){

        if(data[i].value[j]=='NA'){
            $("#aa"+data[i].assetId).after('<td>'+data[i].value[j]+'</td>')
        }
        else{
            $("#aa"+data[i].assetId).after('<td class="linkClass" onclick=openChart("'+data[i].uID+'","'+data[i].timeSeriesID[j]+'") >'+data[i].value[j]+'</td>')
        }
    }

}



function openChart(data,timeSeriesId){
//    alert(">>>>>>>>"+timeSeriesId)

    assetID=data
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
    if(timeSeriesId==2){
        label=""
    }
    else{
        label=""
    }
//    var b=Date.parse(data11[0].nodeTimestamp).getTime()

    var chart;

    $('#chartDiv1').highcharts({
        chart: {
            type: 'line',
            animation: Highcharts.svg, // don't animate in old IE
            marginRight: 10,
            events: {
                load: function() {

                    // set up the updating of the chart each second
                    var series = this.series[0];
                    var ab=this.xAxis[0]
//                     alert("<<<"+this.xAxis[0])
                    setInterval(function() {

                        var x ; // current time
//                        alert("hhh")
                        getNextPoint(assetID,timeSeriesID);
//                        alert(statusFlag+"==ch==="+checkFlag)
                        if(statusFlag==true){
//                           alert("pointval=="+pointTime)
//                            categories =
                            debugger;
                            ab.categories.push(pointTime);
//                            ab.categories.push(pointTime);//time is 0:00-23:00
//                            xAxis.setCategories(categories);
                            series.addPoint([ parseFloat(pointValue)],true, true);
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
            tickPixelInterval: 100,
            title:'Date' ,

            categories: (function() {
                var categories = [],
                    i,j;
                for (j=0,i = -19; j < dataLen; i++,j++) {
                    categories.push(data11[j].time);
                }

                return categories;
            })()


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
                    i,j;

                for (j=0,i = -19; j < dataLen; i++,j++) {

                    data.push({
//                        x:data11[j].time,
                        y:parseFloat(data11[j].value)
                    });
                }

                return data;
            })()
        }]
    });
}

function showHistoryChart(data11,jsonLengthCount,timeSeriesId){

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

                        var x ; // current time

                        getNextPoint(assetID,timeSeriesID);


                        if(statusFlag==true){
//                            x = (new Date()).getTime()

                            series.addPoint([pointTime, parseFloat(pointValue)], true, true);
                        }

                    }, 5000);

                }
            }
        },

        title: {
            text: ''
        },
        xAxis: {
//            type: 'datetime',
//            tickPixelInterval: 100
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
//               for (i=0;i<10 ;i++ ){
//                   data.push({
//                        x: time + i * 1000,
//                        y:2
//
//                    });
//               }

                for (j=0,i =1 ; j < 1000; i++,j++) {

                    data.push({
                        x: i ,
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

        data: "assetId=" + data+"&timeSeriesId="+ timeSeriesId,
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });


//            var date = Date.parse(data[0].nodeTimestamp.toString());
//            var c=date-19*1000;
//            var birthday = new Date("1995-12-17T03:24:00");


            showChart(data,jsonLengthCount,timeSeriesId)

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });


}

function getNextPoint(assetID,timeSeriesID){


    var currentPointID;
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


            pointValue=parseFloat(data[0].value)
            pointTime=data[0].time
//            alert("time==="+pointTime)

            statusFlag=true;
//               alert("data=="+data[0].id)
//            if(data11[0].time==data[0].time){
////                alert("innnn")
//                checkFlag=false;
//            }
//            else{
//                checkFlag=true;
//                prevPointID=data[0].id
//            }



        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }

    });


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

$(document).ajaxStart(function() {
    if($('#main1').is(':hidden')) {

    }
    else{
        $('#msgDiv').show()
    }

});

$(document).ajaxStop(function() {

    if($('#main1').is(':hidden')) {

    }
    else{
        $('#msgDiv').hide()
    }


});

