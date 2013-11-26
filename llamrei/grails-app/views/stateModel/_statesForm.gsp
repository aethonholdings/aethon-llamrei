
<div id="state-form">
    <g:hiddenField name="stateModelId" value="${stateModelId}" />
   <table>

       <tr>
           <td style="width:50px">
        <label class="lb" ><g:message code="title.state.name"/></label>
        <g:textField class="field" name="state.name" value="" style="margin-left: 3%;" />
         </td>
               <td style="width:160px">
         <label class="lb" ><g:message code="title.state.description"/></label>
         <g:textField class="field" name="state.description" value="" style="margin-left: 3.5%;"/>
       </td>
             <td style="width:480px">
             <div class="box-cards">
                 <div class="box-cards-title" >
                <a class="btn-open" href="#"><span style="color: #000000"><g:message code="title.state.stateRules"/></span></a>
                 </div>

                 <div class="box-card-hold">
                     <div style="position:relative">
                         <div id="stateRules">
                             <g:render template="statesRules" model="[stateModelId:stateModelId]" />
                         </div>
                     </div>
                 </div>
             </div>
            </td>




    </tr>




    </table>
</div>


<div>
    <a onclick="addState()" class="actionButton">
        <span><g:message code="button.add"/></span>
    </a>

</div>