<!DOCTYPE html>
<html>
    <head>
        <title><g:layoutTitle default="Llamrei" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        %{--<link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'old.css')}"/>--}%
        <jq:resources/>
        <jqui:resources/>
        <g:urlMappings/>
        <g:javascript library="jquery"/>
        <g:javascript library="application"/>
        <g:javascript library="jquery" plugin="jquery"/>

        <script type="text/javascript" src="${resource(dir: 'js', file: 'jquery.ui.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'highchart.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'dashBoard.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js/jquery', file: 'jquery.ui.datepicker.js')}"></script>
        <script type="text/javascript" src="${resource(dir: 'js', file: 'assetMonitor.js')}"></script>
        <link rel="stylesheet" type="text/css" href="${resource(dir: 'css', file: 'subTab.css')}"/>
        <script type="text/javascript" src="${resource(dir: 'js/DataTables-1.8.2', file: 'media/js/jquery.dataTables.js')}"></script>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <script type="text/javascript" src="${resource(dir: 'js', file: 'menu.js')}"></script>
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />        


        <g:layoutHead />
       <script type="text/javascript">
          $(document).ready(function(){

            setInterval(function () {
                 checkConnectionStatus();
            }, 20000);
        });


        function checkConnectionStatus(){
        jQuery.ajax
          ({
        type:'POST',
        url:g.createLink({controller: 'dataListener', action: 'checkConnectivityStatus'}),

        dataType: "json",
        success:function(data)
        {
            var jsonLengthCount=0;

            $.each(data, function() {
                jsonLengthCount++
            });


        }
        ,error:function(XMLHttpRequest, textStatus, errorThrown) {
//            alert("Error in fetching Data")
        }

            });
        }
          </script>

    </head>
    
    <body>
      <g:render template="/layouts/header"/>
      <div id="content">
        <g:layoutBody/>
      </div>
      <g:render template="/layouts/footer"/>
    </body>
</html>