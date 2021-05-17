<section class="col-md-12">
<h2>This is a configuration panel for InBank Loan Calculator module</h1><br>
<h4>Default values are predefined in the settings. You can change the default values here and set your own parameters:</h4><br>
<form action="">
{* a = partner (a=partner)  *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="a_parameter">{l s='a = partner (must be defined otherwise no other followed param values will be defined)' mod='inbankloancalculator'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='a = partner (must be defined otherwise no other followed param values will be defined):' mod='inbankloancalculator'}" type="text" id="a_parameter" placeholder="a=partner" value="a=partner" readonly="readonly"/>
        </div>
    </div>

{* b = minimun amount (50) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="b_parameter">{l s='b = minimun amount (50)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='b = minimun amount (50)' mod='inbankloancalculator'}" type="number" id="b_parameter" placeholder="50" value="50" min="50" max="5000" />
        </div>
    </div>

{* c = maximum amount (5000) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="c_parameter">{l s='c = maximum amount (5000)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='c = maximum amount (5000)' mod='inbankloancalculator'}" type="number" id="c_parameter" placeholder="5000" value="5000" min="50" max="5000" />
        </div>
    </div>   

{* d = default amount (2000) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="d_parameter">{l s='d = default amount (2000)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='d = default amount (2000)' mod='inbankloancalculator'}" type="number" id="d_parameter" placeholder="2000" value="2000" />
        </div>
    </div>   

{* e = minimum period (3) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="e_parameter">{l s='e = minimum period (3)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='e = minimum period (3)' mod='inbankloancalculator'}" type="number" id="e_parameter" placeholder="3" value="3" min="3" max="48" />
        </div>
    </div>   
    
{* f = maximum period (48) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="f_parameter">{l s='f = maximum period (48)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='f = maximum period (48)' mod='inbankloancalculator'}" type="number" id="f_parameter" placeholder="48" value="48" min="3" max="48" />
        </div>
    </div>   

{* g = default period (24) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="g_parameter">{l s='g = default period (24)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='g = default period (24)' mod='inbankloancalculator'}" type="number" id="g_parameter" placeholder="24" value="24"/>
        </div>
    </div>   

{* h = step of period (3) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="h_parameter">{l s='h = step of period (3)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='h = step of period (3)' mod='inbankloancalculator'}" type="number" id="h_parameter" placeholder="3" value="3" />
        </div>
    </div>   

{* i = minimum downpayment (0) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="i_parameter">{l s='i = minimum downpayment (0)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='i = minimum downpayment (0)' mod='inbankloancalculator'}" type="number" id="i_parameter" placeholder="0" value="0" min="0" max="90" />
        </div>
    </div>   

{* j = maximum downpayment (90) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="j_parameter">{l s='j = maximum downpayment (90)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='j = maximum downpayment (90)' mod='inbankloancalculator'}" type="number" id="j_parameter" placeholder="90" value="90" min="0" max="90" />
        </div>
    </div>   

{* k = default downpayment (10) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="k_parameter">{l s='k = default downpayment (10)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='k = default downpayment (10)' mod='inbankloancalculator'}" type="number" id="k_parameter" placeholder="10" value="10"/>
        </div>
    </div>   

{* l = step of downpayment (10) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="l_parameter">{l s='l = step of downpayment (10)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='l = step of downpayment (10)' mod='inbankloancalculator'}" type="number" id="l_parameter" placeholder="10" value="10"/>
        </div>
    </div>   

{* m = interest (20.9) Must be percentage *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="m_parameter">{l s='m = interest (20.9) Must be percentage'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='m = interest (20.9) Must be percentage' mod='inbankloancalculator'}" type="number" id="m_parameter" placeholder="20.9" value="20.9"/>
        </div>
    </div>       

{* n = contract fee (5.5) Must be percentage *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="n_parameter">{l s='n = contract fee (5.5) Must be percentage'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='n = contract fee (5.5) Must be percentage' mod='inbankloancalculator'}" type="number" id="n_parameter" placeholder="5.5" value="5.5"/>
        </div>
    </div>  

{* o = contract fee min (10) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="o_parameter">{l s='o = contract fee min (10)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='o = contract fee min (10)' mod='inbankloancalculator'}" type="number" id="o_parameter" placeholder="10" value="10" min="10"/>
        </div>
    </div>   

{* p = admin fee (0) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="p_parameter">{l s='p = admin fee (0)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='p = admin fee (0)' mod='inbankloancalculator'}" type="number" id="p_parameter" placeholder="0" value="0"/>
        </div>
    </div>

 {* q = zero downpayment maximum amount (1400) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="q_parameter">{l s='q = zero downpayment maximum amount (1400)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='q = zero downpayment maximum amount (1400)' mod='inbankloancalculator'}" type="number" id="q_parameter" placeholder="1400" value="1400" max="1400"/>
        </div>
    </div>

 {* r = disclaimer text *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="c_parameter">{l s='r = disclaimer text'}</label>
        <div class="col-md-5">
            <input class="form-control" aria-label="{l s='r = disclaimer text' mod='inbankloancalculator'}" type="text" id="r_parameter" placeholder="The calculation is approximate and may differ from the terms and conditions offered to you." value="The calculation is approximate and may differ from the terms and conditions offered to you." maxlength="500"/>
        </div>
    </div>

 {* s = template (leave blank or type 'white' - Adds white background *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="s_parameter">{l s='s = template (white) Adds white background'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='s = template (white) Adds white background' mod='inbankloancalculator'}" type="text" id="s_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t = complicated predefined disclaimer text (available disclaimers: t=one ) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t_parameter">{l s='t = complicated predefined disclaimer text (available disclaimers: t=one )'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t = complicated predefined disclaimer text (available disclaimers: t=one )' mod='inbankloancalculator'}" type="text" id="t_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t-amount = disclaimer loan amount (-) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-amount_parameter">{l s='t-amount = disclaimer loan amount (-)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-amount = disclaimer loan amount (-)' mod='inbankloancalculator'}" type="number" id="t-amount_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t-period = disclaimer period (-) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-period_parameter">{l s='t-period = disclaimer period (-)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-period = disclaimer period (-)' mod='inbankloancalculator'}" type="number" id="t-period_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t-interest = disclaimer interest rate (-) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-interest_parameter">{l s='t-interest = disclaimer interest rate (-)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-interest = disclaimer interest rate (-)' mod='inbankloancalculator'}" type="number" id="t-interest_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t-commision = disclaimer commision fee (-) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-commision_parameter">{l s='t-commision = disclaimer commision fee (-)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-commision = disclaimer commision fee (-)' mod='inbankloancalculator'}" type="number" id="t-commision_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t-adminfee = disclaimer admin fee (0) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-adminfee_parameter">{l s='t-adminfee = disclaimer admin fee (0)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-adminfee = disclaimer admin fee (0)' mod='inbankloancalculator'}" type="number" id="t-adminfee_parameter" placeholder="0" value="0"/>
        </div>
    </div>

 {* t-total = disclaimer total amount to repaid (-) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-total_parameter">{l s='t-total = disclaimer total amount to repaid (-)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-total = disclaimer total amount to repaid (-)' mod='inbankloancalculator'}" type="number" id="t-total_parameter" placeholder="" value=""/>
        </div>
    </div>

 {* t-apr = disclaimer apr (-) *}
    <div class="form-group row">
        <label class="col-md-2 form-control-label" for="t-apr_parameter">{l s='t-apr = disclaimer apr (-)'}</label>
        <div class="col-md-2">
            <input class="form-control" aria-label="{l s='t-apr = disclaimer apr (-)' mod='inbankloancalculator'}" type="number" id="t-apr_parameter" placeholder="" value=""/>
        </div>
    </div>
  <input type="submit" value="Save settings">
</form> 
</section>