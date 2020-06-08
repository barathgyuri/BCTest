controladdin "Last customer"
{
    RequestedHeight = 300;
    MinimumHeight = 300;
    MaximumHeight = 1200;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;
    Scripts = 'Src/JS/Last_Cust_Functions.js';
    //StyleSheets = 'Src/CSS/Last Cust.css';
    StyleSheets = 'https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css';
    StartupScript = 'Src/JS/Last Cust Starter.js';

    event Ready();
    event getLastCustomer();
    event PrintInvoiceAL(DocNo: Text);

    procedure PassInvoiceDataToJs(SalesInv: JsonObject);
}