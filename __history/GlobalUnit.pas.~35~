unit GlobalUnit;

interface

var UsuarioLogado: String;
var EmpresaLogada: String;
procedure FecharTela(Sender: TObject);

implementation

Uses System.SysUtils, Vcl.ComCtrls, Vcl.Controls, Vcl.Forms;

procedure FecharTela(Sender: TObject);
begin
  // Verifica se o Sender é um controle TControl e se seu Parent é uma TTabSheet
  if (Sender is TControl) and (TControl(Sender).Parent is TTabSheet) then
    TTabSheet(TControl(Sender).Parent).Free;
end;
end.
