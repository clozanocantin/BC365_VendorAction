table 50100 LanguagePRV
{
    CaptionML = ENU='Language',
                ESP='Idioma';
    LookupPageID = 9;

    fields
    {
        field(1;"Code";Code[10])
        {
            CaptionML = ENU='Code',
                        ESP='Código';
            NotBlank = true;
        }
        field(2;Name;Text[50])
        {
            CaptionML = ENU='Name',
                        ESP='Nombre';
        }
        field(6;"Windows Language ID";Integer)
        {
            BlankZero = true;
            CaptionML = ENU='Windows Language ID',
                        ESP='ID Idioma Windows';
            TableRelation = "Windows Language";

            trigger OnValidate();
            begin
                CALCFIELDS("Windows Language Name");
            end;
        }
        field(7;"Windows Language Name";Text[80])
        {
            CalcFormula = lookup("Windows Language".Name where ("Language ID" = field("Windows Language ID")));
            CaptionML = ENU = 'Windows Language Name',ESP='Nombre idioma Windows';
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(Brick;Name)
        {
        }
    }

    [Scope('Personalization')]
    procedure GetUserLanguage() : Code[10];
    var
        UserLanguageId : Integer;
        Handled : Boolean;
    begin
        OnGetUserLanguageId(UserLanguageId,Handled);

        IF NOT Handled THEN
          UserLanguageId := GLOBALLANGUAGE;

        EXIT(GetLanguageCode(UserLanguageId));
    end;

    [Scope('Personalization')]
    procedure GetLanguageID(LanguageCode : Code[10]) : Integer;
    begin
        CLEAR(Rec);
        IF LanguageCode <> '' THEN
          IF GET(LanguageCode) THEN
            EXIT("Windows Language ID");
        "Windows Language ID" := GLOBALLANGUAGE;
        EXIT("Windows Language ID");
    end;

    [Scope('Personalization')]
    procedure GetUserSelectedLanguageId() : Integer;
    var
        UserPersonalization : Record "User Personalization";
        BlankGuid : Guid;
        LanguageId : Integer;
    begin
        UserPersonalization.SETRANGE("User ID",USERID);
        IF NOT UserPersonalization.FINDFIRST THEN BEGIN
          UserPersonalization.SETRANGE("User ID",BlankGuid);
          IF NOT UserPersonalization.FINDFIRST THEN;
        END;

        LanguageId := UserPersonalization."Language ID";
        IF LanguageId = 0 THEN
          LanguageId := GLOBALLANGUAGE;

        EXIT(LanguageId);
    end;

    local procedure GetLanguageCode(LanguageId : Integer) : Code[10];
    begin
        CLEAR(Rec);
        SETRANGE("Windows Language ID",LanguageId);
        IF FINDFIRST THEN;
        SETRANGE("Windows Language ID");
        EXIT(Code);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnGetUserLanguageId(var UserLanguageId : Integer;var Handled : Boolean);
    begin
    end;
}