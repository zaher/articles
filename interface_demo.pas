program metclass;
{$mode objfpc}{$h+}

type
    TMyButton = Class(Tobject)
    end;

    TMyButtonClass = class of TMyButton;

    TMyButton1 = class(TMyButton)
    end;

    TMyButton2 = class(TMyButton)
    end;

var
    AButtonClass: TMyButtonClass = nil;

function CreateButton(ButtonClass: TMyButtonClass): TMyButton;
begin
    Result := ButtonClass.Create;
end;

begin
    //by function
    CreateButton(TMyButton1);

    //by variable
    AButtonClass := TMyButton2; //set the class

    AButtonClass.Create; //create it from variable

end.
