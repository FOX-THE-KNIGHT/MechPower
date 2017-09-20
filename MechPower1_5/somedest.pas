unit somedest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, jpeg;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  procedure ShowThis(Handle:THandle);export;stdcall;
implementation

{$R *.dfm}
procedure ShowThis(Handle:THandle);
begin
Application.Handle:=Handle;
Form1.Create(Application);

end;
procedure TForm1.Timer1Timer(Sender: TObject);
begin
Close;
Form1.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Form1.ShowModal;
end;

end.
