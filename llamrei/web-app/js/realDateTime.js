function date_time(id)
{


    var date = new Date;
    document.getElementById("date_time").innerHTML = "Current Time :"+date;
//    console.log("updating time") ;
    setTimeout('date_time("'+id+'");','1000');
    return true;
}