program MechPower;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas',
  Unit3 in '..\MechPower2_1\Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Form4 := TForm4.Create(Application);
  Form4.Show;
  Form4.Update;
  while Form4.Timer1.Enabled do
    Application.ProcessMessages;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  //Application.CreateForm(TForm4, Form4);
  Form4.Hide;
  Form4.Free;
  Application.Run;
end.
