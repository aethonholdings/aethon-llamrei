/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 11/12/13
 * Time: 12:11 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function(){

})


function showContents(){
//    alert("hi");
//    var testab=0;
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

            $("#main1").find("tr:gt(0)").remove();
            for(var i=1;i<=jsonLengthCount;i++)  {
                if (i % 2) {

                $("#main1").append('<tr class="odd"><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+"--"+'</td><td>'+"Running"+'</td><td onclick=showHumidity("'+data[i].assetId+'")>'+data[i].value1+'</td><td>'+data[i].value+'</td><td><input type="button" class="buttonClass" value="Lock"></td><td><input type="button" class="buttonClass" value="Start"></td><td><input type="button" class="buttonClass" value="Stop"></td></tr>')
                }
                else{
                    $("#main1").append('<tr class="even"><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+"--"+'</td><td>'+"Running"+'</td><td onclick=showHumidity("'+data[i].assetId+'")>'+data[i].value1+'</td><td>'+data[i].value+'</td><td><input type="button" class="buttonClass" value="Lock"></td><td><input type="button" class="buttonClass" value="Start"></td><td><input type="button" class="buttonClass" value="Stop"></td></tr>')
                }
            }

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Error in fetching Data")
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

function showHumidity(data){
//    alert("???=="+data)
    $('#main1').hide();
    $('#main2').hide();
    $('#chartDiv').show();

//    jQuery.ajax
//    ({
//        type:'POST',
//        url:g.createLink({controller: 'dashboard', action: 'chartContents'}),
//
//        data: "assertID=" + data,
//        dataType: "json",
//        success:function(data)
//        {
//            var jsonLengthCount=0;
//            var  ins=data[1].value;
//
//
//            $.each(data, function() {
//                jsonLengthCount++
//            });
//
//            $("#main1").find("tr:gt(0)").remove();
//            for(var i=1;i<=jsonLengthCount;i++)  {
//
//                $("#main1").append('<tr><td style="display: none">aa</td><td>'+data[i].name+'</td><td>'+"--"+'</td><td>'+"Running"+'</td><td onclick=showHumidity("'+data[i].assetId+'")>'+data[i].value1+'</td><td>'+data[i].value+'</td></tr>')
//
//            }
//
//        }
//        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
//        }
//    });
}
