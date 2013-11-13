<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <jq:resources/>
        <jqui:resources/>
        <g:javascript library="jquery"/>
        <g:javascript library="application"/>
        <g:javascript library="jquery" plugin="jquery"/>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'style1.css')}"/>
        %{--<script type="text/javascript" src="${resource(dir: 'js/style1', file: 'jquery.easing-sooper.js')}"></script>--}%
        %{--<script type="text/javascript" src="${resource(dir: 'js/style1', file: 'jquery.kwicks-1.5.1.js')}"></script>--}%
        %{--<script type="text/javascript" src="${resource(dir: 'js/style1', file: 'jquery.sooperfish.js')}"></script>--}%
        %{--<script type="text/javascript" src="${resource(dir: 'js/style1', file: 'modernizr-1.5.min.js')}"></script>--}%
        %{--<script type="text/javascript" src="${resource(dir: 'js/style1', file: 'jquery.jss')}"></script>--}%
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />

        <g:layoutHead />
        <g:javascript library="application" />
        <script type="text/javascript">
            $(document).ready(function(){

                $('ul.sf-menu').sooperfish();

            });
        </script>
    </head>
    <body>

    <div class="header1">
        <g:render template="/layouts/header"/>

    </div>
    <div style="min-height: 400px;margin-top:auto">
        <g:layoutBody/>
    </div>
    <div class="footer1">
        <g:render template="/layouts/footer"/>
    </div>
        %{--<div id="spinner" class="spinner" style="display:none;">--}%
            %{--<img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />--}%
        %{--</div>--}%
        %{--<div id="grailsLogo"><a href="http://grails.org"><img src="${resource(dir:'images',file:'grails_logo.png')}" alt="Grails" border="0" /></a></div>--}%
        %{--<g:layoutBody />--}%
    </body>
</html>