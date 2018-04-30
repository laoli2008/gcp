{% extends "layouts/public.volt" %}

{% block main %}
{%- macro Green1_Red0(val) %}
  {% if val == 1 %}
    <img src="/assets/app/img/green.png" width="32">
  {% elseif val == 0 %}
    <img src="/assets/app/img/red.png" width="32">
  {% endif %}
{%- endmacro %}

{%- macro GreenClose1_RedOpen0(val) %}
  {% if val == 1 %}
    <img src="/assets/app/img/green-close.png" width="40">
  {% elseif val == 0 %}
    <img src="/assets/app/img/red-open.png" width="32">
  {% endif %}
{%- endmacro %}

{%- macro Green0_Red1_NA(val) %}
  {% if val == 0 %}
    <img src="/assets/app/img/green.png" width="32">
  {% elseif val == 1 %}
    <img src="/assets/app/img/red.png" width="32">
  {% elseif val == 9 %}
    <img src="/assets/app/img/black-na.png" width="32">
  {% endif %}
{%- endmacro %}

<div class="container">
  <div class="w3-modal" style="display: block;">
    <div class="w3-modal-content w3-card-8 w3-padding" style="max-width:900px">
      <h2>Project Details</h2>

      <table class="w3-table padding0">
        <tr>
          <td width="20%">Project Name</td>
          <td width="80%">{{ project.siteName }}</td>
        </tr>
        <tr>
          <td>Project Address</td>
          <td>{{ project.address }}</td>
        </tr>
        <tr>
          <td>Project Size</td>
          <td>{{ project.projectSize }}</td>
        </tr>
        <tr>
          <td>Store Number</td>
          <td>{{ project.storeNumber }}</td>
        </tr>
        <tr>
          <td>Operation Mode</td>
          <td>{{ project.operationMode }}</td>
        </tr>
      </table>

      <table class="w3-table w3-bordered w3-border w3-margin-top compact">
        <tr>
          <th width="33%">Description</th>
          <th width="33%">Utility Main</th>
          <th width="33%">Generator</th>
        </tr>
        <tr>
          <td>Total Power, kW</td>
          <td data-tag="20684">{{ data['M_Total_Main_po'] }}</td>
          <td data-tag="20680 ">{{ data['M_Gen_real_enrg'] }}</td>
        </tr>
        <tr>
          <td>Average Current, A</td>
          <td data-tag="20676">{{ data['M_Av_Main_Curnt'] }}</td>
          <td data-tag="20678">{{ data['M_Av_Gen_Crnt'] }}</td>
        </tr>
        <tr>
          <td>Average Voltage, V</td>
          <td data-tag="20670">{{ data['M_Av_Main_Del_V'] }}</td>
          <td data-tag="20664">{{ data['M_Av_Gen_DeltaV'] }}</td>
        </tr>
        <tr>
          <td>Power Factor, pF</td>
          <td data-tag="20668">{{ data['M_Main_power_pf'] }}</td>
          <td data-tag="20660">{{ data['M_Gen_Power_fac'] }}</td>
        </tr>
        <tr><td colspan="3" class="w3-light-gray"></td></tr>
        <tr>
          <td>Last Run's Real Energy, kWh</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>Yesterday's Real Energy, kWh</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>Month-To-Date Real Energy, kWh</td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td>Total Real Energy, kWh</td>
          <td></td>
          <td></td>
        </tr>
        <tr><td colspan="3" class="w3-light-gray"></td></tr>
        <tr>
          <td>Urea Level</td>
          <td>N/A</td>
          <td>97%</td>
        </tr>
        <tr>
          <td>Hours till Next Maintenance</td>
          <td>N/A</td>
          <td data-tag="20546">{{ data['Hrs_until_maint'] }}</td>
        </tr>
      </table><br>

      <table class="w3-table w3-bordered w3-border w3-margin-top compact">
        <tr>
          <th colspan="2" class="center">Site Status</th>
        </tr>
        <tr>
          <td width="33%">Generator Status</td>
          <td width="66%"></td>
        </tr>
        <tr>
          <td>Main Breaker Status</td>
          <td></td>
        </tr>
        <tr>
          <td>Generator Breaker Status</td>
          <td></td>
        </tr>
        <tr>
          <td>Operation Mode: {{ project.operationMode }}</td>
          <td></td>
        </tr>
        <tr>
          <td>Remote Start Initiated</td>
          <td></td>
        </tr>
        <tr>
          <td>86G Lockout</td>
          <td></td>
        </tr>
        <tr>
          <td>86U Lockout</td>
          <td></td>
        </tr>
        <tr>
          <td>Emergency Mode Initiated</td>
          <td></td>
        </tr>
      </table><br>

      <table class="w3-table w3-bordered w3-border w3-margin-top compact">
        <tr>
          <th colspan="2" class="center">RTAC Status</th>
        </tr>
        <tr>
          <td width="33%">Utility Connect Permission</td>
          <td width="66%"></td>
        </tr>
        <tr>
          <td>Utility Allow Connect</td>
          <td></td>
        </tr>
        <tr>
          <td>Utility Trip Disconnect Command</td>
          <td></td>
        </tr>
        <tr>
          <td>Utility Block Connect</td>
          <td></td>
        </tr>
        <tr>
          <td>EMCP_Status</td>
          <td></td>
        </tr>
        <tr><th colspan="2" class="center">Communication Devices Status</th></tr>
        <tr>
          <td>SEL_Com_Status</td>
          <td></td>
        </tr>
        <tr>
          <td>EZ_Com_Status</td>
          <td></td>
        </tr>
        <tr>
          <td>ACMG_Com_Status</td>
          <td></td>
        </tr>
        <tr>
          <td>Primary Modem State</td>
          <td></td>
        </tr>
        <tr>
          <td>EMCP_Status</td>
          <td></td>
        </tr>
      </table><br>

      <table class="w3-table w3-bordered w3-border w3-margin-top compact">
        <tr>
          <th colspan="3" class="center">RTAC ALARMS</th>
        </tr>
        <tr>
          <td>Start Time</td>
          <td>End Time</td>
          <td>Descripton</td>
        </tr>
        <tr>
          <td width="20%">2018-04-21 15:18:02</td>
          <td width="20%">2018-04-21 15:20:34</td>
          <td width="60%">Offline</td>
        </tr>
      </table><br>
      <br>

    </div>
    <p>&nbsp;</p>
  </div>
</div>
{% endblock %}

{% block csscode %}
.w3-modal { padding: 20px; }
.w3-bordered th { border: 1px solid #ddd; }
.w3-bordered td { border: 1px solid #ddd; }
.w3-table.padding0 td { padding: 0 2px; }
.w3-table.padding0 th { padding: 0 2px; }
.w3-table.compact td { padding: 2px; }
.w3-table.compact th { padding: 2px; }
.w3-table td.center { text-align: center; }
.w3-table th.center { text-align: center; }
.w3-bordered tr td:not(:first-child) { text-align: center; }
.w3-bordered tr th:not(:first-child) { text-align: center; }
{% endblock %}
