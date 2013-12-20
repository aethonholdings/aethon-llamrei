function date_time(id,time)
{

//   console.log(time)
    var date = new Date;
//    console.log(date)
    document.getElementById("date_time").innerHTML = "Current Time :"+date;
//    console.log("updating time") ;
    setTimeout('date_time("'+id+'");','1000');
    return true;
}