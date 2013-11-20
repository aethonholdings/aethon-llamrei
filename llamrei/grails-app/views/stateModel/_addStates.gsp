<script type="text/javascript">


        function addstate(){
            alert("you are about to define a new state")
            $('#addstate_clone').clone().insertAfter("#addstate_clone");
        }


    //bind click event on delete buttons using jquery live
    $('.del-state').live('click', function() {

        //find the parent div
        var prnt = $(this).parents(".state-div");
        //find the deleted hidden input
        var delInput = prnt.find("input[id$=deleted]");
        //check if this is still not persisted
        var newValue = prnt.find("input[id$=new]").attr('value');
        //if it is new then i can safely remove from dom
        if(newValue == 'true'){
            prnt.remove();
        }else{
            //set the deletedFlag to true
            delInput.attr('value','true');
            //hide the div
            prnt.hide();
        }
    });

</script>

<div id="childList">
    <g:each var="state" in="${stateModelInstance}" status="i">

        <!-- Render the addstate template (_addstate.gsp) here -->
        <g:render template='addstate' model="['addstate':addstate,'i':i,'hidden':false]"/>
        <!-- Render the addstate template (_addstate.gsp) here -->

    </g:each>
</div>
<input type="button" id="button1" value="Add state"  onclick=addstate() />
