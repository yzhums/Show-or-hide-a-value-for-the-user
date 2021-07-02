tableextension 50113 ZYUserSetupExt extends "User Setup"
{
    fields
    {
        field(50100; "Allow View Financial Data"; Boolean)
        {
            Caption = 'Allow View Financial Data';
            DataClassification = CustomerContent;
        }
    }
}

pageextension 50113 ZYUserSetupPageExt extends "User Setup"
{
    layout
    {
        addafter("Allow Posting To")
        {
            field("Allow View Financial Data"; Rec."Allow View Financial Data")
            {
                ApplicationArea = All;
            }
        }
    }
}