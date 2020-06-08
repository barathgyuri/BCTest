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
            usercontrol("Last posted customer"; "Last customer")
            {
                ApplicationArea = All;

                trigger Ready()
                begin
                end;

                trigger getLastCustomer()
                var
                    SalesInvHdr: Record "Sales Invoice Header";
                    Customer: Record Customer;
                    SalesInvJs: JsonObject;
                begin
                    if SalesInvHdr.FindLast() then begin
                        Customer.Get(SalesInvHdr."Bill-to Customer No.");
                        SalesInvJs.Add('CustName', Customer.Name);
                        SalesInvJs.Add('DocNo', SalesInvHdr."No.");
                        SalesInvHdr.CalcFields(Amount, "Amount Including VAT");
                        SalesInvJs.Add('Amount', SalesInvHdr.Amount);
                        SalesInvJs.Add('VATAmount', SalesInvHdr."Amount Including VAT" - SalesInvHdr.Amount);
                        SalesInvJs.Add('AmtIncVAT', SalesInvHdr."Amount Including VAT");
                        CurrPage."Last posted customer".PassInvoiceDataToJs(SalesInvJs);
                    end;
                end;

                trigger PrintInvoiceAL(DocNo: Text)
                var
                    SalesInv: Record "Sales Invoice Header";
                begin
                    SalesInv.SetRange("No.", DocNo);
                    SalesInv.Get(DocNo);
                    Report.Run(Report::"Sales - Invoice GB", true, true, SalesInv);
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