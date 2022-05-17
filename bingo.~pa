unit bingo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, AdvGrid, StdCtrls, ExtCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PaintBox1: TPaintBox;
    PaintBox2: TPaintBox;
    PaintBox3: TPaintBox;
    Timer1: TTimer;
    PaintBox4: TPaintBox;
    StatusBar1: TStatusBar;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Button5: TButton;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
  procedure poeplacar;
  procedure pintanum(num:integer);
  procedure pintacartelanum(num:integer);
  procedure pintacartela;
  procedure pintacoluna;
  procedure piscalinha(num:integer);
  procedure piscalinhavolta(num:integer);
    { Private declarations }
  public
  gerado: array[1..5] of integer;
  Bitis : Tbits;
  sorteado: Tbits;
  cartela : Tbits;
  sortLin : array[1..75] of integer;
  sortCol : array[1..75] of integer;

  cartLin : array[1..75] of integer;
  cartCol : array[1..75] of integer;

    { Public declarations }
  end;

var
  Form1: TForm1;
  nume : array[1..15] of integer;
  coluna, linha, ganhou, jogou : integer;
  deucol : array[1..5] of integer;
  deulin : array[1..5] of integer;
  Colnum : array[1..75]of integer;
  Linnum : array[1..75]of integer;
  automa , deu : boolean;
  total, venceu, perdeu : integer;
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



procedure tform1.pintanum(num:integer);
var
coluna, linha : integer;
begin
 coluna := cartcol[num];
 linha  := cartlin[num];
 paintbox1.Canvas.Brush.Color:=clblack;
 paintbox1.Canvas.Font.Size := 16;
 paintbox1.Canvas.Font.Style := [fsbold];
 paintbox1.canvas.font.color := clred;
 paintbox1.Canvas.Rectangle(Coluna, Linha ,(Coluna+33), (Linha+33));
 paintbox1.canvas.TextOut((Coluna+5),(linha+5),inttostr(num));
end;


procedure tform1.pintacartelanum(num:integer);
var
coluna, linha : integer;
begin
 coluna := sortcol[num];
 linha  := sortlin[num];
 paintbox2.Canvas.Brush.Color:=clblack;
 paintbox2.Canvas.Font.Size := 16;
 paintbox2.Canvas.Font.Style := [fsbold];
 paintbox2.canvas.font.color := clred;
 paintbox2.Canvas.Rectangle(Coluna, Linha ,(Coluna+33), (Linha+33));
 paintbox2.canvas.TextOut((Coluna+5),(linha+5),inttostr(num));

 Deulin[(linnum[num]-1)] := Deulin[(linnum[num]-1)] + 1;
 Deucol[colnum[num]] := Deucol[colnum[num]] + 1;

 IF  Deulin[(linnum[num]-1)] = 5 then
     Begin
     timer1.interval := 50;
     timer1.enabled := true;
     end;
{
 IF  Deucol[(colnum[num]] = 4 then
     Begin
     piscacoluna(colnum[num]);
     end;  }




end;


procedure tform1.pintacoluna;
var
I : integer;
R: TRect;
begin
For I:=1 to 6 do
Begin
 paintbox3.Canvas.Pen.Width := 1;
 paintbox3.Canvas.Pen.Style := psSolid;
 paintbox3.Canvas.Brush.Color:=clwhite;
 paintbox3.Canvas.Pen.Color:= clwhite;
 IF I<> 1 then
 paintbox3.Canvas.Rectangle(1, I*34 ,1+33, (I*34)+33);


{paintbox3.Canvas.Brush.Color := clred;
{paintbox3.canvas.Pie(R.Left, R.Top, R.Right, R.Bottom, R.Right, R.Top, R.Left, R.Top); }

{paintbox3.Canvas.arc(R.Left, R.Top, R.Right, R.Bottom, R.Right, R.Top, R.Left, R.Top);}

 {if I <> 1 then
 paintbox3.canvas.pie(1,I*34,1+33,((I*34)+33), I*34,1,I*34,34);   }

end;
end;


procedure tform1.piscalinha(num:integer);
var
I : integer;
begin
I:= num + 1;
paintbox3.Canvas.Brush.Color := clred;
paintbox3.Canvas.Rectangle(1, I*34 ,1+33, (I*34)+33);
end;

procedure tform1.piscalinhavolta(num:integer);
var
I : integer;
begin
I:= num + 1;
paintbox3.Canvas.Brush.Color := clwhite;
paintbox3.Canvas.Rectangle(1, I*34 ,1+33, (I*34)+33);
end;




procedure tform1.PoePlacar;
var
texto : string;
linha,coluna, num : integer;
begin
for coluna:=1 to 16 do
Begin
 for linha:=1 to 5 do
 begin
 paintbox1.Canvas.Pen.Width := 1;
 paintbox1.Canvas.Pen.Style := psSolid;
 IF coluna = 1 then  paintbox1.Canvas.Brush.Color:=clgreen else
 paintbox1.Canvas.Brush.Color:=clyellow;
 paintbox1.Canvas.Pen.Color:= clblack;
 paintbox1.Canvas.Rectangle(Coluna*34, Linha*34 ,(Coluna*34)+33, (Linha*34)+33);

 paintbox1.Canvas.Font.Size := 16;
 paintbox1.Canvas.Font.Style := [fsbold];
 IF Coluna = 1 then
    Begin
    case linha of
    1:texto:='B';
    2:texto:='I';
    3:texto:='N';
    4:texto:='G';
    5:texto:='O';
    end;
    paintbox1.Canvas.font.Color := clyellow;
    paintbox1.canvas.TextOut((Coluna*34)+5,(Linha*34)+5,texto);
    end
    else
    begin
    paintbox1.Canvas.font.Color := clblack;
    num := (coluna-1)+((linha-1)*15);
    cartcol[num] := Coluna*34;
    cartlin[num] := Linha*34;
    paintbox1.canvas.TextOut((Coluna*34)+5,(Linha*34)+5,inttostr(num));
    end;
 end;
end;

end;



procedure tform1.Pintacartela;
var
texto : string;
linha,coluna, num : integer;
begin
for coluna:=1 to 5 do
Begin
 for linha:=1 to 6 do
 begin
 paintbox2.Canvas.Pen.Width := 1;
 paintbox2.Canvas.Pen.Style := psSolid;
 IF linha = 1 then  paintbox2.Canvas.Brush.Color:=clgreen else
 paintbox2.Canvas.Brush.Color:=clyellow;
 paintbox2.Canvas.Pen.Color:= clblack;
 IF (coluna = 3) and (linha = 4) then  paintbox2.Canvas.Brush.Color:=clgreen;
 paintbox2.Canvas.Rectangle(Coluna*34, Linha*34 ,(Coluna*34)+33, (Linha*34)+33);

 paintbox2.Canvas.Font.Size := 16;
 paintbox2.Canvas.Font.Style := [fsbold];
 IF linha = 1 then
    Begin
    case coluna of
    1:texto:='B';
    2:texto:='I';
    3:texto:='N';
    4:texto:='G';
    5:texto:='O';
    end;
    paintbox2.Canvas.font.Color := clyellow;
    paintbox2.canvas.TextOut((Coluna*34)+5,(Linha*34)+5,texto);
    end;

 end;
end;

end;





procedure TForm1.FormCreate(Sender: TObject);
var
Lin, colu, placar,I : integer;
begin

total := 0;
venceu:= 0;
perdeu:= 0; 

automa := false;

ganhou := 0;
jogou  := 0;

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

cartela := Tbits.create;
cartela.size := 76;



for Lin:=0 to 4 do
Begin
  For Colu:=1 to 15 do
  Begin
   placar :=  colu+((lin*15));
 {  Resu.cells[colu,lin] := inttostr(colu+((lin*15)));  }
   sortCol[placar] := colu;
   sortLin[placar] := lin;
  end;
end;


end;

procedure TForm1.Button2Click(Sender: TObject);
var
I,K : integer;
Texto : string;
begin


button1.enabled := true;
timer1.enabled := false;

poeplacar;
pintacoluna;

For I:=1 to 75 do
Begin
IF I < 6 then
Begin
deucol[I]  := 0;
deulin[I]  := 0;
deulin[3]  := 1;
deucol[3]  := 1;
end;
colnum[I]  := 0;
linnum[I]  := 0;
sortlin[I] := -1;
sortcol[I] := -1;
cartela.bits[I]  := false;
end;


timer1.enabled := true;


     For K:=1 to 5 do
     begin
     Joga(K);
     For I:=1 to 5 do
        Begin
        paintbox2.Canvas.Pen.Width := 1;
        paintbox2.Canvas.Pen.Style := psSolid;
        paintbox2.Canvas.Brush.Color:=clyellow;
        IF (I+1 = 4) and (K =3) then
            Begin
            end
            else
            begin
            paintbox2.Canvas.Rectangle(K*34, (I+1)*34 ,(K*34)+33, ((I+1)*34)+33);
            end;
        paintbox2.Canvas.Font.color := clblack;
        paintbox2.Canvas.Font.Size := 16;
        paintbox2.Canvas.Font.Style := [fsbold];
        IF (I+1 = 4) and (K =3) then
            begin
            end
            else
            begin
            sortcol[gerado[I]] := K*34;
            sortlin[gerado[I]] := (I+1)*34;
            cartela.bits[gerado[I]] := true;
            paintbox2.Canvas.Textout((K*34)+5, ((I+1)*34)+5, inttostr(gerado[I]));
            linnum[gerado[I]] := I+1;
            colnum[gerado[I]] := K;
            end;

        {resul.cells[K-1,I] := inttostr(gerado[I]);
        resul.cells[2,3] := ''; }
        gerado[I]:=0;
        end;
     end;

end;




procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
bitis.free;
cartela.free;
sorteado.free;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
num,I,poe, K : integer;
texto, monta : string;
begin


jogou := jogou + 1;
total := total - 1;

statusbar1.panels[0].text := 'jogadas : '+inttostr(jogou);
statusbar1.refresh;

for I:=1 to 75 do
Begin
sorteado.bits[I] := false;
end;



for I:=1 to 5 do
Begin
deucol[I]  := 0;
deulin[I]  := 0;
deulin[3]  := 1;
deucol[3]  := 1;
end;


poeplacar;
pintacoluna;




For I:=1 to 75 do
Begin

IF linnum[I] > 0 then
   Begin
   K:= colnum[I];
   paintbox2.canvas.brush.color := clyellow;
   paintbox2.Canvas.Rectangle(K*34, (linnum[I])*34 ,(K*34)+33, ((linnum[I])*34)+33);
   paintbox2.Canvas.Font.color := clblack;
   paintbox2.Canvas.Font.Size := 16;
   paintbox2.Canvas.Font.Style := [fsbold];
   paintbox2.Canvas.Textout((K*34)+5, ((linnum[I])*34)+5, inttostr(I));
   end;



end;






paintbox4.Canvas.Pen.Width := 1;
paintbox4.Canvas.Pen.Style := psSolid;
paintbox4.Canvas.Brush.Color:=clyellow;
paintbox4.Canvas.Rectangle(1, 34 ,34, 68);
paintbox4.canvas.Font.Size := 18;
paintbox4.canvas.Font.color := clblack;
paintbox4.Canvas.textout(5, 37,'25');




button1.enabled := false;
button2.Enabled := false;

For I:=1 to 75 do
Begin
sorteado.bits[I] := false;
end;



I:=0;
repeat
num :=sorteio;
IF sorteado.bits[num] then
   Begin

    pintanum(num);

    IF cartela.bits[num] then pintacartelanum(num);



    sleep(600);
    I:=I+1;

    paintbox4.canvas.Font.Size := 18;
    paintbox4.canvas.Font.color := clblack;
    poe := 25 - I;
    if poe < 10 then
       begin
       texto := '0'+inttostr(poe);
       end
       else
       begin
       texto :=inttostr(poe);
       end;
    paintbox4.Canvas.textout(5, 37, texto);

   end;
until I=25;

button2.enabled := true;
button1.enabled := true;


For I:=1 to 5 do
Begin
IF deulin[I] = 5 then
   Begin
   ganhou := ganhou + 1;
   deu := true;
   statusbar1.panels[1].text := 'Ganhou : '+inttostr(ganhou);
   statusbar1.refresh;
   break;
   end;
end;


IF not deu then
Begin
perdeu := perdeu + 1;
edit2.text := inttostr(perdeu);
edit2.Refresh;
end
else
begin
 venceu := venceu + 1;
 deu := false;
 edit3.text := inttostr(venceu);
 edit3.refresh;
end;

IF total > 0 then
Begin

IF automa then
 button1click(self);

end
else
begin
automa := false;

monta := '';

For I:=1 to 75 do
Begin
if cartela.bits[I] = true then
  Begin
   monta := monta+' '+inttostr(I);
  end;
end;

combobox1.items.add('Jogou='+edit1.text+' Ganhou='+inttostr(venceu)+' Perdeu='+inttostr(perdeu)+
                    ' Cartela='+monta);
combobox1.ItemIndex := combobox1.Items.count - 1;


total:=0;
venceu:=0;
perdeu:=0;
edit1.text := '0';
edit2.text := '0';
edit3.text := '0';
end;


end;

procedure TForm1.FormShow(Sender: TObject);
begin
poeplacar;
button2click(self);
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
poeplacar;
pintacartela;
pintacoluna;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
I : integer;
begin

Timer1.enabled := false;

For I:=1 to 5 do
Begin

IF deulin[I] = 5 then
   Begin
   piscalinha(I);
   sleep(250);
   piscalinhavolta(I);
   sleep(250);
   piscalinha(I);
   end;

timer1.enabled := true;


end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
timer1.enabled := false;
close;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin

IF edit1.text = '' then
Begin
showmessage('Precisa digitar a quantidade de jogadas');
exit;
end;
total := strtoint(edit1.text);
automa := true;

end;

procedure TForm1.Button5Click(Sender: TObject);
begin
IF savedialog1.execute then
Begin
combobox1.Items.SaveToFile(savedialog1.filename);
end;


end;

end.
