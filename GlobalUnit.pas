unit GlobalUnit;

interface

uses System.SysUtils, FireDAC.Phys.PG;

var UsuarioLogado: String;
var EmpresaLogada: String;
var FDPhysPgDriverLinkGlobal: TFDPhysPgDriverLink;

procedure InitializeFD;

implementation

procedure InitializeFD;
begin
  if not Assigned(FDPhysPgDriverLinkGlobal) then
    FDPhysPgDriverLinkGlobal := TFDPhysPgDriverLink.Create(nil);

  FDPhysPgDriverLinkGlobal.VendorLib := ExtractFilePath(ParamStr(0)) + 'libpq.dll';
end;
end.
