pageextension 50100 VendorCardMyAction extends "Vendor Card"
{
    actions {
        addlast("Ven&dor"){
            action("MyTest") {
                Caption = 'Action Vendor';
                ApplicationArea=all;
                trigger OnAction()
                begin
                    Message('Lanzo Action MyTest Vendor');                    
                end;
            }
        }
    }
}