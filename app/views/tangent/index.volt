{% extends "layouts/base.volt" %}

{% block main %}
<style type="text/css">
#box { font-size:24px; }
#box button { font-size:24px; }
#box span { margin-right: 40px; }
#start { margin-right: 4em; }
</style>

<div class="w3-container">
{#
  <div class="w3-margin-bottom">
    <b>Primary IP</b>: {{ webRelay['primary_ip'] }},
    <b>Backup IP</b>: {{ webRelay['backup_ip'] }}
  </div>
#}
  <table class="w3-table w3-border w3-padding">
    <tr>
      <td><button id="start" class="w3-button w3-white w3-border w3-xlarge" onclick="start()">Start</button></td>
      <td id="box">
        <span>Generator Status: </span>
        <button id="btnon"  onclick="turnOn()">ON <i class="fa fa-circle"></i></button>
        <button id="btnoff" onclick="turnOff()">OFF <i class="fa fa-circle-o"></i></button>
      </td>
      <td><button id="stop"  class="w3-button w3-white w3-border w3-xlarge w3-right" onclick="stop()">Stop</button></td>
    </tr>
  </table>
</div>
{% endblock %}

{% block jscode %}
  var timer = 0;
  var working = false;
  var projectId = {{ projectId }};

  function start() {
    if (!working) {
      working = true;
      turnOn();
      timer = setInterval(getState, 1000*30);
      $('#start').removeClass('w3-white').addClass('w3-green');
    }
  }

  function stop() {
    working = false;
    turnOff();
    clearInterval(timer);
    $('#start').removeClass('w3-green').addClass('w3-white');
  }

  function getState() {
    var url = '/tangent/getstate/' + projectId;
    $.get(url, function(res) {
      updateState(res.data);
    });
  }

  function turnOn() {
    var url = '/tangent/turnon/' + projectId;
    $.get(url, function(res) {
      updateState(res.data);
    });
  }

  function turnOff() {
    var url = '/tangent/turnoff/' + projectId;
    $.get(url, function(res) {
      updateState(res.data);
    });
  }

  function updateState(res) {
    console.log('updateState', res);
    if (res.relay1state == 1) {
      $('#btnon').css("color", "red");
    } else {
      $('#btnon').css("color", "");
    }
  }
{% endblock %}

{% block domready %}
  getState();
{% endblock %}
