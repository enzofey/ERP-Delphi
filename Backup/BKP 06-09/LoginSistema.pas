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
    lblUsuario: TLabel;
    lblSenha: TLabel;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    btnEntrar: TButton;
    btnFechar: TButton;
    lblEmpresa: TLabel;
    CBoxEmpresa: TComboBox;
    procedure btnEntrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure CBoxEmpresaDropDown(Sender: TObject);
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
 empresa := CBoxEmpresa.text;

 CadUsuarioDM.LoginQuery.SQL.Clear;
 CadUsuarioDM.LoginQuery.SQL.Text :=
 'select * from usuario where usuario = :usuario';
 CadUsuarioDM.LoginQuery.ParamByName('usuario').AsString := usuario;
 CadUsuarioDM.LoginQuery.Open;

 if CadUsuarioDM.LoginQuery.IsEmpty then begin
 ShowMessage('Usuário não encontrado!');
 end
 else begin

 CadUsuarioDM.LoginQuery.SQL.Clear;
 CadUsuarioDM.LoginQuery.SQL.Text :=
 'select * from usuario where usuario = :usuario and senha = :senha';
 CadUsuarioDM.LoginQuery.ParamByName('usuario').AsString := usuario;
 CadUsuarioDM.LoginQuery.ParamByName('senha').AsString := GerarHashMD5(senha);
 CadUsuarioDM.LoginQuery.Open;

 if CBoxEmpresa.Text = '' then begin
 ShowMessage('Nenhuma empresa selecionada!');
 end
 else begin

 if not CadUsuarioDM.LoginQuery.IsEmpty then begin
 UsuarioLogado := usuario;
 EmpresaLogada := CBoxEmpresa.text;
 ModalResult := mrOk;
 end
 else begin
 ShowMessage('Usuário ou senha incorretos!');
 end;
end;
end;
end;

procedure TLogin.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TLogin.CBoxEmpresaDropDown(Sender: TObject);
begin
  CBoxEmpresa.Items.Clear;

  CadEmpresaDM.CBEmpresa.Close;
  CadEmpresaDM.CBEmpresa.Open;

  while not CadEmpresaDM.CBEmpresa.Eof do
  begin
    CBoxEmpresa.Items.Add(CadEmpresaDM.CBEmpresa.FieldByName('EMP_ID').AsString);
    CadEmpresaDM.CBEmpresa.Next;
  end;
  CadEmpresaDM.CBEmpresa.Close;
end;
end.
