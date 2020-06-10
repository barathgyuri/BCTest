function getInvoice() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('GetLastInvoice', '');
}

function PassInvoiceDataToJs(SalesInvoice) {
    parentDiv = document.getElementById('contentdiv1');
    invData = document.createElement('h3');
    invData.id = 'CustName';
    invData.innerText = 'Customer Name:' + SalesInvoice['CustName'];
    parentDiv.appendChild(invData);

    invData = document.createElement('h4');
    invData.id = 'DocNo';
    invData.innerText = 'Document No.:' + SalesInvoice['DocNo'];
    parentDiv.appendChild(invData);

    invData = document.createElement('h4');
    invData.id = 'Amount';
    invData.innerText = 'Invoice Amount:' + SalesInvoice['Amount'];
    parentDiv.appendChild(invData);

    invData = document.createElement('h4');
    invData.id = 'VATAmount';
    invData.innerText = 'Invoice VAT Amount:' + SalesInvoice['VATAmount'];
    parentDiv.appendChild(invData);

    invData = document.createElement('h4');
    invData.id = 'AmtInclVAT';
    invData.innerText = 'Invoice Amount Inc. VAT:' + SalesInvoice['AmtInclVAT'];
    parentDiv.appendChild(invData);

    printInvButton = document.createElement('button');
    printInvButton.innerText = 'Print Invoice';
    printInvButton.id = 'printinvoice';
    printInvButton.className = "btn btn-success";
    parentDiv.appendChild(printInvButton);

    document.querySelector('#printinvoice').addEventListener('click', printInvoice);
}

function printInvoice() {
    docNoNode = document.getElementById('DocNo');

    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PrintSalesInvoice', [docNoNode.innerText.split(':')[1]])
}