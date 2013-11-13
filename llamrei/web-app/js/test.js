/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 10/23/13
 * Time: 3:53 PM
 * To change this template use File | Settings | File Templates.
 */

$(document).ready(function(){

//    fuelMeter();
//    meter1();
//    thermo();

//        $('.container').each(function(e){
//            if(e == 0){
//                $(this).addClass('current');
//            }
//            $(this).attr('id', 'handle' + e);
//        })


//    $('.tabs li').each(function(e){
//        if(e == 0){
//            $(this).addClass('current');
//        }
//        $(this).wrapInner('<a class="title"></a>');
//        $(this).append('<a><img /></a>');
//        $(this).children('a').attr('href', '#handle' + e);
//        y = $('#handle' + e + ' img').attr('src');
//        $(this).find('img').attr('src', y);
//        t = $(this).children('a').text();
//        $('#handle' + e).append('<h2>' + t + '</h2>');
//
//    })


//    $('.tabs li a').click(function(){
//        c = $(this).attr('href');
//        if($(c).hasClass('current')){
//            return false;
//        }else{
//            showImage($(c), 20);
//            $('.tabs li').removeClass('current');
//            $(this).parent().addClass('current');
//            return false;
//        }
//    })

    runRotateImages();
    $("#featured").hover(
        function(){
            clearTimeout(xx);
        },
        function(){
            runRotateImages();
        }
    )
})


function showImage(img, duration){
    $('.container').removeClass('current').css({
        "opacity" : 0.0,
        "zIndex" : 2
    });
    img.animate({opacity:1.0}, duration, function(){
        $(this).addClass('current').css({zIndex:1});
    });
}

function rotateImages(){
    var curPhoto = $("div.current");
    var nxtPhoto = curPhoto.next();
    var curTab = $(".tabs li.current");
    var nxtTab = curTab.next();

    if (nxtPhoto.length == 0) {
        nxtPhoto = $('#featured div:first');
        nxtTab = $('.tabs li:first-child');
    }

    curTab.removeClass('current');
    nxtTab.addClass('current');
    showImage(nxtPhoto, 300);

}
function runRotateImages(){
    xx = setInterval("rotateImages()", 4000);
}
function fuelMeter(){

    var fuel = new RGraph.Fuel('cvs', 0, 100, 6)
        .Draw();

}

function meter1(){
    var meter = new RGraph.Meter('cvs1', 0,100,86) ;
    meter.Set('border', false);
    meter.Set('tickmarks.small.num', 0);
    meter.Set('tickmarks.big.num', 0);
//    meter  .Set('angles.start', HALFPI + (HALFPI / 1.5));
//    meter.Set('angles.end', TWOPI +HALFPI - (HALFPI / 1.5)) ;
    meter.Set('segment.radius.start', 140) ;
    meter.Set('text.size', 16);
    meter.Set('colors.ranges', [
            [0,40,'Gradient(#0c0:#cfc:#0c0)'],
            [40,80,'Gradient(yellow:#ffc:yellow)'],
            [80,100,'Gradient(red:#fcc:red)']
        ]);
    meter.Set('needle.radius', 110);
    meter .Set('gutter.bottom', 135);
    meter .Draw();


}


function thermo(){
    RGraph.CSV('/sample.csv', function (csv)
    {
        // Just fetch the first row of the CSV file
        var row = csv.getRow(0);

        var thermometer = new RGraph.Thermometer('cvs2', 0,50,row[1]) ;
        thermometer.Set('value.label.decimals', 1);
        thermometer.Set('units.post', '%');
        thermometer .Set('scale.visible', true);
        thermometer .Set('gutter.right', 35);
        thermometer.Draw();
    })
}



