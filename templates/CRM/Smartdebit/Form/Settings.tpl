{*--------------------------------------------------------------------+
| CiviCRM version 4.7                                                |
+--------------------------------------------------------------------+
| Copyright CiviCRM LLC (c) 2004-2017                                |
+--------------------------------------------------------------------+
| This file is a part of CiviCRM.                                    |
|                                                                    |
| CiviCRM is free software; you can copy, modify, and distribute it  |
| under the terms of the GNU Affero General Public License           |
| Version 3, 19 November 2007 and the CiviCRM Licensing Exception.   |
|                                                                    |
| CiviCRM is distributed in the hope that it will be useful, but     |
| WITHOUT ANY WARRANTY; without even the implied warranty of         |
| MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.               |
| See the GNU Affero General Public License for more details.        |
|                                                                    |
| You should have received a copy of the GNU Affero General Public   |
| License and the CiviCRM Licensing Exception along                  |
| with this program; if not, contact CiviCRM LLC                     |
| at info[AT]civicrm[DOT]org. If you have questions about the        |
| GNU Affero General Public License or the licensing of CiviCRM,     |
| see the CiviCRM license FAQ at http://civicrm.org/licensing        |
+-------------------------------------------------------------------*}

<div class="crm-block crm-form-block crm-smartdebit-settings-form-block">
  <div class="crm-submit-buttons">
    {include file="CRM/common/formButtons.tpl" location="top"}
  </div>

  {if $apiStatus}
    <h3>Smart Debit API Connection</h3>
    <div>{$apiStatus}</div>
    <div class="clear"></div>
  {/if}

  {if $sdStatus}
    <h3>Smart Debit API Status</h3>
    <table class="form-layout-compressed"><tbody>
      <tr><td>
          <label>Response</label>
          {$sdStatus.statuscode} {$sdStatus.message} {$sdStatus.error}&nbsp;
        </td></tr>
      <tr><td>
          <label>API Version</label>
          {$sdStatus.api_version}
        </td></tr>

      <tr><td>
          <label>Service Users</label>
          {foreach from=$sdStatus.user.assigned_service_users.service_user item=pslid}
            {$pslid}
          {/foreach}
        </td></tr>

      </tbody></table>
  {/if}

  {if $sdStatusTest}
    <h3>Smart Debit Test API Status</h3>
    <table class="form-layout-compressed"><tbody>
      <tr><td>
          <label>Response</label>
          {$sdStatusTest.statuscode} {$sdStatusTest.message} {$sdStatusTest.error}
        </td></tr>
      <tr><td>
          <label>API Version</label>
          {$sdStatusTest.api_version}
        </td></tr>
      <tr><td>
          <label>Service Users</label>
          {foreach from=$sdStatusTest.user.assigned_service_users.service_user item=pslid}
            {$pslid}
          {/foreach}
        </td></tr>
      </tbody></table>
  {/if}

  <h3>Statistics</h3>
  <table class="form-layout-compressed"><tbody>
    <tr><td>
        <label>Cached Mandates</label>
        {$sdMandateCount}
    </td></tr>
    <tr><td>
        <label>Cached Collection Reports</label>
        {$sdCRCount}
    </td></tr>
    </tbody></table>

  <h2>Configuration</h2>

  {foreach from=$elementGroups item=elementGroup}
    <div class="clear">
      <br />
      <h3>{$elementGroup.title}</h3>
      <div class="help">{$elementGroup.description}</div>
      <table class="form-layout-compressed">
        {foreach from=$elementGroup.elementNames item=elementName}
        {if $elementName eq 'day_dd_days_difference'}
          <tr>
            <td><br /><strong>Days difference to check between current date and payment date to determine if this is first payment or not, during SD sync.</strong>
            </td>
          </tr>
        {/if}
          <tr><td>
              {$form.$elementName.html}
              <label for="{$elementName}">{$form.$elementName.label} {help id=$elementName title=$form.$elementName.label}</label>
            </td></tr>
        {/foreach}
      </table>
    </div>
  {/foreach}

  {* FOOTER *}
  <div class="crm-submit-buttons">
    {include file="CRM/common/formButtons.tpl" location="bottom"}
  </div>
  </div>
