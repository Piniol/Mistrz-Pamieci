unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, DFWEdites, INIFiles;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TDFWLightEdites;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;

{$R *.DFM}

procedure TForm2.Button1Click(Sender: TObject);
var I: Byte;
    Plik: TINIFile;
begin
Wynik1[10]:=Edit1.Text;
Wynik2[10]:=Punkty;
Wynik3[10]:=Form1.Label2.Caption;
try
Plik:=TINIFile.Create(ExtractFilePath(ParamStr(0))+'ustawienia');
for I:=1 to 10 do begin
Plik.WriteString('WYNIKI',IntToStr(I),Wynik1[I]);
Plik.WriteInteger('WYNIKI',IntToStr(I)+'a',Wynik2[I]);
Plik.WriteString('WYNIKI',IntToStr(I)+'b',Wynik3[I]);
end;
finally
Plik.Free;
end;
Form2.Close;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
Edit1.setfocus;
Edit1.SelStart:=0;
Edit1.SelLength:=12;
end;

procedure TForm2.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_Return then
Button1Click(Sender);
end;

end.
