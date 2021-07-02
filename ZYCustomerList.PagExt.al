pageextension 50125 ZYCustomerList extends "Customer List"
{
    layout
    {
        modify("Balance (LCY)")
        {
            HideValue = IsPermissionToView;
        }

        modify("Balance Due (LCY)")
        {
            HideValue = IsPermissionToView;
        }

        modify("Sales (LCY)")
        {
            HideValue = IsPermissionToView;
        }

        modify("Payments (LCY)")
        {
            HideValue = IsPermissionToView;
        }
    }

    trigger OnOpenPage()
    begin
        IsPermissionToView := false;
        IsPermissionToView := IsHavePermissionToView();
    end;

    var
        [InDataSet]
        IsPermissionToView: Boolean;

    local procedure IsHavePermissionToView(): Boolean
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Allow View Financial Data" then
                exit(false)
            else
                exit(true);
        end else begin
            exit(true);
        end;
    end;
}