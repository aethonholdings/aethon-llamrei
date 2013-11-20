/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 11/19/13
 * Time: 11:59 AM
 * To change this template use File | Settings | File Templates.
 */


$(document).ready(function(){



})

function assetDetail(assetId){
 alert("id=="+assetId)

    $("#assetListDiv").hide();
    $("#assetDetailDiv").show();

    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'assetMonitor', action: 'assetDetail'}),

        data: "assetId=" + assetId,
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });
//            showChart(data,jsonLengthCount,timeSeriesId)

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }
    });

}
