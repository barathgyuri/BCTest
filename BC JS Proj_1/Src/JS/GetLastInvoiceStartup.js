var CtrlParentBox = document.getElementById('controlAddIn');
var mainDiv = document.createElement('div');
mainDiv.id = 'maindiv';
mainDiv.className = 'maindiv';
mainDiv.innerHTML =
    '<h2>Last sales invoice data</h2>' +
    '<div class="button-div" id="buttondiv1">' +
    '<button class="btn btn-success" id="button1">Get Invoice</button>' +
    '</div>' +
    '<div class="content-div" id="contentdiv1"></div>';
CtrlParentBox.appendChild(mainDiv);

document.querySelector('#button1').addEventListener('click', getInvoice);