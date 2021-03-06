{*
* 2012-2013 Klik&Pay
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
*
*  @author Klik&Pay <info@klikandpay.com>
*  @copyright  2012-2013 Klik&Pay
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of KliK&Pay
*}

<form id="main-form" action="{$req_uri|escape:'htmlall':'UTF-8'}" method="post" >
    <fieldset>
	
	{if $account != 0}
	    <input type="hidden" name="id_account" value="{$account.id_account|escape:'htmlall':'UTF-8'}">
	{/if}

        <div id="tab-config" class="block-config">   
		<label for="sellerid">{l s='Account ID' mod='klikandpay'}</label>       
            <div class="margin-form">
                <input type="text" name="sellerid" id="sellerid" value="{if $account != 0}{$account.sellerid|escape:'htmlall':'UTF-8'}{/if}" />
                <p class="clear">
		    {l s='Set the sellerid' mod='klikandpay'}
		    <a href="https://www.klikandpay.com/fr/contact/ouvrir_compte.html" target="_blank">{l s='Create an account' mod='klikandpay'}</a>
                </p>
            </div>


		<label for="currency">{l s='Currency' mod='klikandpay'}</label>
	    <div class="margin-form">
		{$i = 1}
		{foreach $currencies as $currency}
		    <input type="radio" id="currency" name="currency" value="{$currency.id_currency|escape:'htmlall'}" {if ($account != 0 && $account.currency == $currency.id_currency) || ($account == 0 && $account.currency != $currency.id_currency && $i == 1)}checked="checked"{/if}) /> {$currency.iso_code|escape:'htmlall'}
		{$i = $i + 1}
		{/foreach}
		<p class="clear">{l s='Choose the currency that this account will support' mod='klikandpay'}</p>
	    </div>

		<label for="3ds">{l s='3D Secure' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="checkbox" name="3ds" id="3ds" value="1" {if ($account != 0 && $account.3ds == '1') || $account == 0}checked="checked"{/if} />
		<p class="clear">{l s='Account with 3D Secure' mod='klikandpay'}</p>
	    </div>    
	    
	    {if $account != 0 && $account.has_threshold == 1}
		   <label for="threshold">{l s='Price threshold from cart' mod='klikandpay'}</label>
		<div class="margin-form">
		   <input type="text" name="threshold" id="threshold" value="{if $account.threshold != -1}{$account.threshold|escape:'htmlall':'UTF-8'}{/if}" />
		   <p class="clear">{l s='The price threshold from cart that will switch payment modes to 3D Secure for this currency' mod='klikandpay'}</p>
	       </div>    
	    {/if}

		<label for="mode1">{l s='Mode1' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="checkbox" name="mode1" id="mode1" value="1" {if ($account != 0 && $account.mode1 == '1') || $account == 0}checked="checked"{/if} />
		<p class="clear">{l s='Set the cash mode' mod='klikandpay'}</p>
	    </div>    
		<label for="modex">{l s='Modex' mod='klikandpay'}</label>
	    <div class="margin-form">
		<select type="text" name="modex" id="modex">
		    <option value="0" {if $account != 0 && $account.modex == '0'}selected="selected{/if}">{l s='None' mod='klikandpay'}</option>
		    <option value="2" {if $account != 0 && $account.modex == '2'}selected="selected{/if}">2</option>
		    <option value="3" {if $account != 0 && $account.modex == '3'}selected="selected{/if}">2,3</option>
		    <option value="4" {if $account != 0 && $account.modex == '4'}selected="selected{/if}">2,3,4</option>
		    <option value="5" {if $account != 0 && $account.modex == '5'}selected="selected{/if}">2,3,4,5</option>
		    <option value="6" {if $account != 0 && $account.modex == '6'}selected="selected{/if}">2,3,4,5,6</option>
		</select>
		<p class="clear">{l s='Set the payment in several times' mod='klikandpay'}</p>
	    </div>

		<label for="step2">{l s='Montant minimum du panier permettant de proposer le paiement en 2 fois' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="text" name="step2" id="step2" value="{if $account != 0}{$account.step2|escape:'htmlall':'UTF-8'}{/if}" />
		<p class="clear">{l s='0 is always proposed, empty is never proposed' mod='klikandpay'}</p>
	    </div>

		<label for="step3">{l s='Montant minimum du panier permettant de proposer le paiement en 3 fois' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="text" name="step3" id="step3" value="{if $account != 0}{$account.step3|escape:'htmlall':'UTF-8'}{/if}" />
		<p class="clear">{l s='0 is always proposed, empty is never proposed' mod='klikandpay'}</p>
	    </div>

		<label for="step4">{l s='Montant minimum du panier permettant de proposer le paiement en 4 fois' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="text" name="step4" id="step4" value="{if $account != 0}{$account.step4|escape:'htmlall':'UTF-8'}{/if}" />
		<p class="clear">{l s='0 is always proposed, empty is never proposed' mod='klikandpay'}</p>
	    </div>

		<label for="step5">{l s='Montant minimum du panier permettant de proposer le paiement en 5 fois' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="text" name="step5" id="step5" value="{if $account != 0}{$account.step5|escape:'htmlall':'UTF-8'}{/if}" />
		<p class="clear">{l s='0 is always proposed, empty is never proposed' mod='klikandpay'}</p>
	    </div>

		<label for="step6">{l s='Montant minimum du panier permettant de proposer le paiement en 6 fois' mod='klikandpay'}</label>
	    <div class="margin-form">
		<input type="text" name="step6" id="step6" value="{if $account != 0}{$account.step6|escape:'htmlall':'UTF-8'}{/if}" />
		<p class="clear">{l s='0 is always proposed, empty is never proposed' mod='klikandpay'}</p>
	    </div>

	    {if $account != 0}
		<input type="submit" id="btnEditAccount" name="btnEditAccount" value="{l s='Save' mod='klikandpay'}" class="button" />
		<input type="submit" id="btnDeleteAccount" onclick="return confirm('{l s='Are you sure you want to delete this account ?' mod='klikandpay'}')" name="btnDeleteAccount" value="{l s='Delete' mod='klikandpay'}" class="button" />
	    {else}
		<input type="submit" id="btnAddAccount" name="btnAddAccount" value="{l s='Save' mod='klikandpay'}" class="button" />
	    {/if}
    </fieldset>    
</form>

