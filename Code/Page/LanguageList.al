page 50100 LanguagesPRV
{
    Caption = 'Idiomas PRV';
    PageType = List;
    SourceTable = LanguagePRV;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field(Code;Code)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the code for a language.',
                                ESP='Especifica el código para un idioma.';
                }
                field(Name;Name)
                {
                    ApplicationArea = Basic,Suite;
                    ToolTipML = ENU='Specifies the name of the language.',
                                ESP='Especifica el nombre del idioma.';
                }
                field("Windows Language ID";"Windows Language ID")
                {
                    ApplicationArea = Basic,Suite;
                    LookupPageID = "Windows Languages";
                    ToolTipML = ENU='Specifies the ID of the Windows language associated with the language code you have set up in this line.',
                                ESP='Especifica el id. del idioma de Windows asociado con el código de idioma que se ha configurado en esta línea.';
                }
                field("Windows Language Name";"Windows Language Name")
                {
                    ApplicationArea = Basic,Suite;
                    DrillDown = false;
                    ToolTipML = ENU='Specifies if you enter an ID in the Windows Language ID field.',
                                ESP='Especifica si se introduce un id. en el campo de Id. idioma Windows.';
                }
            }
        }
        area(factboxes)
        {
            systempart(RecordLinks;Links)
            {
                Visible = false;
            }
            systempart(Notes;Notes)
            {
                Visible = false;
            }
        }
    }

    actions
    {
    }
}