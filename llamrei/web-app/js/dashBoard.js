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

    jQuery.ajax
    ({
        type:'POST',
        url:g.createLink({controller: 'dashboard', action: 'showContents1'}),

        data: "loginName=" + "aaa",
        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;
            $.each(data, function() {
                jsonLengthCount++
            });

//            $("#main1 tr").remove();
//            $('#main1').children( 'tr:not(:first)' ).remove();
            $("#main1").find("tr:gt(0)").remove();
            for(var i=1;i<=jsonLengthCount;i++)  {
            $("#main1").append('<tr><td>'+data[i].name+'</td><td>'+"--"+'</td><td>'+"Running"+'</td><td>'+data[i].value+'</td><td>'+data[i].value+'</td></tr>')
            }

        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
            alert("Error in fetching Data")
        }
    });



}
