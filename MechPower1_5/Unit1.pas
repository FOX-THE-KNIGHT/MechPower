unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Unit2,Unit3, ExtCtrls, StdCtrls, ComCtrls, TeEngine, Series, TeeProcs,
  Chart, Menus;
procedure ShowAbout(Handle: THandle)stdcall;
type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    GroupBox4: TGroupBox;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Timer1: TTimer;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TLineSeries;
    Chart3: TChart;
    Series3: TLineSeries;
    Chart4: TChart;
    Chart5: TChart;
    Chart6: TChart;
    Series4: TLineSeries;
    Series5: TLineSeries;
    Series6: TLineSeries;
    Chart7: TChart;
    Chart8: TChart;
    Chart9: TChart;
    Series7: TLineSeries;
    Series8: TLineSeries;
    Series9: TLineSeries;
    Edit14: TEdit;
    Label14: TLabel;
    Edit15: TEdit;
    Label15: TLabel;
    Button3: TButton;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    Simulate1: TMenuItem;
    ShowTable1: TMenuItem;
    Authors1: TMenuItem;
    Exit1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Authors1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ShowTable1Click(Sender: TObject);
    procedure Simulate1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  System:TSystema;
  sima:integer;
  bima:integer;
  procedure ShowAbout; external 'AboutAuthor.DLL' index 10;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
 System:= TSystema.Create(Self);
 System.Parent:=Panel1;
 Timer1.Enabled:=False;
 
end;

procedure TForm1.Button1Click(Sender: TObject);
var i,j,k: integer;
begin
sima:=0;
try
  bima:=StrToInt(Edit13.Text)*1000;
  System.Tn:= StrToFloat(Edit13.Text);
  System.dt:= StrToFloat(Edit12.Text);
  System.RobotX:=StrToInt(Edit1.Text);
  System.RobotY:=StrToInt(Edit2.Text);
  System.K1:=StrToFloat(Edit4.Text);
  System.K2:=StrToFloat(Edit5.Text);
  System.RLen:=StrToInt(Edit6.Text);
  System.RFiMin:=StrToFloat(Edit7.Text);
  System.RFiMax:=StrToFloat(Edit8.Text);
  System.SLen:=StrToInt(Edit9.Text);
  System.SFiMin:=StrToFloat(Edit10.Text);
  System.SFiMax:=StrToFloat(Edit11.Text);
  System.SMax:=StrToInt(Edit3.Text);
  System.S1:= StrToFloat(Edit14.Text);
  System.RFiAcel:= StrToFloat(Edit15.Text);
  Timer1.Interval:= StrToInt(Edit12.Text);
  Timer1.Enabled:=True;
  System.StartSystem;
 except
 ShowMessage('Attention, the parameters of system are invalid!');
 end;
  Series1.Clear;
   Series2.Clear;
   Series3.Clear;
   Series4.Clear;
   Series5.Clear;
   Series6.Clear;
   Series7.Clear;
   Series8.Clear;
   Series9.Clear;
  for j:= 1 to 2 do
   for i:=0 to round(System.First.Tn)*100 do
   begin
     Series3.AddXY(i/100/System.First.Tn,System.First.XLaw(i/100));
      Form3.StringGrid9.Cells[j,i]:= FloatToStr(System.First.XLaw(i/100));
   end;
     for j:= 1 to 2 do
      for i:=0 to round(System.First.Tn)*100 do
    begin
     Series2.AddXY(i/100/System.First.Tn,System.First.vLaw(i/100));
     Form3.StringGrid8.Cells[j,i]:= FloatToStr(System.First.vLaw(i/100));
     end;
     for j:= 1 to 2 do
       for i:=0 to round(System.First.Tn)*100 do
begin
     Series1.AddXY(i/100/System.First.Tn,System.First.aLaw(i/100));
     Form3.StringGrid7.Cells[j,i]:= FloatToStr(System.First.aLaw(i/100));
     end;
   for j:= 1 to 2 do
    for i:=0 to round(System.Second.Tn)*100 do
    begin
    Series6.AddXY(i/100/System.Second.Tn,System.Second.RotateLow(i/100));
    Form3.StringGrid6.Cells[j,i]:= FloatToStr(System.Second.RotateLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Second.Tn)*100 do
begin
    Series5.AddXY(i/100/System.Second.Tn,abs(System.Second.vLow(i/100)));
    Form3.StringGrid5.Cells[j,i]:= FloatToStr(System.Second.vLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Second.Tn)*100 do
     begin
    Series4.AddXY(i/100/System.Second.Tn,System.Second.aLow(i/100));
    Form3.StringGrid4.Cells[j,i]:= FloatToStr(System.Second.aLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Third.Tn)*100 do
     begin
    Series9.AddXY(i/100/System.Third.Tn,abs(System.Third.SRotateLow(i/100)));
    Form3.StringGrid3.Cells[j,i]:= FloatToStr(System.Third.SRotateLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Third.Tn)*100 do
      begin
    Series8.AddXY(i/100/System.Third.Tn,abs(System.Third.SvLow(i/100)));
    Form3.StringGrid2.Cells[j,i]:= FloatToStr(System.Third.SvLow(i/100));

    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Third.Tn)*100 do
      begin
    Series7.AddXY(i/100/System.Third.Tn,System.Third.SaLow(i/100));
    Form3.StringGrid1.Cells[j,i]:= FloatToStr(System.Third.SaLow(i/100));

    end;


end;

procedure TForm1.Button2Click(Sender: TObject);
begin
System.StopSystem;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  sima:= sima+Timer1.Interval;
  if sima=bima then System.StopSystem;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
Form3.Showmodal;
end;

procedure TForm1.Authors1Click(Sender: TObject);
begin
ShowAbout(Handle);
end;

procedure TForm1.Exit1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.ShowTable1Click(Sender: TObject);
begin
 Form3.Showmodal;
end;

procedure TForm1.Simulate1Click(Sender: TObject);
var i,j,k: integer;
begin
sima:=0;
try
  bima:=StrToInt(Edit13.Text)*1000;
  System.Tn:= StrToFloat(Edit13.Text);
  System.dt:= StrToFloat(Edit12.Text);
  System.RobotX:=StrToInt(Edit1.Text);
  System.RobotY:=StrToInt(Edit2.Text);
  System.K1:=StrToFloat(Edit4.Text);
  System.K2:=StrToFloat(Edit5.Text);
  System.RLen:=StrToInt(Edit6.Text);
  System.RFiMin:=StrToFloat(Edit7.Text);
  System.RFiMax:=StrToFloat(Edit8.Text);
  System.SLen:=StrToInt(Edit9.Text);
  System.SFiMin:=StrToFloat(Edit10.Text);
  System.SFiMax:=StrToFloat(Edit11.Text);
  System.SMax:=StrToInt(Edit3.Text);
  System.S1:= StrToFloat(Edit14.Text);
  System.RFiAcel:= StrToFloat(Edit15.Text);
  Timer1.Interval:= StrToInt(Edit12.Text);
  Timer1.Enabled:=True;
  System.StartSystem;
 except
 ShowMessage('Attention, the parameters of system are invalid!');
 end;
  Series1.Clear;
   Series2.Clear;
   Series3.Clear;
   Series4.Clear;
   Series5.Clear;
   Series6.Clear;
   Series7.Clear;
   Series8.Clear;
   Series9.Clear;
  for j:= 1 to 2 do
   for i:=0 to round(System.First.Tn)*100 do
   begin
     Series3.AddXY(i/100/System.First.Tn,System.First.XLaw(i/100));
      Form3.StringGrid9.Cells[j,i]:= FloatToStr(System.First.XLaw(i/100));
   end;
     for j:= 1 to 2 do
      for i:=0 to round(System.First.Tn)*100 do
    begin
     Series2.AddXY(i/100/System.First.Tn,System.First.vLaw(i/100));
     Form3.StringGrid8.Cells[j,i]:= FloatToStr(System.First.vLaw(i/100));
     end;
     for j:= 1 to 2 do
      for i:=0 to round(System.First.Tn)*100 do
begin
     Series1.AddXY(i/100/System.First.Tn,System.First.aLaw(i/100));
     Form3.StringGrid7.Cells[j,i]:= FloatToStr(System.First.aLaw(i/100));
     end;
   for j:= 1 to 2 do
    for i:=0 to round(System.Second.Tn)*100 do
    begin
    Series6.AddXY(i/100/System.Second.Tn,System.Second.RotateLow(i/100));
    Form3.StringGrid6.Cells[j,i]:= FloatToStr(System.Second.RotateLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Second.Tn)*100 do
begin
    Series5.AddXY(i/100/System.Second.Tn,abs(System.Second.vLow(i/100)));
    Form3.StringGrid5.Cells[j,i]:= FloatToStr(System.Second.vLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Second.Tn)*100 do
     begin
    Series4.AddXY(i/100/System.Second.Tn,System.Second.aLow(i/100));
    Form3.StringGrid4.Cells[j,i]:= FloatToStr(System.Second.aLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Third.Tn)*100 do
     begin
    Series9.AddXY(i/100/System.Third.Tn,abs(System.Third.SRotateLow(i/100)));
    Form3.StringGrid3.Cells[j,i]:= FloatToStr(System.Third.SRotateLow(i/100));
    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Third.Tn)*100 do
      begin
    Series8.AddXY(i/100/System.Third.Tn,abs(System.Third.SvLow(i/100)));
    Form3.StringGrid2.Cells[j,i]:= FloatToStr(System.Third.SvLow(i/100));

    end;
    for j:= 1 to 2 do
     for i:=0 to round(System.Third.Tn)*100 do
      begin
    Series7.AddXY(i/100/System.Third.Tn,System.Third.SaLow(i/100));
    Form3.StringGrid1.Cells[j,i]:= FloatToStr(System.Third.SaLow(i/100));

    end;


end;

end.
