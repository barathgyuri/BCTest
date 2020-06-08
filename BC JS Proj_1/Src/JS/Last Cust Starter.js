Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('Ready', '');

var CtrlParentBox = document.getElementById('controlAddIn');
var mainDiv = document.createElement('div');
mainDiv.id = 'mainDiv';
mainDiv.className = 'mainDiv';
mainDiv.innerHTML =
    '<h2>Last sales post customer</h2>' +
    '<div class="button-div" id ="buttondiv1">' +
    '<button class="btn btn-success">Get customer</button></div>' +
    '<div class="content-div" id="contentdiv1"></div>';
CtrlParentBox.appendChild(mainDiv);

document.querySelector('#buttondiv1').addEventListener('click', getLastCustomer);