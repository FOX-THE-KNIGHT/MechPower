unit Auth;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  procedure ShowAbout(Handle: THandle);export;stdcall;
implementation

{$R *.dfm}
procedure ShowAbout(Handle: THandle);
 begin
  Application.Handle := Handle;
  Form1 :=  TForm1.Create(Application);
  Form1.ShowModal;
  Form1.Free ;
end;

end.
