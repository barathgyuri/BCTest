page 50100 "Proj1 Main"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Project 1 Main Page';

    layout
    {
        area(Content)
        {
            usercontrol("Get Last Invoice"; "Get Last Invoice")
            {
                ApplicationArea = All;

                trigger Ready()
                begin

                end;

                trigger GetLastInvoice()
                var
                    SalesInvHead: Record "Sales Invoice Header";
                    SalesInv: JsonObject;
                    Customer: Record Customer;
                begin
                    if SalesInvHead.FindLast() then begin
                        Customer.Get(SalesInvHead."Bill-to Customer No.");
                        SalesInv.Add('CustName', Customer.Name);
                        SalesInv.Add('DocNo', SalesInvHead."No.");
                        SalesInvHead.CalcFields(Amount, "Amount Including VAT");
                        SalesInv.Add('Amount', SalesInvHead.Amount);
                        SalesInv.Add('VATAmount', SalesInvHead."Amount Including VAT" - SalesInvHead.Amount);
                        SalesInv.Add('AmtInclVAT', SalesInvHead."Amount Including VAT");
                        CurrPage."Get Last Invoice".PassInvoiceDataToJs(SalesInv);
                    end;
                end;

                trigger PrintSalesInvoice(DocNo: Text)
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader.SetRange("No.", DocNo);
                    SalesInvHeader.Get(DocNo);
                    Report.Run(Report::"Sales - Invoice GB", true, true, SalesInvHeader);
                end;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            // action(ActionName)
            // {
            //     ApplicationArea = All;

            //     trigger OnAction()
            //     begin

            //     end;
            // }
        }
    }

    var
        myInt: Integer;
}