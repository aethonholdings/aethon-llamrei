<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 10/30/13
  Time: 12:44 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>main</title>
    <jq:resources/>
    <jqui:resources/>
    <g:javascript library="jquery"/>
    <g:javascript library="application"/>
    <g:javascript library="jquery" plugin="jquery"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'reset.css')}"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'layout.css')}"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'ie.css')}"/>
    <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style2.css')}"/>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'cufon-replace.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'cufon-yui.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'FF-cash.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'tms-0.3.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'tms_presets.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'jquery.easing.1.3.js')}"></script>
    <script type="text/javascript" src="${resource(dir: 'js/style2', file: 'jquery-1.6.min.js')}"></script>
</head>
<body id="page1">
<!-- header -->

<div class="bg">
<div class="main">
<header>
    <div class="row-1">

        %{--<form id="search-form" action="" method="post" enctype="multipart/form-data">--}%
            %{--<fieldset>--}%
                %{--<div class="search-form">--}%
                    %{--<input type="text" name="search" value="Type Keyword Here" onBlur="if(this.value=='') this.value='Type Keyword Here'" onFocus="if(this.value =='Type Keyword Here' ) this.value=''" />--}%
                    %{--<a href="#" onClick="document.getElementById('search-form').submit()">Search</a>--}%
                %{--</div>--}%
            %{--</fieldset>--}%
        %{--</form>--}%
    </div>
    <div class="row-2">
        <nav>
            <ul class="menu">
                %{--<li><a class="active" href="#" onclick="home()" id="home">Home</a></li>--}%
                <li><a href="#" class="active" onclick="dashBoard()" id="dashBoard">DashBoard</a></li>
                <li><a href="#" onclick="assets()" id="assets">Assets</a></li>
                <li><a href="#" onclick="finance()" id="finance">Finance</a></li>
                <li><a href="#" onclick="users()" id="users">Users</a></li>
                <li><a href="#" onclick="series()" id="series">Series</a></li>
                <li class="last-item" onclick="contact()" id="contact"><a href="#">Contact Us</a></li>
            </ul>
        </nav>
    </div>
    <div class="row-3">
        <div class="slider-wrapper">
            <div class="slider">
                <g:render template="dashBoard"></g:render>
                %{--<ul class="items">--}%
                    %{--<li><img src="images/slider-img1.jpg" alt="">--}%
                        %{--<strong class="banner">--}%
                            %{--<strong class="b1">our solidity</strong>--}%
                            %{--<strong class="b2">is equity</strong>--}%
                            %{--<strong class="b3">Innovation and flexibility, quick and<br> high results - oriented work</strong>--}%
                        %{--</strong>--}%
                    %{--</li>--}%
                    %{--<li><img src="images/slider-img2.jpg" alt="">--}%
                        %{--<strong class="banner">--}%
                            %{--<strong class="b1">our aim is</strong>--}%
                            %{--<strong class="b2">Dedicated</strong>--}%
                            %{--<strong class="b3">To conducting business affairs using<br>the highest standards</strong>--}%
                        %{--</strong>--}%
                    %{--</li>--}%
                    %{--<li><img src="images/slider-img3.jpg" alt="">--}%
                        %{--<strong class="banner">--}%
                            %{--<strong class="b1">encourage</strong>--}%
                            %{--<strong class="b2">Business</strong>--}%
                            %{--<strong class="b3">Success and growth with our<br>professionals of this sphere</strong>--}%
                        %{--</strong>--}%
                    %{--</li>--}%
                %{--</ul>--}%
                %{--<a class="prev" href="#">prev</a>--}%
                %{--<a class="next" href="#">prev</a>--}%
            </div>
        </div>
    </div>
</header>
<!-- content --><div class="ic">More Website Templates  at TemplateMonster.com!</div>
%{--<section id="content">--}%
    %{--<div class="padding">--}%
        %{--<div class="box-bg margin-bot">--}%
            %{--<div class="wrapper">--}%
                %{--<div class="col-1">--}%
                    %{--<div class="box first">--}%
                        %{--<div class="pad">--}%
                            %{--<div class="wrapper indent-bot">--}%
                                %{--<strong class="numb img-indent2">01</strong>--}%
                                %{--<div class="extra-wrap">--}%
                                    %{--<h3 class="color-1"><strong>Careful</strong>Analysis</h3>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<div class="wrapper">--}%
                                %{--<a class="button img-indent-r" href="#">>></a>--}%
                                %{--<div class="extra-wrap">--}%
                                    %{--Point.co is one of <a class="link" target="_blank" href="http://blog.templatemonster.com/free-website-templates/ ">free website templates</a> created by TemplateMonster.com.--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%
                %{--<div class="col-1">--}%
                    %{--<div class="box second">--}%
                        %{--<div class="pad">--}%
                            %{--<div class="wrapper indent-bot">--}%
                                %{--<strong class="numb img-indent2">02</strong>--}%
                                %{--<div class="extra-wrap">--}%
                                    %{--<h3 class="color-2"><strong>Quick</strong>Research</h3>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<div class="wrapper">--}%
                                %{--<a class="button img-indent-r" href="#"></a>--}%
                                %{--<div class="extra-wrap">--}%
                                    %{--This <a class="link" target="_blank" href="http://blog.templatemonster.com/2011/06/13/free-website-template-jquery-slider/ ">Template</a> goes with two packages – with PSD files and without them.--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%
                %{--<div class="col-2">--}%
                    %{--<div class="box third">--}%
                        %{--<div class="pad">--}%
                            %{--<div class="wrapper indent-bot">--}%
                                %{--<strong class="numb img-indent2">03</strong>--}%
                                %{--<div class="extra-wrap">--}%
                                    %{--<h3 class="color-3"><strong>New</strong>Strategies</h3>--}%
                                %{--</div>--}%
                            %{--</div>--}%
                            %{--<div class="wrapper">--}%
                                %{--<a class="button img-indent-r" href="#">>></a>--}%
                                %{--<div class="extra-wrap">--}%
                                    %{--It has several pages: <a class="link" href="index.html">Home</a>, <a class="link" href="news.html">News</a>, <a class="link" href="services.html">Services</a>, <a class="link" href="products.html">Products</a>, <a class="link" href="contacts.html">Contacts</a>.--}%
                                %{--</div>--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
        %{--<div class="wrapper">--}%
            %{--<div class="col-3">--}%
                %{--<div class="indent">--}%
                    %{--<h2>Our Mission</h2>--}%
                    %{--<p class="color-4 p1">Donec vitae massa sit amet lectus condimentum aliquam vestibulum tempor nunc vel mi laoreet nec condimentum mauris convallis. Praesent lobortis, lectus a viverra faucibus, urna turpis sodales purus, magnaorem ipsum dolor ser adipiscing elit sed diam nonummy nibh euismod sit amet ornare urna augue ut mauris.</p>--}%
                    %{--<div class="wrapper">--}%
                        %{--<figure class="img-indent3"><img src="images/page1-img1.png" alt="" /></figure>--}%
                        %{--<div class="extra-wrap">--}%
                            %{--<div class="indent2">--}%
                                %{--Cras placerat, risus ac porta auctor, dui neque varius libero, sed rutrum diam mauris sed lorem. Ut at risus eu dui pretium sodales proin fermentum condimentum eros quis tincidunt fraesent eleifend tempor nisi, in adipiscing felis molestie vitae. Sed et massa justo. Pellentesque turpis lorem, ornare sit amet vulputate at, consectetur--}%
                            %{--</div>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<a class="button-2" href="#">Read More</a>--}%
                %{--</div>--}%
            %{--</div>--}%
            %{--<div class="col-2">--}%
                %{--<div class="block-news">--}%
                    %{--<h3 class="color-4 p2">Recent News</h3>--}%
                    %{--<div class="wrapper p2">--}%
                        %{--<time class="tdate-1 fleft" datetime="2011-05-29"><strong>29</strong>may</time>--}%
                        %{--<div class="extra-wrap">--}%
                            %{--<h5>Utatse eudui pretium</h5>--}%
                            %{--sodales proin fermen<br>tum condimentum eros quis tincidunt fraesent eleifend tempor nisi, in adipiscing... <a href="#">more</a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                    %{--<div class="wrapper">--}%
                        %{--<time class="tdate-1 fleft" datetime="2011-05-24"><strong>24</strong>may</time>--}%
                        %{--<div class="extra-wrap">--}%
                            %{--<h5>Felis molestie vitae</h5>--}%
                            %{--Sed massa justo pellen<br>tesque turpis lorem, ornare sit amet vulpate at, consectetur vitae nunc... <a href="#">more</a>--}%
                        %{--</div>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</section>--}%
<!-- footer -->

<footer>
    <div class="row-top">
        <div class="row-padding">
            %{--<div class="wrapper">--}%
                %{--<div class="col-1">--}%
                    %{--<h4>Address:</h4>--}%
                    %{--<dl class="address">--}%
                        %{--<dt><span>Country:</span>USA</dt>--}%
                        %{--<dd><span>City:</span>San Diego</dd>--}%
                        %{--<dd><span>Address:</span>Beach st. 54</dd>--}%
                        %{--<dd><span>Email:</span><a href="#">lcenter@mail.com</a></dd>--}%
                    %{--</dl>--}%
                %{--</div>--}%
                %{--<div class="col-2">--}%
                    %{--<h4>Follow Us:</h4>--}%
                    %{--<ul class="list-services">--}%
                        %{--<li class="item-1"><a href="#">Facebook</a></li>--}%
                        %{--<li class="item-2"><a href="#">Twitter</a></li>--}%
                        %{--<li class="item-3"><a href="#">LinkedIn</a></li>--}%
                    %{--</ul>--}%
                %{--</div>--}%
                %{--<div class="col-3">--}%
                    %{--<h4>Why Us:</h4>--}%
                    %{--<ul class="list-1">--}%
                        %{--<li><a href="#">Lorem ipsum dolor</a></li>--}%
                        %{--<li><a href="#">Aonsect adipisic</a></li>--}%
                        %{--<li><a href="#">Eiusmjkod tempor</a></li>--}%
                        %{--<li><a href="#">Incididunt ut labore</a></li>--}%
                    %{--</ul>--}%
                %{--</div>--}%
                %{--<div class="col-4">--}%
                    %{--<div class="indent3">--}%
                        %{--<strong class="footer-logo">Point.<strong>co</strong></strong>--}%
                        %{--<strong class="phone"><strong>Toll Free:</strong> 1-800-567-8934</strong>--}%
                    %{--</div>--}%
                %{--</div>--}%
            %{--</div>--}%
        </div>
    </div>
    <div class="row-bot">
        <div class="aligncenter">
            %{--<p class="p0"><a rel="nofollow">Website Template</a> by TemplateMonster.com | <a rel="nofollow" href="http://www.html5xcss3.com/" target="_blank">html5xcss3.com<a/></p>--}%
            %{--<a href="http://www.templates.com/product/3d-models/" target="_blank">3D Models</a> provided by Templates.com<br>--}%
            <a href="#">About Us</a>
            <!-- {%FOOTER_LINK} -->
        </div>
    </div>
</footer>
</div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
<script type="text/javascript">

    $(document).ready(function(){

//        $("li").click(function() {
//            $('.menu li a').removeClass('active');
//            $(this).siblings().removeClass("active");
//        });

    })

    function dashBoard(){
        $('.menu li a').removeClass('active');
        $('#dashBoard').addClass('active')
        $("#dashBoardDiv").show();

    }

    function assets(){
        $('.menu li a').removeClass('active');
        $('#assets').addClass('active')

    }

    function finance(){
        $('.menu li a').removeClass('active');
        $('#finance').addClass('active')

    }

    function users(){
        $('.menu li a').removeClass('active');
        $('#users').addClass('active')

    }

    function contact(){
        $('.menu li a').removeClass('active');
        $('#contact').addClass('active')

    }

    function series(){
        $('.menu li a').removeClass('active');
        $('#series').addClass('active')

    }

    function home(){
        $('.menu li a').removeClass('active');
        $('#home').addClass('active')

    }




    //    $(function(){
//        $('.slider')._TMS({
//            prevBu:'.prev',
//            nextBu:'.next',
//            playBu:'.play',
//            duration:800,
//            easing:'easeOutQuad',
//            preset:'simpleFade',
//            pagination:false,
//            slideshow:3000,
//            numStatus:false,
//            pauseOnHover:true,
//            banners:true,
//            waitBannerAnimation:false,
//            bannerShow:function(banner){
//                banner
//                        .hide()
//                        .fadeIn(500)
//            },
//            bannerHide:function(banner){
//                banner
//                        .show()
//                        .fadeOut(500)
//            }
//        });
//    })
</script>
</body>

</html>