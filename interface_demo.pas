program interface_demo;
{$mode objfpc}{$h+}
{$Interfaces corba}

type
    TMyButton = Class(Tobject) //let us assume we cant modify this
    end;

    TMyJacket = Class(Tobject) //let us assume we cant modify this
    end;

    IMyInterface = interface
        procedure Move;
    end;

    TMyButton1 = class(TMyButton, IMyInterface)
    public
        procedure Move;
    end;

    TMyJacket1 = class(TMyJacket, IMyInterface)
    public
        procedure Move;
    end;

procedure DoSomthing(AMyInterface: IMyInterface);
begin
    AMyInterface.Move;
end;

procedure TMyButton1.move;
begin
end;

procedure TMyJacket1.Move;
begin
end;

begin
end.
