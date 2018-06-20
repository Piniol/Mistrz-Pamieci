unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, INIFiles,
  StdCtrls, Grids, Aligrid;

type
  TForm3 = class(TForm)
    Grid1: TStringAlignGrid;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.DFM}

procedure TForm3.FormShow(Sender: TObject);
var I,J: Byte;
begin
Button2.SetFocus;
Grid1.ColWidths[0]:=20;
Grid1.ColWidths[1]:=99;
Grid1.ColWidths[2]:=50;
Grid1.ColWidths[3]:=60;
Grid1.Cells[1,0]:='Imiê Gracza';
Grid1.Cells[2,0]:='Punkty';
Grid1.Cells[3,0]:='Czas';
for I:=1 to 10 do
 for J:=1 to 10 do
  if Wynik2[I]<Wynik2[J] then begin
   Wynik1[0]:=Wynik1[i];
   Wynik1[i]:=Wynik1[j];
   Wynik1[j]:=Wynik1[0];
   Wynik2[0]:=Wynik2[i];
   Wynik2[i]:=Wynik2[j];
   Wynik2[j]:=Wynik2[0];
   Wynik3[0]:=Wynik3[i];
   Wynik3[i]:=Wynik3[j];
   Wynik3[j]:=Wynik3[0];
   end;
 for I:=1 to 10 do begin
 Grid1.Cells[1,I]:=Wynik1[I];
 Grid1.Cells[2,I]:=IntToStr(Wynik2[I]);
 Grid1.Cells[3,I]:=Wynik3[I];
 end;
 for I:=1 to 11 do
 Grid1.Cells[0,I]:=IntToStr(I)+'.';
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
Form3.Close;
end;

procedure TForm3.Button1Click(Sender: TObject);
var I: Byte;
    Plik: TINIFile;
    wynik:integer;
begin
wynik:=application.MessageBox('Czy na pewno chcesz usun¹æ wpisy?','Potwierdzenie',mb_YesNo+mb_iconquestion);
if wynik=6 then begin
 for I:=1 to 10 do begin
 Grid1.Cells[1,I]:='Piniol';
 Grid1.Cells[2,I]:=IntToStr(300);
 Grid1.Cells[3,I]:='06:00:00';
 Wynik1[I]:='Piniol';
 Wynik2[I]:=300;
 Wynik3[I]:='06:0:00';
 end;
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
end;
end;

end.
