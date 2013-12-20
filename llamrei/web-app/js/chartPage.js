
var dataLen= 0,counter= 0,value=0;
var assetID,timeSeriesID,pointValue,prevPointID=0;
var statusFlag=false,checkFlag=false;
function openChart(assetId,timeSeriesId){
   assetID=assetId
    $('#main1').hide();
    $('#main2').hide();
    $('h2').text('');
    $('#chartDiv').show();
//    $("#headingTab").append('<tr><td><b>'+"Asset Name :"+'</b></td><td>'+"ll"+'</td></tr>');

    timeSeriesID=timeSeriesId;
    getDataForChart(assetId,timeSeriesId);

}




function getDataForChart(assetId,timeSeriesId){

    jQuery.ajax
    ({

        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'chartContents'}),

        data: "assetId=" + assetId+"&timeSeriesId="+ timeSeriesId,
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


function showChart(data,jsonLengthCount,timeSeriesId){


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
            marginRight: 10  ,
            events: {
                load: function() {

                    // set up the updating of the chart each second
                    var series = this.series[0];
                    var xAxisSeries=this.xAxis[0]
                    setInterval(function() {

                        var x ; // current time

                        getNextPoint(assetID,timeSeriesID);


                        if(statusFlag==true){
                            xAxisSeries.categories.push(pointTime);
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
            title:'Date',

            categories: (function() {

                var categories = [],
                    i,j;
                for (j=0,i = -19; j < dataLen; i++,j++) {
                    categories.push(data[j].time);
                }

                return categories;
            })()


        },
        yAxis: {
            title: {
                text: data[0].name
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
                var data1 = [],
                    i,j;

                for (j=0,i = -19; j < dataLen; i++,j++) {

                    data1.push({
                        y:parseFloat(data[j].value)
//                        y:j
                    });
                }

                return data1;
            })()
        }]
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

            statusFlag=true;



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

