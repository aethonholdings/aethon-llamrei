/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 11/19/13
 * Time: 11:59 AM
 * To change this template use File | Settings | File Templates.
 */
var savedAssetID;

$(document).ready(function(){



});

function assetDetail(assetId){

    savedAssetID=assetId
    $("#assetListDiv").hide();
    $("#assetDetailDiv").show();

    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'assetMonitor', action: 'assetMonitorDetail'}),

        data: "assetId=" + assetId+"&nextVal="+true,
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });

            $("#assetName").find("tr").remove();
            $('#assetName').append('<tr><td><b>Asset Name<b></td><td>:</td><td>'+data[0].name+'</td></tr>' +
                '<tr><td><b>Client Name<b></td><td>:</td><td>'+data[0].clientName+'</td></tr>'+
                '<tr><td><b>Location<b></td><td>:</td><td>'+data[0].location+'</td></tr>');

            $("#detailTable").find("tr:gt(0)").remove();

            for(var i=0;i<jsonLengthCount;i++)  {
                $('#detailTable').append('<tr><td>'+data[i].timeSeriesName+'</td><td>'+data[i].value+'</td><td>'+data[i].unit+'</td></tr>');
            }

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });

}

$(document).ajaxStart(function() {

        $('#msgDiv1').show()


});

$(document).ajaxStop(function() {


        $('#msgDiv1').hide()



});

