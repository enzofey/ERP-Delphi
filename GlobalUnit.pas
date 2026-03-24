unit GlobalUnit;

interface

uses System.SysUtils, System.Classes, FireDAC.Phys.PG, Vcl.Forms, Vcl.Dialogs, FireDAC.Comp.Client;

var UsuarioLogado: String;
var EmpresaLogada: String;
var FDPhysPgDriverLinkGlobal: TFDPhysPgDriverLink;

procedure InitializeFD;
function GetConfig(const Key: string): string;
procedure ConfigurarConexao(Conn: TFDConnection);

implementation

procedure InitializeFD;
begin
  if not Assigned(FDPhysPgDriverLinkGlobal) then
    FDPhysPgDriverLinkGlobal := TFDPhysPgDriverLink.Create(nil);

  FDPhysPgDriverLinkGlobal.VendorLib := ExtractFilePath(ParamStr(0)) + 'libpq.dll';
end;

function GetConfig(const Key: string): string;
var
  SL: TStringList;
  ConfigFile: string;
begin
  Result := '';
  ConfigFile := ExtractFilePath(ParamStr(0)) + 'config.txt';

  if not FileExists(ConfigFile) then
  begin
    ShowMessage('Arquivo config.txt não encontrado!');
    Halt;
  end;

  SL := TStringList.Create;
  try
    SL.LoadFromFile(ConfigFile);

    if SameText(Key, 'IP') then
      Result := Trim(SL.Values['IP'])
    else if SameText(Key, 'PORTA') then
      Result := Trim(SL.Values['PORTA'])
    else if SameText(Key, 'DataBase') then
      Result := Trim(SL.Values['DataBase'])
    else if SameText(Key, 'User_Name') then
      Result := Trim(SL.Values['User_Name'])
    else if SameText(Key, 'Password') then
      Result := Trim(SL.Values['Password']);

  finally
    SL.Free;
  end;
end;

procedure ConfigurarConexao(Conn: TFDConnection);
var
  IP, Porta, DataBase, User_Name, Password: string;
begin
  if Conn = nil then
    Exit;

  IP := GetConfig('IP');
  Porta := GetConfig('PORTA');
  User_Name := GetConfig('User_Name');
  Password := GetConfig('Password');
  DataBase := GetConfig('DataBase');

  if (IP = '') or (Porta = '') or (DataBase = '') or (User_Name = '') or (Password = '') then
  begin
    ShowMessage('Configuração do config.txt está incorreta, favor verificar!');
    Halt;
  end;

  if Conn.Connected then
    Conn.Connected := False;

  Conn.Params.Values['Server'] := IP;
  Conn.Params.Values['Port'] := Porta;
  Conn.Params.Values['User_Name'] := User_Name;
  Conn.Params.Values['Password'] := Password;
  Conn.Params.Values['DataBase'] := DataBase;
end;
end.
