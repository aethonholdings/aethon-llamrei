function date_time(id)
{
   var date = new Date;
    console.log(date)
    document.getElementById(id).innerHTML = "Current Time :"+date;
    setTimeout('date_time("'+id+'");','1000');
    return true;
}