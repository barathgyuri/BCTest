function getLastCustomer() {
    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('getLastCustomer', '');
}

function PassInvoiceDataToJs(SalesInvObj) {
    parentDiv = document.getElementById('contentdiv1');
    custDat = document.createElement('h3');
    custDat.innerText = 'Customer name:' + SalesInvObj['CustName'];
    parentDiv.appendChild(custDat);

    custDat = document.createElement('h4');
    custDat.id = 'DocNo';
    custDat.innerText = 'Document No.: ' + SalesInvObj['DocNo'];
    parentDiv.appendChild(custDat);

    custDat = document.createElement('h4');
    custDat.id = 'Amount';
    custDat.innerText = 'Invoice Amount: ' + SalesInvObj['Amount'];
    parentDiv.appendChild(custDat);

    custDat = document.createElement('h4');
    custDat.id = 'VATAmount';
    custDat.innerText = 'Invoice VAT: ' + SalesInvObj['VATAmount'];
    parentDiv.appendChild(custDat);

    custDat = document.createElement('h4');
    custDat.id = 'AmtIncVAT';
    custDat.innerText = 'Amount Including VAT: ' + SalesInvObj['AmtIncVAT'];
    parentDiv.appendChild(custDat);

    printInvBut = document.createElement('button');
    printInvBut.className = 'btn btn-success';
    printInvBut.innerText = 'Print Invoice';
    printInvBut.id = 'printInvoice';
    parentDiv.appendChild(printInvBut);

    document.querySelector('#printInvoice').addEventListener('click', printInvoice);
}

function printInvoice() {
    docNoNode = document.getElementById('DocNo');

    Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('PrintInvoiceAL', [docNoNode.innerText.split(':')[1]]);
}