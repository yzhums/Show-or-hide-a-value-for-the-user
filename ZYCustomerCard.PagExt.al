pageextension 50126 ZYCustomerCard extends "Customer Card"
{
    layout
    {
        modify("Credit Limit (LCY)")
        {
            HideValue = IsPermissionToView;
        }

        modify(TotalSales2)
        {
            HideValue = IsPermissionToView;
        }

        modify("Balance (LCY)")
        {
            HideValue = IsPermissionToView;
        }

        modify("Balance Due (LCY)")
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