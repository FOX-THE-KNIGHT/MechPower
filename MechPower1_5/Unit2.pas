unit Unit2;

interface

uses Math, Graphics, Controls, ExtCtrls, Classes, Types, SysUtils;

type


 TFirst = class
 private
    FK1 :real;
    FK2: real;
    FPostHeight: integer;
    FY: integer;
    FX0: integer;
    FY0: integer;
    FX: integer;
    FWidth: integer;
    FHeight: integer;
    FTn: real;
    Fdt: real;
    FSMax: real;
    FColor: TColor;
    Ft: real;
    FS1: real;

    procedure SetPostHeight(const Value: integer);
    procedure Setcolor(const Value: TColor);
    procedure SetHeight(const Value: integer);
    procedure SetWidth(const Value: integer);
    procedure SetX(const Value: integer);
    procedure SetX0(const Value: integer);
    procedure SetY(const Value: integer);
    procedure SetY0(const Value: integer);
    procedure Sett(const Value: real);
 protected
    constructor Create;
    procedure Paint(Canvas:TCanvas); virtual;
    procedure Move; virtual;
 public

    property K1:real read FK1 write FK1;
    property K2: real read FK2 write FK2;
    property PostHeight:integer read FPostHeight write SetPostHeight;
    function XLaw(t:real):real;
    function vLaw(t:real):real;
    function aLaw(t:real):real;
    property Color:TColor read FColor write Setcolor;
    property X:integer read FX write SetX;
    property Y:integer read FY write SetY;
    property SMax:real read FSMax write FSMax;
    property S1: real read FS1 write FS1;
    property Tn:real read FTn write FTn;
    property t:real read Ft write Sett;
    property dt:real read Fdt write Fdt;
    property Width:integer read FWidth write SetWidth;
    property Height:integer read FHeight write SetHeight;
    property X0:integer read FX0 write SetX0;
    property Y0:integer read FY0 write SetY0;
 end;


 TSecond = class(TFirst)
 private
    FEndPoint: TPoint;
    FFiMin: real;
    FFiMax: real;
    FFiAcel: real;
    FK2: real;
    FLen: integer;
    FFi: real;

    procedure SetRFiMax(const Value: real);
    procedure SetRFiMin(const Value: real);

 protected

    constructor Create;
    procedure Paint(Canvas:TCanvas); override;
    procedure Move; override;
    procedure InitEndPoint; virtual;
 public
    function RotateLow(t:real):real;
    function vLow(t:real):real;
    function aLow(t:real):real;

    property K1;
    property K2;
    property REndPoint: TPoint read FEndPoint;
    property RFiMin: real read FFiMin write SetRFiMin;
    property RFiMax: real read FFiMax write SetRFiMax;
    property RFiAcel: real read FFiAcel write FFiAcel;
    property RFi: real read FFi;
    property RLen: integer read FLen write FLen;
    property Tn;
 end;


 TThird = class (TSecond)
 private

    FSLen: integer;
    FSFiMin: real;
    FSFi: real;
    FSFiMax: real;
    FSEndPoint: TPoint;


    procedure SetSFiMax(const Value: real);
    procedure SetSFiMin(const Value: real);
 protected
    constructor Create;
    procedure Paint(Canvas:TCanvas); override;
    procedure Move; override;
    procedure InitEndPoint; override;
 public
    function SRotateLow(t:real):real;
    function SvLow(t:real):real;
    function SaLow(t:real):real;

    property K1;
    property K2;
    property SEndPoint: TPoint read FSEndPoint;
    property SFiMin: real read FSFiMin write SetSFiMin;
    property SFiMax: real read FSFiMax write SetSFiMax;
    property SLen: integer read FSLen write FSLen;
    property SFi: real read FSFi;
    property Tn;

 end;



 TSystema = class (TGraphicControl)
  private
    FTimer: TTimer;
    FBitmap:TBitmap;
    Fdt: real;
    FTn: real;
    Ft: real;
    FFirst: TFirst;
    FSecond: TSecond;
    FThird: TThird;

    FSLen: integer;
    FRLen: integer;

    FRobotX: integer;
    FRobotY: integer;
    FK1: real;
    FK2: real;
    FRFiMax: real;
    FRFiMin: real;
    FRFiAcel: real;
    FSFiMin: real;
    FSFiMax: real;
    FSMax: integer;
    FS1: real;

    procedure Setdt(const Value: real);
    procedure Sett(const Value: real);
    procedure SetTn(const Value: real);
    procedure SetK1(const Value: real);
    procedure SetK2(const Value: real);

    procedure SetRLen(const Value: integer);
    procedure SetRFiMin(const Value: real);
    procedure SetRFiMax(const Value: real);
    procedure SetRFiAcel(const Value:real);
    procedure SetRobotX(const Value: integer);
    procedure SetRobotY(const Value: integer);
    procedure SetSFiMax(const Value: real);
    procedure SetSFiMin(const Value: real);
    procedure SetSLen(const Value: integer);
    procedure SetSmax(const Value: integer);
    procedure SetS1(const Value: real);
  protected

    procedure Init;
    procedure Paint; override;
    procedure TimerEvent(Sender:TObject);
  public
    constructor Create(AOwner:TComponent); override;
    destructor Destroy; override;

    procedure StartSystem;
    procedure StopSystem;
    property Tn:real read FTn write SetTn;
    property t:real read Ft write Sett;
    property dt:real read Fdt write Setdt;
    property First: TFirst read FFirst write FFirst;
    property Second: TSecond read FSecond write FSecond;
    property Third:  TThird read FThird write FThird;
    property K1: real read FK1 write SetK1;
    property K2: real read FK2 write SetK2;
    property RobotX: integer read FRobotX write SetRobotX;
    property RobotY: integer read FRobotY write SetRobotY;
    property RLen  : integer read  FRLen write SetRLen;
    property RFiMin: real read FRFiMin write SetRFiMin;
    property RFiMax: real read FRFiMax write SetRFiMax;
    property RFiAcel: real read FRFiAcel write SetRFiAcel;
    property SLen  : integer read FSLen write SetSLen;
    property SFiMin: real read FSFiMin  write SetSFiMin;
    property SFiMax: real read FSFiMax write SetSFiMax;

    property SMax: integer read FSMax write SetSmax;
    property S1: real read FS1 write SetS1;
  end;

implementation


{ TFirst }


function TFirst.aLaw(t: real): real;
var
 _t:real;
 a2:real;
begin
  _t:=frac(t/Tn);
 a2:= 2*S1/((k1*Tn*Tn*(1-k2)));
  if _t<=k1 then
    result:=2*S1/((k1*Tn)*(k1*Tn))
  else  if (k1<_t) and (_t<k2) then
    result:=0
  else if (k2<=_t) and (_t<1) then
   result:= -a2;
end;


constructor TFirst.Create;
begin

  FPostHeight:=30;
  FWidth:=60;
  FHeight:=20;
  FColor:=clgreen;
end;


procedure TFirst.Move;
begin
   FX:=FX0+round(XLaw(Ft));
end;


procedure TFirst.Paint(Canvas: TCanvas);
var
 Rec: TRect;
begin
     Canvas.Brush.Color := $003E3C3C;
     Canvas.Pen.Color:= clblack;
     Rec:=Rect(X,Y,X+FWidth,Y+FHeight);
     Canvas.Rectangle(Rec);

     Canvas.Pen.Width:=2;
     Canvas.MoveTo(X+Width div 4, Y);
     Canvas.LineTo(X+Width div 2, Y - FPostHeight);
     Canvas.LineTo(X+3*Width div 4, Y);
     Canvas.Pen.Width:=1;
end;


procedure TFirst.Setcolor(const Value: TColor);
begin
  FColor := Value;
end;

procedure TFirst.SetHeight(const Value: integer);
begin
  FHeight := Value;
end;


procedure TFirst.SetPostHeight(const Value: integer);
begin
  if (Value>=0) and (Value<>FPostHeight) then
   begin
    FPostHeight := Value;
   end;
end;

procedure TFirst.Sett(const Value: real);
begin
  Ft := Value;
end;

procedure TFirst.SetWidth(const Value: integer);
begin
  FWidth := Value;
end;

procedure TFirst.SetX(const Value: integer);
begin
  FX := Value;
end;

procedure TFirst.SetX0(const Value: integer);
begin
  FX0 := Value;
  FX:=Value;
end;

procedure TFirst.SetY(const Value: integer);
begin
  FY := Value;
end;

procedure TFirst.SetY0(const Value: integer);
begin
  FY0 := Value;
  FY:=Value;
end;


function TFirst.vLaw(t: real): real;
var
 _t:real;
  a2:real;
begin
  _t:=frac(t/Tn);
   a2:= 2*S1/((k1*Tn*Tn*(1-k2)));
  if _t<k1 then
    result:= (2*S1*_t*Tn)/((k1*Tn)*(k1*Tn))
  else if (k1<_t) and (_t<k2) then
    result:=2*S1/(k1*Tn)
  else if (k2<_t) and (_t<1) then
    result:= -a2*_t*Tn + a2*Tn;
end;


function TFirst.XLaw(t: real): real;
var
 _t:real;
 a2: real;
begin
  _t:=frac(t/Tn);
  a2:= 2*S1/((k1*Tn*Tn*(1-k2)));
    if _t<=k1 then
    result:= (S1*_t*_t*Tn*Tn)/((k1*Tn)*(k1*Tn))
    else if (k1<_t) and (_t<k2) then
    result:=S1*((2*_t*Tn/(k1*Tn)) - (2*k2/k1) +1 + ((2*(k2 - k1))/k1))
    else if (k2<_t) and (_t<1) then
    result:= -((a2*_t*_t*Tn*Tn)/2) + a2*_t*Tn*Tn + Smax - (a2*Tn*Tn/2);
end;


{ TSecond }

function TSecond.aLow(t: real): real;
var
 _t:real;
 _S1:real;
begin
   _S1:= (FFiMax-FFiMin)/(1+(2*k1*Tn*Tn*(k2-k1)/pi)+(4*k1*Tn*Tn)/pi);
  _t:=frac(t/Tn);
  if _t<k1 then
    result:= (-_S1*pi*pi/(4*(k1*Tn)*(k1*Tn)))*cos((pi*_t)/(2*k1)) else
  if (_t>=k1) and (_t<k2) then
    result:= 0 else
  if (_t>=k2) and (_t<1) then
    result:= -(-_S1*k1/(1-k2))*cos((pi*(1 - _t))/(2*(1 - k2)));
end;

constructor TSecond.Create;
begin
  FLen:=60;
  Color:=clRed;
end;

procedure TSecond.InitEndPoint;
begin
  FFi:=FFiMin + RotateLow(t);
  FEndPoint.X:= round(X + FLen*cos(FFi));
  FEndPoint.Y:= round(Y - FLen*sin(FFi));
end;

procedure TSecond.Move;
begin
  inherited;
  InitEndPoint;
end;

procedure TSecond.Paint(Canvas: TCanvas);
begin
  Canvas.Pen.Width:=2;
  Canvas.MoveTo(X,Y);
  Canvas.LineTo(FEndPoint.X, FEndPoint.Y);
  Canvas.Pen.Width:=1;
  Canvas.Ellipse(X-10,Y-10,X+10,Y+10);
end;

function TSecond.RotateLow(t: real): real;
var
 _t:real;
 _S1: real;
begin
  _t:=frac(t/Tn);
   _S1:= (FFiMax-FFiMin)/(1+(2*k1*Tn*Tn*(k2-k1)/pi)+(4*k1*Tn*Tn)/pi);
  if _t<k1 then
    result:= _S1*(1 - cos((pi*_t)/(2*k1))) else
  if (_t>=k1) and (_t<k2) then
    result:= ((2*_S1*k1*Tn/pi)*_t*Tn +1  + ((2*k1*Tn*Tn)/pi)*(k2-k1) - (2*k1*k2*Tn*Tn/pi)) else
  if (_t>=k2) and (_t<1) then
    result:= -((4*(_S1)*Tn*Tn/(pi*pi))*cos((pi*(1-_t))/(2*(1-k2))) + (FFiMax - FFiMin) - (4*Tn*Tn/(pi*pi)));
end;



procedure TSecond.SetRFiMax(const Value: real);
begin
    FFiMax := Value;
    InitEndPoint;
end;

procedure TSecond.SetRFiMin(const Value: real);
begin
    FFiMin := Value;
    InitEndPoint;
end;

function TSecond.vLow(t: real): real;
var
 _t:real;
 _S1: real;
begin
  _t:=frac(t/Tn);
   _S1:= (FFiMax-FFiMin)/(1+(2*k1*Tn*Tn*(k2-k1)/pi)+(4*k1*Tn*Tn)/pi);
  if _t<k1 then
    result:= (2*k1*Tn*_S1/pi)*sin((pi*_t)/(2*k1)) else
  if (k1<_t) and (_t<k2) then
    result:= (2*k1*Tn*_S1/pi) else
  if (k2<_t) and (_t<1) then
    result:= ((2*k1*Tn*_S1)/(pi))*sin((pi*(1-_t))/(2*(1-k2)));
end;

{ TThird }

constructor TThird.Create;
begin
  FSLen:=40;
  Color:=clRed;
end;

procedure TThird.InitEndPoint;
begin
  inherited;
  FSFi:=RFi+FSFiMin + SRotateLow(t);
  FSEndPoint.X:= round(REndPoint.X + FSLen*cos(FSFi));
  FSEndPoint.Y:= round(REndPoint.Y - FSLen*sin(FSFi));
end;

procedure TThird.Move;
begin
  inherited;
  InitEndPoint;
end;

procedure TThird.Paint(Canvas: TCanvas);

begin
   Canvas.Pen.Width:=2;
   Canvas.MoveTo(REndPoint.X,REndPoint.Y);
   Canvas.LineTo(REndPoint.X+round((FSLen-20)*cos(FSFi)), REndPoint.Y-round((FSLen-20)*sin(FSFi)));
   Canvas.MoveTo(REndPoint.X+round((FSLen-20)*cos(FSFi)), REndPoint.Y-round((FSLen-20)*sin(FSFi)));
   Canvas.LineTo(FSEndPoint.X + round(10*cos(FSFi+pi/2)), FSEndPoint.Y-round(10*sin(FSFi+pi/2)));
   Canvas.MoveTo(REndPoint.X+round((FSLen-20)*cos(FSFi)), REndPoint.Y-round((FSLen-20)*sin(FSFi)));
   Canvas.LineTo(FSEndPoint.X + round(10*cos(FSFi-pi/2)), FSEndPoint.Y-round(10*sin(FSFi-pi/2)));
   Canvas.Pen.Width:=1;
   Canvas.Ellipse(REndPoint.X-10,REndPoint.Y-10,REndPoint.X+10,REndPoint.Y+10);
end;

function TThird.SRotateLow(t: real): real;
var
 _t:real;
begin
  _t:=frac(t/Tn);
  result:=(FSFiMax-FSFiMin)*(_t - (1/(2*pi))*sin(2*pi*_t));
end;

procedure TThird.SetSFiMax(const Value: real);
begin
    FSFiMax := Value;
    InitEndPoint;
end;

procedure TThird.SetSFiMin(const Value: real);
begin
     FSFiMin := Value;
     InitEndPoint;
end;

function TThird.SaLow(t: real): real;
var
 _t:real;
begin
  _t:=frac(t/Tn);
  result:=2*pi*(2*(FSFiMax - FSFiMin)/(Tn*Tn))*sin(2*pi*_t);
end;

function TThird.SvLow(t: real): real;
var
 _t:real;
begin
  _t:=frac(t/Tn);
  result:=abs(((FSFiMax - FSFiMin)/Tn)*(1- cos(2*pi*_t)));
end;

{ TSystema }


constructor TSystema.Create(AOwner: TComponent);
begin
  inherited;
  ControlStyle:=ControlStyle+[csOpaque];
  Align:=alClient;

  FBitmap:=TBitmap.Create;
  FTimer:=TTimer.Create(Self);
  FTimer.Enabled:=false;
  FTimer.Interval:= 100;
  FTimer.OnTimer:=TimerEvent;


  FFirst:=TFirst.Create;
  FSecond:=TSecond.Create;
  FThird:=TThird.Create;


  Fdt:= 0.1;
  Ft:= 0;
  FK1    := 0.2;
  FK2    := 0.4;
  FRobotX:= 80;
  FRobotY:= 300;
  FSMax  := 300;
  FS1:= 100;
  FRLen  := 60;
  FRFiMin:= pi;
  FRFiMax:= -pi/18;
  FRFiAcel:= -pi/32;
  FSLen  := 50;
  FSFiMin:= pi/3;
  FSFiMax:= -pi/5;
  SetTn(12);
  Init;
end;


destructor TSystema.Destroy;
begin
  FFirst.Free;
  FSecond.Free;
  FThird.Free;
  FTimer.Free;
  FBitmap.Free;
  inherited;
end;


procedure TSystema.Init;
begin
   FFirst.X0:=FRobotX;
   FFirst.Y0:=FRobotY;
   FFirst.SMax:=FSmax;
   FFirst.S1:= FS1;
   FFirst.K1:=FK1;
   FFirst.K2:=FK2;
   FFirst.Color:=clGreen;

   FSecond.X0:=FFirst.X0 + FFirst.Width div 2;
   FSecond.Y0:=FFirst.Y0 - FFirst.PostHeight;
   FSecond.K1:=FK1;
   FSecond.K2:=FK2;
   FSecond.SMax:=FSmax;
   FSecond.S1:= FS1;
   FSecond.RFiMin:=FRFiMin;
   FSecond.RFiMax:=FRFiMax;
   FSecond.RLen:=FRLen;

   FThird.X0:=FFirst.X0 + FFirst.Width div 2;
   FThird.Y0:=FFirst.Y0 - FFirst.PostHeight;
   FThird.K1:=FK1;
   FThird.K2:=FK2;
   FThird.SMax:=FSMax;
   FThird.S1:= FS1;
   FThird.RLen:=FRLen;
   FThird.SLen:=FSLen;
   FThird.RFiMin:=FRFiMin;
   FThird.RFiMax:=FRFiMax;
   FThird.SFiMin:=FSFiMin;
   FThird.SFiMax:=FSFiMax;
   FThird.RFiAcel:= FRFiAcel;
end;

procedure TSystema.Paint;
begin
  FBitmap.Width:=Width;
  FBitmap.Height:=Height;

  FBitmap.Canvas.Brush.Color:=$00696565;
  FBitmap.Canvas.FillRect(Rect(0,0,Width,Height));

  FFirst.Paint(FBitmap.Canvas);
  FSecond.Paint(FBitmap.Canvas);
  FThird.Paint(FBitmap.Canvas);

  FBitmap.Canvas.MoveTo(0,FRobotY+20);
  FBitmap.Canvas.LineTo(Width, FRobotY+20);
  FBitmap.Canvas.Brush.Color:=clBlack;
  FBitmap.Canvas.Brush.Style:=bsDiagCross;
  FBitmap.Canvas.Brush.Style:=bsSolid;
  Canvas.Draw(0,0,FBitmap);
end;

procedure TSystema.Setdt(const Value: real);
begin
  Fdt := Value/1000;
  FTimer.Interval:=round(abs(Value));
end;

procedure TSystema.SetRFiMin(const Value: real);
begin
  FRFiMin := Value;
  Init;
  Invalidate;
end;


procedure TSystema.SetK1(const Value: real);
begin
  if (Value>0) and (Value<1) and (Value<FK2) and (Value<>FK1) then
   begin
    FK1 := Value;
    Init;
   end;
end;

procedure TSystema.SetK2(const Value: real);
begin
  if (Value>0) and (Value<1) and (Value>FK1) and (Value<>FK2) then
    begin
     FK2 := Value;
     Init;
    end;
end;

procedure TSystema.SetRLen(const Value: integer);
begin
  FRLen := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetRFiMax(const Value: real);
begin
  FRFiMax := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetRobotX(const Value: integer);
begin
  FRobotX := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetRobotY(const Value: integer);
begin
  FRobotY := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetSFiMax(const Value: real);
begin
  FSFiMax := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetSFiMin(const Value: real);
begin
  FSFiMin := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetSLen(const Value: integer);
begin
  FSLen := Value;
  Init;
  Invalidate;
end;

procedure TSystema.Sett(const Value: real);
var
  k:real;
begin
  Ft := Value;
  if ((frac(Ft/FTn)>=0.5) and (frac((Ft-Fdt)/FTn)<0.5))
  or ((frac(Ft/FTn)>=0) and (frac(Ft/Tn)<dt/Tn)) then
  begin
   FRobotX:= FFirst.X0+FSmax;
   FSMax  := -FSmax;
   FS1:= -FS1;
   k:=FRFiMin;
   FRFiMin:= FRFiMax;
   FRFiAcel:= -FRFiAcel;
   FRFiMax:= k;
   k:=FSFiMin;
   FSFiMin:= FSFiMax;
   FSFiMax:= k;
   Init;
  end;
  FFirst.t:=Ft;
  FSecond.t:=Ft;
  FThird.t:=Ft;
  FFirst.Move;
  FSecond.Move;
  FThird.Move;
  invalidate;
end;


procedure TSystema.SetTn(const Value: real);
begin
  FTn := Value;
  FFirst.Tn:=FTn/2;
  FSecond.Tn:=FTn/2;
  FThird.Tn:=FTn/2;
end;

procedure TSystema.StartSystem;
begin
  FTimer.Enabled:=true;
end;

procedure TSystema.StopSystem;
begin
  FTimer.Enabled:=false;
  Sett(0);
  Init;
  invalidate;
end;

procedure TSystema.TimerEvent(Sender: TObject);
begin
  Sett(Ft+Fdt);         
end;

procedure TSystema.SetSmax(const Value: integer);
begin
  FSMax := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetS1(const Value: real);
begin
  FS1 := Value;
  Init;
  Invalidate;
end;

procedure TSystema.SetRFiAcel(const Value: real);
begin
 FRFiAcel:= Value;
 Init;
 Invalidate;
end;

end.
 