unit LoginSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, System.Hash, IdHashMessageDigest, IdGlobal,
  Vcl.Grids,
  UsuarioDM,
  EmpresaDM;

type
  TLogin = class(TForm)
    Panel1: TPanel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    btnEntrar: TButton;
    btnFechar: TButton;
    CBEmpresa: TComboBox;
    Image: TImage;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure CBEmpresaDropDown(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Login: TLogin;

implementation

{$R *.dfm}

Uses MenuPrincipal, GlobalUnit;

function GerarHashMD5(const Senha: string): string;
var
  Hash: TIdHashMessageDigest5;
begin
  Hash := TIdHashMessageDigest5.Create;
  try
    Result := Hash.HashStringAsHex(Senha, IndyTextEncoding_UTF8);
  finally
    Hash.Free;
  end;
end;

procedure TLogin.btnEntrarClick(Sender: TObject);
var usuario, senha, empresa: string;
begin
 usuario := edtusuario.Text;
 senha := edtsenha.Text;
 empresa := CBEmpresa.text;

 with CadUsuarioDM.qryLogin do
 begin
  SQL.Clear;
  SQL.Add('select * from usuario where usuario = :usuario');
  ParamByName('usuario').AsString := usuario;
  Open;

  if IsEmpty then begin
   ShowMessage('Usuário não encontrado!');
   Abort;
  end;

  SQL.Clear;
  SQL.Add('select * from usuario where usuario = :usuario and senha = :senha');
  ParamByName('usuario').AsString := usuario;
  ParamByName('senha').AsString := GerarHashMD5(senha);
  Open;

  if CBEmpresa.Text = '' then begin
   ShowMessage('Nenhuma empresa selecionada!');
   Abort;
  end;

  if not IsEmpty then begin
   UsuarioLogado := usuario;
   EmpresaLogada := COPY(CBEmpresa.text,1,1);
   ModalResult := mrOk;
  end
  else begin
   ShowMessage('Usuário ou senha incorretos!');
  end;
 end;
end;

procedure TLogin.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TLogin.CBEmpresaDropDown(Sender: TObject);
begin
  CBEmpresa.Items.Clear;

  CadEmpresaDM.CBEmpresa.Close;
  CadEmpresaDM.CBEmpresa.Open;

  while not CadEmpresaDM.CBEmpresa.Eof do
  begin
    CBEmpresa.Items.Add(CadEmpresaDM.CBEmpresa.FieldByName('EMPRESA').AsString);
    CadEmpresaDM.CBEmpresa.Next;
  end;
  CadEmpresaDM.CBEmpresa.Close;
end;
end.
