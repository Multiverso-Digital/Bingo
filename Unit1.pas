unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, AdvGrid, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    resul: TAdvStringGrid;
    Button1: TButton;
    Button2: TButton;
    RESU: TAdvStringGrid;
    procedure resulGetAlignment(Sender: TObject; ARow,
      ACol: Integer; var AAlignment: TAlignment);
    procedure resulGetCellColor(Sender: TObject; ARow,
      ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure RESUGetCellColor(Sender: TObject; ARow, ACol: Integer;
      AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
  private
    { Private declarations }
  public
  gerado: array[1..5] of integer;
  Bitis : Tbits;
  sorteado: Tbits;
  sortLin : array[1..75] of integer;
  sortCol : array[1..75] of integer;
  cartLin : array[1..75] of integer;
  cartCol : array[1..75] of integer;

    { Public declarations }
  end;

var
  Form1: TForm1;
  nume : array[1..15] of integer;
  coluna, linha : integer;
implementation

{$R *.DFM}


function MinInteger(const A:array of Integer):Integer;
var
i:integer;
begin
Result:=A[Low(A)];
for i:=Low(A)+1 to High(A) do if A[i]<Result then Result:=A[I];
end;

function MaxInteger(const A:array of integer):Integer;
var
i:integer;
begin
Result:=A[Low(A)];
for i:=Low(A)+1 to High(A) do if A[i]>Result then Result:=A[I];
end;


function sorteio:integer;
var
num,K,J : integer;
begin
K:=0;
result := 0;
repeat
randomize;
J := random(75)+1;
IF Not form1.sorteado.bits[J] then
   Begin
   form1.sorteado.bits[J] := true;
   K:=1;
   end;
until K=1;
Result := J;
end;


function joga(H:integer):boolean;
var
J, K, gerou,I : integer;
tem : boolean;
Begin
tem := false;
J:=0;
repeat
 randomize;
 gerou := random(15);
 gerou := (gerou + 1)+(15*(H-1));
 For K:=1 to 5 do
 Begin
  IF form1.gerado[K] = (gerou) then
  Begin
  tem := true;
  end;
 end;
 IF Not tem  then
 Begin
 J:=J+1;
 form1.gerado[J] := gerou;
 form1.bitis.bits[gerou] := true;
 end
 else
 begin
 tem := false;
 end;

 sleep(5);

until J = 5;

K:=0;
For I:=1 to 75 do
Begin
  IF form1.bitis.bits[I] then
     Begin
     K:=K+1;
     form1.gerado[K] := I;
     form1.bitis.bits[I] := false;
     end;
end;
Result := true;

end;

procedure TForm1.resulGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var AAlignment: TAlignment);
begin
 AAlignment := tacenter;
end;

procedure TForm1.resulGetCellColor(Sender: TObject; ARow,
  ACol: Integer; AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
begin
IF arow = 0 then
   Begin
   afont.Color := clyellow;
   end;

if (acol=2) and (arow = 3) then  ABrush.Color := clgreen;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
Lin, colu, placar,I : integer;
begin

linha := -1;
coluna:= -1;

For I:=1 to 75 do
Begin
sortcol[I] := -1;
sortlin[I] := -1;
cartcol[I] := -1;
cartlin[I] := -1;
end;

bitis := Tbits.create;
bitis.Size := 80;
sorteado := Tbits.create;
sorteado.size := 76;

for Lin:=0 to 4 do
Begin
  For Colu:=1 to 15 do
  Begin
   placar :=  colu+((lin*15));
   Resu.cells[colu,lin] := inttostr(colu+((lin*15)));
   sortCol[placar] := colu;
   sortLin[placar] := lin;
  end;


end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
I,K : integer;
begin

For I:=1 to 75 do
Begin
sorteado.bits[I] := false;
end;

resu.Refresh; 





     For K:=1 to 5 do
     begin

     Joga(K);

     For I:=1 to 5 do
        Begin
        resul.cells[K-1,I] := inttostr(gerado[I]);
        cartcol[gerado[I]] := k-1;
        cartlin[gerado[I]] := I;
        resul.cells[2,3] := '';
        gerado[I]:=0;
        end;


     end;

end;




procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
bitis.free;

sorteado.free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
num,I : integer;
begin





For I:=1 to 75 do
Begin
sorteado.bits[I] := false;
end;



I:=0;
repeat
num :=sorteio;
IF sorteado.bits[num] then
   Begin
    if (sortcol[num] <> -1) and (sortlin[num] <> -1)  then
    begin
    resu.col := sortcol[num];
    resu.row := sortlin[num];
    coluna   := sortcol[num];
    linha    := sortlin[num];
    resu.refresh;

    sleep(100);
    I:=I+1;
    end;
   end;
until I=25;
end;

procedure TForm1.RESUGetCellColor(Sender: TObject; ARow, ACol: Integer;
  AState: TGridDrawState; ABrush: TBrush; AFont: TFont);
var
i : integer;
begin

{IF acol = 0 then
   Begin
   afont.Color := clyellow;
   exit;
   end;   }


IF (linha = arow) and (coluna = acol) then
   Begin
   arow := linha;
   acol := coluna;
   abrush.Color := clred;
   end;

{
For I:=1 to 75 do
Begin
IF sorteado.bits[I] then
  Begin
   arow := sortlin[I];
   acol := sortcol[I];
   abrush.Color := clred;
  end
  else
  begin
    arow := sortlin[I];
    acol := sortcol[I];
    abrush.Color := clyellow;
  end;
end; }







end;

end.
