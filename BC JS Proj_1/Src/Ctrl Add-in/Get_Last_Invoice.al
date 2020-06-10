controladdin "Get Last Invoice"
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 700;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'Src/Js/GetLastInvoiceFunctions.js';
    StyleSheets = 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css', 'Src/CSS/GetLastInvoice.css';
    StartupScript = 'Src/Js/GetLastInvoiceStartup.js';

    event Ready();
    event GetLastInvoice();
    event PrintSalesInvoice(DocNo: Text);

    procedure PassInvoiceDataToJs(SalesInv: JsonObject);
}