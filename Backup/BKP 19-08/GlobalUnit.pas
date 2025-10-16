unit GlobalUnit;

interface

var UsuarioLogado: String;
var EmpresaLogada: String;
procedure FecharTela(Sender: TObject);

implementation

Uses Vcl.ComCtrls, Vcl.Controls;

procedure FecharTela(Sender: TObject);
var
  Ctrl: TControl;
begin
  if not (Sender is TControl) then
    Exit;
  Ctrl := TControl(Sender);
  while Assigned(Ctrl.Parent) do
  begin
    if Ctrl.Parent is TTabSheet then
    begin
      (Ctrl.Parent as TTabSheet).Free;
      Exit;
    end;
    Ctrl := Ctrl.Parent;
  end;
end;

end.
